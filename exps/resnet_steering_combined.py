"""ResNets for Steering Prediction.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os
import cPickle as pickle

from sacred import Experiment

import numpy as np
import h5py
from keras.models import load_model

import spiker
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
        X_test = dataset["test_data"][
            :, :, :, channel_id][()][..., np.newaxis].astype("float32")/255.
    else:
        X_test = dataset["test_data"][()].astype("float32")/255.

    Y_test = dataset["test_target"][()]

    dataset.close()

    print("[MESSAGE] Number of test samples %d" % (X_test.shape[0]))

    # Build model
    print ("[MESSAGE] Model is compiled.")
    model_file = model_file_base + "-best.hdf5"
    model = load_model(model_file)

    Y_predict = model.predict(X_test)

    with open(model_file_base+"-prediction.pkl", "wb") as f:
        pickle.dump([Y_test, Y_predict], f)
