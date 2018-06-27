"""Generate results analysis for RAL

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os
import cPickle as pickle
import h5py

import cv2

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

CV_AA = cv2.LINE_AA if int(cv2.__version__[0]) > 2 else cv2.CV_AA


def plot_steering_wheel(img, steer_angles, colors=[(8, 48, 107)],
                        thickness=[2], speed=0):
    """draw angles based on a list of predictions."""
    c, r = (172, 128), 64  # center, radius
    for angle_idx in xrange(len(steer_angles)):
        a = steer_angles[angle_idx]
        a_rad = + a / 180. * np.pi + np.pi / 2
        a_rad = np.pi-a_rad
        t = (c[0] + int(np.cos(a_rad) * r), c[1] - int(np.sin(a_rad) * r))
        cv2.line(img, c, t, colors[angle_idx],
                 thickness[angle_idx], CV_AA)
    cv2.circle(img, c, r, (244, 66, 66), 1, CV_AA)
    # the label
    cv2.line(img, (c[0]-r+5, c[1]), (c[0]-r, c[1]), (244, 66, 66), 1, CV_AA)
    cv2.line(img, (c[0]+r-5, c[1]), (c[0]+r, c[1]), (244, 66, 66), 1, CV_AA)
    cv2.line(img, (c[0], c[1]-r+5), (c[0], c[1]-r), (244, 66, 66), 1, CV_AA)
    cv2.line(img, (c[0], c[1]+r-5), (c[0], c[1]+r), (244, 66, 66), 1, CV_AA)
    cv2.putText(
        img,
        'gt: %0.1f deg DVS+APS: %.1f deg APS: %.1f deg' %
        (steer_angles[0], steer_angles[1], steer_angles[2]),
        (c[0]-144, c[1]+84), cv2.FONT_HERSHEY_SIMPLEX, 0.4, (244, 66, 66),
        1, CV_AA)
    #  cv2.putText(img, '%d %s' % (speed, "km/h"), (160, 240),
    #              cv2.FONT_HERSHEY_SIMPLEX, 0.4, (80, 244, 66), 1, CV_AA)
    return img


def get_subset_results(exps_root_path, lighting,
                       get_eva=False, plotting=False,
                       exclude_low_speed=True):
    # read high speed idx
    with open(os.path.join(exps_root_path, "high-speed-idx.pkl"), "r") as f:
        high_speed_idx = pickle.load(f)
        f.close()
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
                if exclude_low_speed is True:
                    if lighting == "night":
                        filter_idx = np.logical_and(
                            filter_idx,
                            high_speed_idx[:filter_idx.shape[0]])
                    elif lighting == "day":
                        filter_idx = np.logical_and(
                            filter_idx,
                            high_speed_idx[-filter_idx.shape[0]:])
                    elif lighting == "all":
                        filter_idx = np.logical_and(
                            filter_idx, high_speed_idx)

                # filtering
                #  Y_true = Y_true[filter_idx]
                #  Y_predict = Y_predict[filter_idx]

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
#  options = "get-result-cut"
#  options = "investigate-examples"
options = "get-intensity-plot"

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
    all_tested_y = all_y["full_gt"][all_y["full_fi"]]
    no_prediction = np.sqrt(np.mean(all_tested_y**2))/np.pi*180
    print ("Random prediction: %.2f" % (no_prediction))

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
    fig = plt.figure(figsize=(16, 8))
    outer_grid = gridspec.GridSpec(2, 1, wspace=0.1)

    # plot frames
    frame_grid = gridspec.GridSpecFromSubplotSpec(
        1, 2, subplot_spec=outer_grid[0, 0],
        hspace=0.1)
    aps_frame = plt.Subplot(fig, frame_grid[0])
    aps_frame.imshow(frames[idx, :, :, 1], cmap="gray")
    aps_frame.axis("off")
    aps_frame.set_title("APS Frame", fontsize=16)
    fig.add_subplot(aps_frame)
    dvs_frame = plt.Subplot(fig, frame_grid[1])
    dvs_frame.imshow(frames[idx, :, :, 0], cmap="gray")
    dvs_frame.axis("off")
    dvs_frame.set_title("DVS Frame", fontsize=16)
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
                        linestyle="-", linewidth=2)
    steering_curve.set_xlim(left=0, right=steer_time[-1])
    steering_curve.set_title("Steering Wheel Angle Prediction", fontsize=16)
    steering_curve.grid(linestyle="-.")
    steering_curve.legend(fontsize=16)
    steering_curve.set_ylabel("degree", fontsize=16)
    steering_curve.set_xlabel("time (s)", fontsize=16)
    steering_curve.tick_params(labelsize=16)
    fig.add_subplot(steering_curve)

    outer_grid.tight_layout(fig)

    print ("[MESSAGE] Writing")
    plt.show()
    #  plt.savefig(join(spiker.SPIKER_EXTRA, "cvprfigs",
    #                   "vis"+model_base+"result"+".pdf"),
    #              dpi=600, format="pdf",
    #              bbox="tight", pad_inches=0.5)
elif options == "investigate-examples":
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

    recording_idx = 30
    idx = 700

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
    dvs_mean_res = all_y["dvs_pred"][num_samples:(num_samples+data_length)]
    dvs_std_res = all_y["dvs_pred_std"][num_samples:(num_samples+data_length)]
    aps_mean_res = all_y["aps_pred"][num_samples:(num_samples+data_length)]
    aps_std_res = all_y["aps_pred_std"][num_samples:(num_samples+data_length)]
    full_mean_res = all_y["full_pred"][num_samples:(num_samples+data_length)]
    full_std_res = \
        all_y["full_pred_std"][num_samples:(num_samples+data_length)]
    steering = all_y["full_gt"][num_samples:(num_samples+data_length)]

    # find the compare case for APS and combined
    error_full = np.sqrt((full_mean_res-steering)**2)/np.pi*180.
    error_aps = np.sqrt((aps_mean_res-steering)**2)/np.pi*180.

    compare_idx = np.abs(error_full-error_aps) > 8

    print ("Number of compare cases: %d" % (np.sum(compare_idx)))

    frames = frames[compare_idx]
    gt_res = steering[compare_idx]/np.pi*180.
    full_res = full_mean_res[compare_idx]/np.pi*180.
    aps_res = aps_mean_res[compare_idx]/np.pi*180.

    for idx in xrange(frames.shape[0]):
        fig = plt.figure()
        image = np.stack((frames[idx, ..., 1].astype("uint8"),)*3, -1)
        image = cv2.resize(image, (image.shape[1]*2, image.shape[0]*2))
        image = plot_steering_wheel(
            image, [gt_res[idx], full_res[idx], aps_res[idx]],
            colors=[(8, 48, 107), (127, 39, 4), (0, 68, 27)],
            thickness=[2, 1, 1])
        fig.add_subplot(1, 2, 1)
        plt.imshow(image)
        plt.title("Dataset-%d" % (recording_idx))
        plt.axis("off")
        fig.add_subplot(1, 2, 2)
        image_dvs = frames[idx, ..., 0].astype("uint8")
        image_dvs = cv2.resize(image_dvs,
                               (image_dvs.shape[1]*2, image_dvs.shape[0]*2))
        plt.imshow(image_dvs, cmap="gray")
        plt.title("Difference: %.2f degree" %
                  (abs(full_res[idx]-aps_res[idx])))
        plt.axis("off")
        plt.show()

elif options == "get-intensity-plot":
    data_root_path = os.path.join(
        spiker.HOME, "data", "exps", "data", "ddd17")
    num_samples = 0

    recording_idx = 30
    idx = 700

    night_mean_intensity = np.zeros((0,))
    day_mean_intensity = np.zeros((0,))
    for data_idx in xrange(1, recording_idx+1):
        data_path = os.path.join(
            data_root_path, "dataset-%d.hdf5" % (data_idx))

        # open file
        test_data = h5py.File(data_path, "r")

        print ("Processing dataset %d" % (data_idx))

        # get number of test result
        frames = test_data["test_data"][..., 1][()]

        test_data.close()

        # compute average mean intensity for every APS frame
        mean_intensity = np.mean(frames[:, :-30, :], axis=(1, 2))
        if data_idx <= 15:
            night_mean_intensity = np.append(
                night_mean_intensity, mean_intensity)
        else:
            day_mean_intensity = np.append(
                day_mean_intensity, mean_intensity)

    print ("number of instance: %d" % (
        night_mean_intensity.shape[0] +
        day_mean_intensity.shape[0]))

    fig = plt.figure()
    fig.add_subplot(1, 2, 1)
    plt.hist([night_mean_intensity, day_mean_intensity],
             bins=32, alpha=0.8,
             edgecolor='black', linewidth=1.2,
             label=["night", "day"])
    plt.xlabel("intensity values", fontsize=16)
    plt.ylabel("frame count", fontsize=16)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.legend(fontsize=16)

    fig.add_subplot(1, 2, 2)
    plt.boxplot([night_mean_intensity, day_mean_intensity])
    plt.ylabel("intensity values", fontsize=16)
    plt.xticks([1, 2], ["night", "day"], fontsize=16)
    plt.yticks(fontsize=16)

    plt.show()
