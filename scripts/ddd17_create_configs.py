"""DDD17+ create configs.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os
from os.path import join

import json

import spiker

# configure path
config_path = os.path.join(
    spiker.HOME, "workspace", "ddd17-cvpr", "exps", "configs",
    "ral-exps")

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
    [500, 800],
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

experiment_id = 1
for trail_idx in range(1, num_trails+1):
    # for night
    for idx in range(1, 16):
        # for each condition
        for cond in conditions:
            # construct file name
            model_base = \
                "steering-night-%d-%s-%d" % (idx, cond, trail_idx)

            steering_dict = {}
            steering_dict["model_name"] = model_base
            steering_dict["data_name"] = data_list[idx-1]
            steering_dict["channel_id"] = channel_options[cond]
            steering_dict["stages"] = 3
            steering_dict["blocks"] = 5
            steering_dict["filter_list"] = \
                [[16, 16, 16], [32, 32, 32], [64, 64, 64]]
            steering_dict["nb_epoch"] = 200
            steering_dict["batch_size"] = 64
            steering_dict["frame_cut"] = frame_cuts[idx-1]

            with open(join(config_path, model_base+".json"), "w") as f:
                json.dump(steering_dict, f)
                f.close()

            print ("ral-experiment-%d:" % (experiment_id))
            print ("	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) "
                   "python ./exps/resnet_steering.py with "
                   "./exps/configs/ral-exps/"+model_base+".json\n")
            experiment_id += 1
    # for day
    for idx in range(1, 16):
        # for each condition
        for cond in conditions:
            # construct file name
            model_base = \
                "steering-day-%d-%s-%d" % (idx, cond, trail_idx)

            steering_dict = {}
            steering_dict["model_name"] = model_base
            steering_dict["data_name"] = data_list[idx+14]
            steering_dict["channel_id"] = channel_options[cond]
            steering_dict["stages"] = 3
            steering_dict["blocks"] = 5
            steering_dict["filter_list"] = \
                [[16, 16, 16], [32, 32, 32], [64, 64, 64]]
            steering_dict["nb_epoch"] = 200,
            steering_dict["batch_size"] = 64
            steering_dict["frame_cut"] = frame_cuts[idx+14]

            with open(join(config_path, model_base+".json"), "w") as f:
                json.dump(steering_dict, f)
                f.close()

            print ("ral-experiment-%d:" % (experiment_id))
            print ("	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) "
                   "python ./exps/resnet_steering.py with "
                   "./exps/configs/ral-exps/"+model_base+".json\n")
            experiment_id += 1
