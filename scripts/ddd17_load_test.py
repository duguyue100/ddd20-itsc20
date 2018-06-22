"""DDD17 dataset loading test.

Author: Yuhuang Hu
Email : duguyue100@gmail.com
"""
from __future__ import print_function
import os
import cv2

import numpy as np
import h5py
import matplotlib.pyplot as plt

from skimage.transform import rotate

import spiker
from spiker.data import ddd17

data_path = os.path.join(spiker.HOME, "data", "exps", "data", "ddd17",
                         "all.hdf5")

#  frames, steering = ddd17.prepare_train_data(data_path, target_size=None)
#  steering = ddd17.prepare_train_data(data_path,
#                                      y_name="steering",
#                                      only_y=True,
#                                      frame_cut=[500, 1000],
#                                      speed_threshold=15)

data = h5py.File(data_path, "r")

print (data["train_data"].shape)

frames = data["train_data"][:1000][()]
steering = data["test_target"][()]

#  print (frames.shape)
print (steering.shape)

#  for frame_idx in xrange(frames.shape[0]):
#      cv2.imshow("frame", frames[frame_idx, :, :, 1])
#      cv2.imshow("dvs", frames[frame_idx, :, :, 0])
#      while True:
#          key_paused = cv2.waitKey(1) or 0xff
#          if key_paused == ord(' '):
#              break

#  cv2.destroyAllWindows()

plt.figure()
plt.hist(steering/np.pi*180, bins=100)
plt.show()

data.close()
