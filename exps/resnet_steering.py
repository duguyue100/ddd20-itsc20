"""ResNets for Steering Prediction.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os
import cPickle as pickle

from sacred import Experiment

import h5py
import numpy as np
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
    "frame_cut": [],  # cut frames
    })


@exp.automain
def resnet_exp(model_name, data_name, channel_id, stages, blocks, filter_list,
               nb_epoch, batch_size, frame_cut):
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
    assert len(frame_cut) == 2
    print("[MESSAGE] Frame cut: first at %d, last at %d"
          % (frame_cut[0]*2, -frame_cut[1]*2))
    frames, steering = ddd17.prepare_train_data(
        data_path, y_name="steering",
        frame_cut=[frame_cut[0]*2, frame_cut[1]*2],
        speed_threshold=15.)
    num_samples = frames.shape[0]
    num_train = int(num_samples*0.7)

    # save the training files
    save_path = os.path.join(spiker.HOME, "data", "exps", "data", "ddd17")
    train_file_name = os.path.join(save_path, model_name+".hdf5")
    # only save once
    if not os.path.isfile(train_file_name):
        save_data = h5py.File(train_file_name, "w")
        train_group = save_data.create_group("train")
        test_group = save_data.create_group("test")

        train_group.create_dataset(
            name="frame", data=frames[:num_train], dtype=np.uint8)
        train_group.create_dataset(
            name="steering", data=steering[:num_train], dtype=np.float32)

        test_group.create_dataset(
            name="frame", data=frames[num_train:], dtype=np.uint8)
        test_group.create_dataset(
            name="steering", data=steering[num_train:], dtype=np.float32)

        save_data.flush()
        save_data.close()

    frames /= 255.
    frames -= np.mean(frames, keepdims=True)
    X_test = frames[num_train:]
    Y_test = steering[num_train:]

    del frames, steering

    if channel_id != 2:
        X_test = X_test[:, :, :, channel_id][..., np.newaxis]

    print("[MESSAGE] Number of samples %d" % (num_samples))
    print("[MESSAGE] Number of test samples %d" % (X_test.shape[0]))

    model_file = model_file_base + "-best.hdf5"
    model = load_model(model_file)

    Y_predict = model.predict(X_test)

    with open(model_file_base+"-prediction.pkl", "wb") as f:
        pickle.dump([Y_test, Y_predict], f)
