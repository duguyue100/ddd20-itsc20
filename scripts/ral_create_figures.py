"""Generate results analysis for RAL

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os
import cPickle as pickle

import numpy as np
from sklearn.metrics import explained_variance_score, mean_squared_error

import matplotlib.pyplot as plt

import spiker

num_trails = 5
conditions = ["full", "aps", "dvs"]
channel_options = {
    "full": 2,
    "aps": 1,
    "dvs": 0}


def get_subset_results(exps_root_path, lighting,
                       get_eva=False):
    result_collector = {}
    rmse_collector = {}
    for cond in conditions:
        rmse_collector[cond] = []
        rmse_collector[cond+"_eva"] = []
        #  for idx in range(1, num_exps+1):
        model_type = "%s-%s" % (lighting, cond)
        result_collector[model_type] = {
            "curves": [],
            "mins": [],
            "rmses": [],
            "eva": [],
            "true_var": []}
        for trail_idx in range(1, num_trails+1):
            # construct file name
            model_base = \
                model_type+"-%d" % (trail_idx)
            model_path = os.path.join(
                exps_root_path, model_base, "csv_history.log")

            # read result
            if get_eva is True:
                result_path = os.path.join(
                    exps_root_path, model_base,
                    model_base+"-prediction.pkl")
                with open(result_path, "rb") as f:
                    data = pickle.load(f)

                Y_true = data[0][:, 0]
                Y_predict = data[1][:, 0]

                # try to filter large angle
                Y_true_mean = np.mean(Y_true)
                Y_true_std = np.std(Y_true)
                filter_idx = np.logical_and(
                    Y_true > (Y_true_mean-3*Y_true_std),
                    Y_true < (Y_true_mean+3*Y_true_std))

                Y_true = Y_true[filter_idx]
                Y_predict = Y_predict[filter_idx]
                time = np.arange(Y_true.shape[0])/20.

                #  plt.figure()
                #  plt.plot(time, Y_true, "r", label="ground truth")
                #  plt.plot(time, Y_predict, "g", label="prediction")
                #  plt.title(model_base)
                #  plt.xticks(fontsize=16)
                #  plt.yticks(fontsize=16)
                #  plt.xlabel("time (s)", fontsize=16)
                #  plt.ylabel("steering angle (degree)", fontsize=16)
                #  plt.legend(fontsize=16)
                #  plt.show()

                #  eva_score = 1-np.var(Y_true-Y_predict)/np.var(Y_true)
                eva_score = explained_variance_score(Y_true, Y_predict)
                #  result_collector[model_type]["y_true"] = Y_true
                #  result_collector[model_type]["y_pred"] = Y_predict
                result_collector[model_type]["eva"].append(eva_score)
                result_collector[model_type]["true_var"].append(
                    np.std(Y_true))
                rmse_collector[cond+"_eva"].append(eva_score)

            # read loss
            curve = np.loadtxt(
                model_path, delimiter=",", skiprows=1)
            #  assert curve.shape[0] == 200
            result_collector[model_type]["curves"].append(curve)
            min_mse = np.min(curve[:, 4])
            min_rmse = np.sqrt(min_mse)*180/np.pi
            if get_eva is True:
                min_rmse = mean_squared_error(Y_true, Y_predict)
                min_rmse = np.sqrt(min_rmse)*180/np.pi
            result_collector[model_type]["mins"].append(min_mse)
            result_collector[model_type]["rmses"].append(min_rmse)
            rmse_collector[cond].append(min_rmse)

        # print 5 trails of each experiments
        if get_eva is False:
            print ("%s - RMSE mean %.6f %.6f"
                   % (model_type,
                      np.mean(result_collector[model_type]["rmses"]),
                      np.std(result_collector[model_type]["rmses"])))
        else:
            print ("%s - RMSE mean %.6f %.6f, EVA mean %.6f %.6f, std: %.6f"
            #  print ("%.6f,%.6f,%.6f,%.6f"
                   % (model_type,
                      np.mean(result_collector[model_type]["rmses"]),
                      np.std(result_collector[model_type]["rmses"]),
                      np.mean(result_collector[model_type]["eva"]),
                      np.std(result_collector[model_type]["eva"]),
                      np.mean(result_collector[model_type]["true_var"])))
    # print for each condition
    #  if get_eva is False:
    #      print ("%s - RMSE mean %.6f %.6f"
    #             % (cond, np.mean(rmse_collector[cond]),
    #                np.std(rmse_collector[cond])))
    #  else:
    #      print ("%s - EVA - mean %.6f %.6f"
    #             % (cond, np.mean(rmse_collector[cond+"_eva"]),
    #                np.std(rmse_collector[cond+"_eva"])))

    return result_collector, rmse_collector


def get_results(exps_root_path, get_eva=True):
    """Get results."""

    night_results, night_rmse = get_subset_results(
        exps_root_path, "night", get_eva=get_eva)
    day_results, day_rmse = get_subset_results(
        exps_root_path, "day", get_eva=get_eva)
    all_results, all_rmse = get_subset_results(
        exps_root_path, "all", get_eva=get_eva)

    rmse_collector = {}
    for cond in conditions:
        rmse_collector[cond] = night_rmse[cond]+day_rmse[cond]+all_rmse[cond]
        if get_eva is True:
            rmse_collector[cond+"_eva"] = night_rmse[cond+"_eva"] + \
                day_rmse[cond+"_eva"]+all_rmse[cond+"_eva"]
        if get_eva is False:
            print ("All experiments - RMSE - %s - %.6f %.6f"
                   % (cond, np.mean(rmse_collector[cond]),
                      np.std(rmse_collector[cond])))
        else:
            print ("All experiments-%s-RMSE - %.6f - %.6f - EVA - %.6f %.6f"
                   % (cond,
                      np.mean(rmse_collector[cond]),
                      np.std(rmse_collector[cond]),
                      np.mean(rmse_collector[cond+"_eva"]),
                      np.std(rmse_collector[cond+"_eva"])))

    return night_results, day_results, rmse_collector


options = "get-mean-std"

if options == "get-mean-std":
    exps_root_path = os.path.join(spiker.HOME, "data", "exps", "ral-exps")
    night_results, day_results, rmses = get_results(
        exps_root_path)
