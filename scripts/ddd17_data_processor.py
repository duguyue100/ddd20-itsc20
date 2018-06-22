"""DDD17 data processor.

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import

import os

import numpy as np
import h5py

import spiker
from spiker.data import ddd17
import matplotlib.pyplot as plt

data_root_path = os.path.join(
    spiker.HOME, "data", "exps", "data", "ddd17")

num_trails = 5

conditions = ["full", "aps", "dvs"]
channel_options = {
    "full": 2,
    "aps": 1,
    "dvs": 0}

data_list = [
    "rec1499656391_export.hdf5",
    "rec1499657850_export.hdf5",
    "rec1501649676_export.hdf5",
    "rec1501650719_export.hdf5",
    "rec1501994881_export.hdf5",
    "rec1502336427_export.hdf5",
    "rec1502337436_export.hdf5",
    "rec1498946027_export.hdf5",
    "rec1501651162_export.hdf5",
    "rec1499025222_export.hdf5",
    "rec1502338023_export.hdf5",
    "rec1502338983_export.hdf5",
    "rec1502339743_export.hdf5",
    "rec1498949617_export.hdf5",
    "rec1502599151_export.hdf5",
    "rec1500220388_export.hdf5",
    "rec1500383971_export.hdf5",
    "rec1500402142_export.hdf5",
    "rec1501288723_export.hdf5",
    "rec1501349894_export.hdf5",
    "rec1501614399_export.hdf5",
    "rec1502241196_export.hdf5",
    "rec1502825681_export.hdf5",
    "rec1499023756_export.hdf5",
    "rec1499275182_export.hdf5",
    "rec1499533882_export.hdf5",
    "rec1500215505_export.hdf5",
    "rec1500314184_export.hdf5",
    "rec1500329649_export.hdf5",
    "rec1501953155_export.hdf5"]

frame_cuts = [
    [2000, 4000],
    [2600, 1200],
    [500, 500],
    [500, 500],
    [200, 800],
    [100, 400],
    [100, 400],
    [3000, 1000],
    [850, 4500],
    [200, 1500],
    [200, 1500],
    [200, 2500],
    [200, 1500],
    [1000, 2200],
    [1500, 3000],
    [500, 200],
    [500, 1000],
    [200, 2000],
    [200, 1000],
    [200, 1500],
    [200, 1500],
    [500, 1000],
    [500, 1700],
    [800, 2000],
    [200, 1000],
    [500, 800],
    [200, 2200],
    [500, 500],
    [200, 600],
    [500, 1500]]

# load steering and speed
all_train_steering = np.zeros((0,))
for data_idx in xrange(30):
    # get path
    data_path = os.path.join(data_root_path, data_list[data_idx])
    print("Reading %s" % (data_path))

    # get steering
    train_steering = ddd17.prepare_train_data(
        data_path, y_name="steering", only_y=True,
        frame_cut=[frame_cuts[data_idx][0]*2, frame_cuts[data_idx][1]*2],
        data_portion="train",
        speed_threshold=15, data_type="float32")
    print ("Number of instance: %d" % (train_steering.shape[0]))

    all_train_steering = np.append(all_train_steering, train_steering, axis=0)

print ("Total number of instances: %d" % (all_train_steering.shape[0]))

steering_mean = np.mean(all_train_steering)
three_sigma = np.std(all_train_steering)*3
high_threshold = steering_mean+three_sigma
low_threshold = steering_mean-three_sigma

# filter high degrees
filter_inds = np.logical_and(
    all_train_steering < high_threshold,
    all_train_steering > low_threshold)
all_train_steering = all_train_steering[filter_inds]
print ("Total number of instances: %d" % (all_train_steering.shape[0]))

# filter small degree
small_degree = 5.*np.pi/180.
small_filter_inds = np.logical_and(
    all_train_steering < small_degree,
    all_train_steering > -small_degree)
print ("Number of small degree %f" % (np.sum(
    small_filter_inds.astype(np.float32))))
# global false portion
false_portion = np.sum(
    small_filter_inds.astype(np.float32))/all_train_steering.shape[0]*0.3
#  print ("False portion", false_portion)
#  small_filter_inds = np.logical_and(
#      small_filter_inds,
#      np.random.choice(
#          [True, False], size=all_train_steering.shape,
#          p=[1-false_portion, false_portion]))
#  all_train_steering = all_train_steering[np.logical_not(small_filter_inds)]
#  print ("Total number of instances: %d" % (all_train_steering.shape[0]))

# prepare dataset
for data_idx in xrange(1):
    # get path
    data_path = os.path.join(data_root_path, data_list[data_idx])
    print("Reading %s" % (data_path))

    # get train dataset
    train_data, train_steering = ddd17.prepare_train_data(
        data_path, target_size=(128, 172), y_name="steering", only_y=False,
        frame_cut=[frame_cuts[data_idx][0]*2, frame_cuts[data_idx][1]*2],
        data_portion="train",
        speed_threshold=15, data_type="float32")

    # filtered out high degrees
    filter_inds = np.logical_and(
        train_steering < high_threshold,
        train_steering > low_threshold)
    train_data = train_data[filter_inds, ...]
    train_steering = train_steering[filter_inds]

    # filter out small degree
    small_filter_inds = np.logical_and(
        train_steering < small_degree,
        train_steering > -small_degree)
    small_filter_inds = np.logical_and(
        small_filter_inds,
        np.random.choice(
            [True, False], size=train_steering.shape,
            p=[1-false_portion, false_portion]))
    train_data = train_data[np.logical_not(small_filter_inds), ...]
    train_steering = train_steering[np.logical_not(small_filter_inds)]
    print ("Number of Training instances:",
           train_data.shape[0], train_steering.shape[0])

    # get testing data
    test_data, test_steering = ddd17.prepare_train_data(
        data_path, target_size=(128, 172), y_name="steering", only_y=False,
        frame_cut=[frame_cuts[data_idx][0]*2, frame_cuts[data_idx][1]*2],
        data_portion="test",
        speed_threshold=None, data_type="float32")
    print ("Number of testing instances:",
           test_data.shape[0], test_steering.shape[0])

    # output data
    out_data_path = os.path.join(
        data_root_path, "dataset-%d.hdf5" % (data_idx+1))

    out_data = h5py.File(out_data_path, "w")
    out_data.create_dataset(
        "train_data", data=train_data, dtype="float32")
    out_data.create_dataset(
        "train_target", data=train_steering, dtype="float32")
    out_data.create_dataset(
        "test_data", data=test_data, dtype="float32")
    out_data.create_dataset(
        "test_target", data=test_steering, dtype="float32")
    out_data.close()
    print ("Data saved at %s" % (out_data_path))
