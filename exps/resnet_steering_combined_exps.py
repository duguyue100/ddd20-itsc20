"""ResNets for Steering Prediction.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os

from sacred import Experiment

import numpy as np
import h5py
from keras.callbacks import ModelCheckpoint
from keras.callbacks import CSVLogger

import spiker
from spiker.models import resnet
from spiker.data import ddd17

exp = Experiment("ResNet - Steering - Experiment")

exp.add_config({
    "model_name": "",  # the model name
    "data_name": "",  # the data name
    "channel_id": 0,  # which channel to chose, 0: dvs, 1: aps, 2: both
    "stages": 0,  # number of stages
    "blocks": 0,  # number of blocks of each stage
    "filter_list": [],  # number of filters per stage
    "nb_epoch": 0,  # number of training epochs
    "batch_size": 0,  # batch size
    })


@exp.automain
def resnet_exp(model_name, data_name, channel_id, stages, blocks, filter_list,
               nb_epoch, batch_size):
    """Perform ResNet experiment."""
    model_path = os.path.join(spiker.HOME, "data", "exps", "ral-exps",
                              model_name)
    if not os.path.isdir(model_path):
        os.makedirs(model_path)
    else:
        raise ValueError("[MESSAGE] This experiment has been done before."
                         " Create a new config model if you need.")
    model_file_base = os.path.join(model_path, model_name)

    # print model info
    print("[MESSAGE] Model Name: %s" % (model_name))
    print("[MESSAGE] Number of epochs: %d" % (nb_epoch))
    print("[MESSAGE] Batch Size: %d" % (batch_size))
    print("[MESSAGE] Number of stages: %d" % (stages))
    print("[MESSAGE] Number of blocks: %d" % (blocks))

    # load data
    data_path = os.path.join(spiker.HOME, "data", "exps", "data", "ddd17",
                             data_name)
    if not os.path.isfile(data_path):
        raise ValueError("This dataset does not exist at %s" % (data_path))
    print("[MESSAGE] Dataset %s" % (data_path))

    dataset = h5py.File(data_path, "r")

    if channel_id != 2:
        X_train = dataset["train_data"][
            :, :, :, channel_id][()][..., np.newaxis].astype("float32")/255.
        X_test = dataset["test_data"][
            :, :, :, channel_id][()][..., np.newaxis].astype("float32")/255.
    else:
        X_train = dataset["train_data"][()].astype("float32")/255.
        X_test = dataset["test_data"][()].astype("float32")/255.

    num_samples = X_train.shape[0]

    Y_train = dataset["train_target"][()]
    Y_test = dataset["test_target"][()]

    dataset.close()

    print("[MESSAGE] Number of samples %d" % (num_samples))
    print("[MESSAGE] Number of train samples %d" % (X_train.shape[0]))
    print("[MESSAGE] Number of test samples %d" % (X_test.shape[0]))

    # setup image shape
    input_shape = (X_train.shape[1], X_train.shape[2], X_train.shape[3])

    # Build model
    model = resnet.resnet_builder(
        model_name=model_name, input_shape=input_shape,
        batch_size=batch_size,
        filter_list=filter_list, kernel_size=(3, 3),
        output_dim=1, stages=stages, blocks=blocks,
        bottleneck=False, network_type="regress")

    model.summary()
    model.compile(loss='mean_squared_error',
                  optimizer="adam",
                  metrics=["mse"])
    print ("[MESSAGE] Model is compiled.")
    model_file = model_file_base + "-best.hdf5"
    checkpoint = ModelCheckpoint(model_file,
                                 monitor='val_mean_squared_error',
                                 verbose=1,
                                 save_best_only=True,
                                 mode='min')

    csv_his_log = os.path.join(model_path, "csv_history.log")
    csv_logger = CSVLogger(csv_his_log, append=True)

    callbacks_list = [checkpoint, csv_logger]

    # training
    model.fit(
        x=X_train, y=Y_train,
        batch_size=batch_size,
        epochs=nb_epoch,
        validation_data=(X_test, Y_test),
        callbacks=callbacks_list)
