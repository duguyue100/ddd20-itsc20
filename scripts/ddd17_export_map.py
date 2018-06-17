"""Export maps for each recording.

Author: Yuhuang Hu
Email : yuhuang.hu@ini.uzh.ch
"""
from __future__ import print_function, absolute_import
import os
import pickle

import numpy as np

from gmplot import gmplot

import spiker


class StrToBytes:
    def __init__(self, fileobj):
        self.fileobj = fileobj
    def read(self, size):
        return self.fileobj.read(size).encode()
    def readline(self, size=-1):
        return self.fileobj.readline(size).encode()


# data places
data_path = os.path.join(spiker.SPIKER_EXTRA, "exported-data")
data_list = os.listdir(data_path)

# outputs
output_path = os.path.join(spiker.SPIKER_EXTRA, "exported-maps")

global_latitude = np.zeros((0,))
global_longitude = np.zeros((0,))
for item in data_list:
    output_html = os.path.join(output_path, item[:-4]+".html")
    file_path = os.path.join(data_path, item)
    with open(file_path, "rt", encoding="latin1") as f:
        data_fields = pickle.load(StrToBytes(f), encoding="latin1")
        f.close()

    latitude = data_fields["latitude"]["data"].astype("float32")
    longitude = data_fields["longitude"]["data"].astype("float32")

    non_zero_index = np.count_nonzero(latitude)
    latitude = latitude[:non_zero_index]
    longitude = longitude[:non_zero_index]

    if latitude.shape[0] == 0:
        print ("Error:",  file_path)
        continue
    else:
        global_latitude = np.append(global_latitude, latitude, axis=0)
        global_longitude = np.append(global_longitude, longitude, axis=0)
        #  print (file_path, "processed")

    compute the center lat and lng
    center_lat = np.mean(latitude)
    cener_lng = np.mean(longitude)
    zoom = 15

    gmap = gmplot.GoogleMapPlotter(center_lat, cener_lng, zoom)

    gmap.plot(
        latitude, longitude, "cornflowerblue", edge_width=5)

    # marking begging and ending
    gmap.marker(latitude[0], longitude[0],
                color='darkgoldenrod', title="start")
    gmap.marker(latitude[-1], longitude[-1],
                color='darkmagenta', title="end")

    gmap.draw(output_html, title=item[:-4])


center_lat = np.mean(global_latitude)
cener_lng = np.mean(global_longitude)
zoom = 7
gmap = gmplot.GoogleMapPlotter(center_lat, cener_lng, zoom)

gmap.heatmap(global_latitude, global_longitude)

gmap.draw(os.path.join(output_path, "global_heatmap.html"))
