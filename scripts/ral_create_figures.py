"""Generate results analysis for RAL

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os
import cPickle as pickle
import h5py

import numpy as np
from sklearn.metrics import explained_variance_score, mean_squared_error

import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec

import spiker

num_trails = 5
conditions = ["full", "aps", "dvs"]
channel_options = {
    "full": 2,
    "aps": 1,
    "dvs": 0}


def get_subset_results(exps_root_path, lighting,
                       get_eva=False, plotting=False):
    result_collector = {}
    rmse_collector = {}
    y_collector = {}
    for cond in conditions:
        rmse_collector[cond] = []
        rmse_collector[cond+"_eva"] = []
        y_collector[cond+"_pred"] = []
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

                eva_score = explained_variance_score(Y_true, Y_predict)
                result_collector[model_type]["eva"].append(eva_score)
                result_collector[model_type]["true_var"].append(
                    np.std(Y_true))
                rmse_collector[cond+"_eva"].append(eva_score)

                y_collector[cond+"_pred"].append(Y_predict)
                y_collector[cond+"_gt"] = Y_true
                y_collector[cond+"_fi"] = filter_idx
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
                   % (model_type,
                      np.mean(result_collector[model_type]["rmses"]),
                      np.std(result_collector[model_type]["rmses"]),
                      np.mean(result_collector[model_type]["eva"]),
                      np.std(result_collector[model_type]["eva"]),
                      np.mean(result_collector[model_type]["true_var"])))

    for cond in conditions:
        arr_pred = np.array(y_collector[cond+"_pred"])
        y_collector[cond+"_pred"] = \
            np.mean(arr_pred, axis=0)
        y_collector[cond+"_pred_std"] = \
            np.std(arr_pred, axis=0)

        if plotting is True:
            Y_true = y_collector[cond+"_gt"]
            Y_true = Y_true[y_collector[cond+"_fi"]]
            Y_predict = y_collector[cond+"_pred"]
            Y_predict = Y_predict[y_collector[cond+"_fi"]]
            time = np.arange(Y_predict.shape[0])/20.

            plt.figure()
            plt.plot(time, Y_true, "r", label="ground truth")
            plt.plot(time, Y_predict, "g", label="prediction")
            plt.title(lighting+" "+cond)
            plt.xticks(fontsize=16)
            plt.yticks(fontsize=16)
            plt.xlabel("time (s)", fontsize=16)
            plt.ylabel("steering angle (degree)", fontsize=16)
            plt.legend(fontsize=16)
            plt.show()

    return result_collector, rmse_collector, y_collector


def get_results(exps_root_path, get_eva=True):
    """Get results."""

    night_results, night_rmse, night_y = get_subset_results(
        exps_root_path, "night", get_eva=get_eva)
    day_results, day_rmse, day_y = get_subset_results(
        exps_root_path, "day", get_eva=get_eva)
    all_results, all_rmse, all_y = get_subset_results(
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

    return night_results, day_results, all_results, rmse_collector


#  options = "get-mean-std"
options = "get-result-cut"

if options == "get-mean-std":
    exps_root_path = os.path.join(spiker.HOME, "data", "exps", "ral-exps")
    night_results, day_results, all_results, rmses = get_results(
        exps_root_path)
elif options == "get-result-cut":
    exps_root_path = os.path.join(spiker.HOME, "data", "exps", "ral-exps")
    #  night_results, night_rmse, night_y = get_subset_results(
    #      exps_root_path, "night", get_eva=True)
    #  day_results, day_rmse, day_y = get_subset_results(
    #      exps_root_path, "day", get_eva=True)
    all_results, all_rmse, all_y = get_subset_results(
        exps_root_path, "all", get_eva=True)

    data_root_path = os.path.join(
        spiker.HOME, "data", "exps", "data", "ddd17")
    num_samples = 0

    recording_idx = 19
    idx = 700
    data_name = "rec1501288723.hdf5"

    for data_idx in xrange(1, recording_idx+1):
        data_path = os.path.join(
            data_root_path, "dataset-%d.hdf5" % (data_idx))

        # open file
        test_data = h5py.File(data_path, "r")

        # get number of test result
        test_target = test_data["test_target"][()]
        num_targets = test_target.shape[0]

        if data_idx == recording_idx:
            frames = test_data["test_data"][()]

        if data_idx != recording_idx:
            num_samples += num_targets
        else:
            data_length = num_targets

    print ("number of instance: %d" % (num_samples))
    print ("length of recording: %d" % (data_length))

    # steering time
    steer_time = np.arange(data_length)/20.
    print (all_y["dvs_pred_std"].shape)
    dvs_mean_res = all_y["dvs_pred"][num_samples:(num_samples+data_length)]
    dvs_std_res = all_y["dvs_pred_std"][num_samples:(num_samples+data_length)]
    aps_mean_res = all_y["aps_pred"][num_samples:(num_samples+data_length)]
    aps_std_res = all_y["aps_pred_std"][num_samples:(num_samples+data_length)]
    full_mean_res = all_y["full_pred"][num_samples:(num_samples+data_length)]
    full_std_res = \
        all_y["full_pred_std"][num_samples:(num_samples+data_length)]
    steering = all_y["full_gt"][num_samples:(num_samples+data_length)]

    # rescale
    dvs_mean_res = dvs_mean_res/np.pi*180
    dvs_std_res = dvs_std_res/np.pi*180
    aps_mean_res = aps_mean_res/np.pi*180
    aps_std_res = aps_std_res/np.pi*180
    full_mean_res = full_mean_res/np.pi*180
    full_std_res = full_std_res/np.pi*180

    # producing figures
    fig = plt.figure(figsize=(10, 8))
    outer_grid = gridspec.GridSpec(2, 1, wspace=0.1)

    # plot frames
    frame_grid = gridspec.GridSpecFromSubplotSpec(
        1, 2, subplot_spec=outer_grid[0, 0],
        hspace=0.1)
    aps_frame = plt.Subplot(fig, frame_grid[0])
    aps_frame.imshow(frames[idx, :, :, 1], cmap="gray")
    aps_frame.axis("off")
    aps_frame.set_title("APS Frame")
    fig.add_subplot(aps_frame)
    dvs_frame = plt.Subplot(fig, frame_grid[1])
    dvs_frame.imshow(frames[idx, :, :, 0], cmap="gray")
    dvs_frame.axis("off")
    dvs_frame.set_title("DVS Frame")
    fig.add_subplot(dvs_frame)

    inner_grid = gridspec.GridSpecFromSubplotSpec(
        1, 1, subplot_spec=outer_grid[1, 0])
    # plot steering curve
    steering_curve = plt.Subplot(fig, inner_grid[0, 0])
    min_steer = np.min(steering*180/np.pi)
    max_steer = np.max(steering*180/np.pi)
    steering_curve.plot(steer_time, dvs_mean_res,
                        label="DVS",
                        color="#3f007d",
                        linestyle="-",
                        linewidth=1)
    steering_curve.fill_between(
        steer_time, dvs_mean_res+dvs_std_res,
        dvs_mean_res-dvs_std_res, facecolor="#3f007d",
        alpha=0.3)
    steering_curve.plot(steer_time, aps_mean_res,
                        label="APS",
                        color="#00441b",
                        linestyle="-",
                        linewidth=1)
    steering_curve.fill_between(
        steer_time, aps_mean_res+aps_std_res,
        aps_mean_res-aps_std_res, facecolor="#00441b",
        alpha=0.3)
    steering_curve.plot(steer_time, full_mean_res,
                        label="DVS+APS",
                        color="#7f2704",
                        linestyle="-",
                        linewidth=1)
    steering_curve.fill_between(
        steer_time, full_mean_res+full_std_res,
        full_mean_res-full_std_res, facecolor="#7f2704",
        alpha=0.3)
    steering_curve.plot(steer_time, steering*180/np.pi,
                        label="groundtruth",
                        color="#08306b",
                        linestyle="-",
                        linewidth=2)
    steering_curve.plot((steer_time[idx], steer_time[idx]),
                        (min_steer, max_steer), color="black",
                        linestyle="-", linewidth=1)
    steering_curve.set_xlim(left=0, right=steer_time[-1])
    steering_curve.set_title("Steering Wheel Angle Prediction")
    steering_curve.grid(linestyle="-.")
    steering_curve.legend(fontsize=16)
    steering_curve.set_ylabel("degree", fontsize=16)
    steering_curve.set_xlabel("time (s)", fontsize=16)
    fig.add_subplot(steering_curve)

    outer_grid.tight_layout(fig)

    print ("[MESSAGE] Writing")
    plt.show()
    #  plt.savefig(join(spiker.SPIKER_EXTRA, "cvprfigs",
    #                   "vis"+model_base+"result"+".pdf"),
    #              dpi=600, format="pdf",
    #              bbox="tight", pad_inches=0.5)
