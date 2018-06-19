"""Generate results analysis for RAL

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os

import numpy as np

import spiker

num_trails = 5
conditions = ["full", "aps", "dvs"]
channel_options = {
    "full": 2,
    "aps": 1,
    "dvs": 0}


def get_subset_results(exps_root_path, lighting, num_exps):
    result_collector = {}
    rmse_collector = {}
    for cond in conditions:
        rmse_collector[cond] = []
        for idx in range(1, num_exps+1):
            model_type = "%s-%d-%s" % (lighting, idx, cond)
            result_collector[model_type] = {
                "curves": [],
                "mins": [],
                "rmses": []}
            for trail_idx in range(1, num_trails+1):
                # construct file name
                model_base = \
                    "steering-"+model_type+"-%d" % (trail_idx)
                model_path = os.path.join(
                    exps_root_path, model_base, "csv_history.log")

                curve = np.loadtxt(
                    model_path, delimiter=",", skiprows=1)
                assert curve.shape[0] == 200
                result_collector[model_type]["curves"].append(curve)
                min_mse = np.min(curve[:, 4])
                min_rmse = np.sqrt(min_mse)*180/np.pi
                result_collector[model_type]["mins"].append(min_mse)
                result_collector[model_type]["rmses"].append(min_rmse)
                rmse_collector[cond].append(min_rmse)
            # print 5 trails of each experiments
            print ("%s - mean %.6f %.6f"
                   % (model_type,
                      np.mean(result_collector[model_type]["rmses"]),
                      np.std(result_collector[model_type]["rmses"])))
        # print for each condition
        print ("%s - mean %.6f %.6f"
               % (cond, np.mean(rmse_collector[cond]),
                  np.std(rmse_collector[cond])))

    return result_collector, rmse_collector


def get_results(exps_root_path):
    """Get results."""

    night_results, night_rmse = get_subset_results(
        exps_root_path, "night", 15)
    day_results, day_rmse = get_subset_results(exps_root_path, "day", 15)

    rmse_collector = {}
    for cond in conditions:
        rmse_collector[cond] = night_rmse[cond]+day_rmse[cond]
        print ("All experiments - RMSE - %s - %.6f %.6f"
               % (cond, np.mean(rmse_collector[cond]),
                  np.std(rmse_collector[cond])))

    return night_results, day_results, rmse_collector


options = "get-mean-std"

if options == "get-mean-std":
    exps_root_path = os.path.join(spiker.HOME, "data", "exps", "ral-exps")
    night_results, day_results, rmses = get_results(
        exps_root_path)
