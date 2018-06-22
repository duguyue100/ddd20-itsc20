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
    "night.hdf5",
    "day.hdf5",
    "all.hdf5"]

experiment_id = 1
for trail_idx in range(1, num_trails+1):
    # for all
    for idx in range(1, 4):
        # for each condition
        for cond in conditions:
            # construct file name
            model_base = \
                "%s-%s-%d" % (data_list[idx-1][:-5], cond, trail_idx)

            steering_dict = {}
            steering_dict["model_name"] = model_base
            steering_dict["data_name"] = data_list[idx-1]
            steering_dict["channel_id"] = channel_options[cond]
            steering_dict["stages"] = 3
            steering_dict["blocks"] = 5
            steering_dict["filter_list"] = \
                [[16, 16, 16], [32, 32, 32], [64, 64, 64]]
            steering_dict["nb_epoch"] = 200
            steering_dict["batch_size"] = 128

            with open(join(config_path, model_base+".json"), "w") as f:
                json.dump(steering_dict, f)
                f.close()

            print ("ral-experiment-combined-%d:" % (experiment_id))
            print ("	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) "
                   "python ./exps/resnet_steering_combined.py with "
                   "./exps/configs/ral-exps/"+model_base+".json\n")
            experiment_id += 1
