"""Binding data for training and testing.

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os

import h5py
import numpy as np

import spiker

# set data path
data_path = os.path.join(spiker.HOME, "data", "exps", "data", "ddd17")

mode = "all"

if mode == "night":
    start_idx = 1
    end_idx = 16
elif mode == "day":
    start_idx = 16
    end_idx = 31
elif mode == "all":
    start_idx = 1
    end_idx = 31

save_data_path = os.path.join(data_path, mode+".hdf5")
save_data = h5py.File(save_data_path, "w")

train_set = save_data.create_dataset(
    name="train_data",
    shape=(0, 128, 172, 2),
    maxshape=(None, 128, 172, 2),
    dtype="uint8")
train_target = save_data.create_dataset(
    name="train_target",
    shape=(0, 1),
    maxshape=(None, 1),
    dtype="float32")
test_set = save_data.create_dataset(
    name="test_data",
    shape=(0, 128, 172, 2),
    maxshape=(None, 128, 172, 2),
    dtype="uint8")
test_target = save_data.create_dataset(
    name="test_target",
    shape=(0, 1),
    maxshape=(None, 1),
    dtype="float32")

# looping over recordings
for rec_idx in xrange(start_idx, end_idx):
    # recording path
    rec_path = os.path.join(data_path, "dataset-{}.hdf5".format(rec_idx))

    # read file
    rec_data = h5py.File(rec_path, "r")

    num_train_data = rec_data["train_data"].shape[0]
    num_test_data = rec_data["test_data"].shape[0]

    resized_train_shape = train_set.shape[0]+num_train_data
    resized_test_shape = test_set.shape[0]+num_test_data

    # resize the shape to adapt new data
    train_set.resize(resized_train_shape, axis=0)
    train_target.resize(resized_train_shape, axis=0)
    test_set.resize(resized_test_shape, axis=0)
    test_target.resize(resized_test_shape, axis=0)

    # assign data
    train_set[-num_train_data:] = rec_data["train_data"][()].astype("uint8")
    train_target[-num_train_data:] = \
        rec_data["train_target"][()][..., np.newaxis]

    test_set[-num_test_data:] = rec_data["test_data"][()].astype("uint8")
    test_target[-num_test_data:] = \
        rec_data["test_target"][()]

    # combine data
    rec_data.close()
    print ("Binded", rec_path)

save_data.close()
