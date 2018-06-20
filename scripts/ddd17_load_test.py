"""DDD17 dataset loading test.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os
import cv2

import numpy as np
import matplotlib.pyplot as plt

from skimage.transform import rotate

import spiker
from spiker.data import ddd17

data_path = os.path.join(spiker.HOME, "data", "exps", "data", "ddd17",
                         "rec1502338983_export.hdf5")

frames, steering = ddd17.prepare_train_data(data_path, target_size=None)
steering = ddd17.prepare_train_data(data_path,
                                    y_name="steering",
                                    only_y=True,
                                    frame_cut=[500, 1000],
                                    speed_threshold=15)

print (frames.shape)
print (steering.shape)

frames /= 255.
for frame_idx in xrange(frames.shape[0]):
    cv2.imshow("frame", frames[frame_idx, :, :, 1])
    cv2.imshow("dvs", frames[frame_idx, :, :, 0])
    while True:
        key_paused = cv2.waitKey(1) or 0xff
        if key_paused == ord(' '):
            break

plt.figure()
#  plt.boxplot(steering)
#  plt.boxplot(speed)
#  plt.plot(steering[50:-350])
#  plt.plot(dvs_mean[50:-350])
plt.show()
