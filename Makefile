# This is a Python template Makefile, do modification as you want
#
# Project: ddd17-cvpr
# Author: Yuhuang Hu
# Email : duguyue100@gmail.com

HOST = 127.0.0.1
PYTHONPATH="$(shell printenv PYTHONPATH):$(PWD)"

clean:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~' -exec rm --force  {} +

run:

# CVPR Experiments

experimental:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/experimental.json

multi-run-exps-for-review-rerun-old:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-full.json

multi-run-exps-for-review-extra:
	# aps night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-aps.json
	# dvs night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-dvs.json
	# full night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-full.json

multi-run-exps-for-review-plus:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-7-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-full.json
	# full day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-1-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-3-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-7-full.json

multi-run-exps-for-review:
	# aps night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-1-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-3-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-4-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-5-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-6-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-7-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-aps.json
	# aps day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-1-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-3-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-4-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-5-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-6-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-7-aps.json
	# dvs night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-1-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-3-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-4-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-5-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-6-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-7-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-dvs.json
	# dvs day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-1-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-3-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-4-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-5-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-6-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-7-dvs.json
	# full night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-1-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-3-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-7-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-night-8-full.json
	# full day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-1-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-3-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/review/steering-day-7-full.json

multi-run-exps:
	# aps night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-aps.json
	# aps day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-aps.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-aps.json
	# dvs night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-dvs.json
	# dvs day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-dvs.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-dvs.json
	# full night
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-full.json
	# full day
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-full.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-full.json

rerun-exps:
	# APS
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-aps.json
	# DVS
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-dvs.json
	# FULL
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-full.json

night-1234567-aps:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-1-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-1-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-3-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-3-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-4-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-4-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-5-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-5-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-6-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-6-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-7-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-7-aps.json

day-12345678-aps:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-1-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-1-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-3-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-3-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-4-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-4-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-5-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-5-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-6-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-6-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-aps.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-aps.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-aps.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-aps.json

night-1234567-dvs:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-1-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-1-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-3-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-3-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-4-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-4-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-5-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-5-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-6-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-6-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-7-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-7-dvs.json

day-12345678-dvs:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-1-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-1-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-3-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-3-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-4-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-4-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-5-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-5-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-6-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-6-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-dvs.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-dvs.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-dvs.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-dvs.json

night-1234567-full:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-1-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-1-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-1-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-2-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-2-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-2-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-3-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-3-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-3-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-4-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-4-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-4-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-5-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-5-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-5-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-6-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-6-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-6-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-night-7-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-night-7-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-night-7-full.json

day-12345678-full:
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-1-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-1-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-1-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-2-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-2-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-2-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-3-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-3-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-3-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-4-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-4-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-4-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-5-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-5-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-5-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-6-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-6-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-6-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-7-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-7-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-7-full.json
	# steering
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/cvprexps/steering-day-8-full.json
	# accel
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_accel.py with ./exps/configs/cvprexps/accel-day-8-full.json
	# brake
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_brake.py with ./exps/configs/cvprexps/brake-day-8-full.json

ddd17-test:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_test.py

ddd17-load-test:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_load_test.py

ddd17-prediction-test:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_prediction_test.py

ddd17-loss-test:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_loss_test.py

ddd17-export-video:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_export_video.py

ddd17-create-configs:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_create_configs.py

cvpr-create-figures:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/cvpr_create_figures.py

ddd17-fields:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_export_fields.py

ddd17-steer:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_steer_export.py

ddd17-export-prediction:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_export_prediction.py

ddd17-export-rate:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_export_rate.py

ddd17-export-map:
	PYTHONPATH=$(PYTHONPATH) python ./scripts/ddd17_export_map.py

# Experiments

resnet-steering-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/resnet-steering-3-5.json

resnet-steering-dvs-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-dvs-3-5.json

resnet-steering-aps-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-aps-3-5.json

resnet_steering-hw-2:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/resnet-steering-hw-2-3-5.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-2-dvs-3-5.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-2-aps-3-5.json

resnet_steering-hw-up-1:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/resnet-steering-hw-up-1-3-5.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-up-1-dvs-3-5.json
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-up-1-aps-3-5.json

resnet-steering-hw-2-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/resnet-steering-hw-2-3-5.json

resnet-steering-hw-2-dvs-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-2-dvs-3-5.json

resnet-steering-hw-2-aps-3-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering_single_channel.py with ./exps/configs/resnet-steering-hw-2-aps-3-5.json

cleanall:

# RAL Cluster experiments
ral-experiment-1:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-full-1.json

ral-experiment-2:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-aps-1.json

ral-experiment-3:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-dvs-1.json

ral-experiment-4:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-full-1.json

ral-experiment-5:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-aps-1.json

ral-experiment-6:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-dvs-1.json

ral-experiment-7:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-full-1.json

ral-experiment-8:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-aps-1.json

ral-experiment-9:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-dvs-1.json

ral-experiment-10:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-full-1.json

ral-experiment-11:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-aps-1.json

ral-experiment-12:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-dvs-1.json

ral-experiment-13:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-full-1.json

ral-experiment-14:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-aps-1.json

ral-experiment-15:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-dvs-1.json

ral-experiment-16:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-full-1.json

ral-experiment-17:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-aps-1.json

ral-experiment-18:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-dvs-1.json

ral-experiment-19:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-full-1.json

ral-experiment-20:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-aps-1.json

ral-experiment-21:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-dvs-1.json

ral-experiment-22:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-full-1.json

ral-experiment-23:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-aps-1.json

ral-experiment-24:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-dvs-1.json

ral-experiment-25:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-full-1.json

ral-experiment-26:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-aps-1.json

ral-experiment-27:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-dvs-1.json

ral-experiment-28:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-full-1.json

ral-experiment-29:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-aps-1.json

ral-experiment-30:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-dvs-1.json

ral-experiment-31:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-full-1.json

ral-experiment-32:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-aps-1.json

ral-experiment-33:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-dvs-1.json

ral-experiment-34:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-full-1.json

ral-experiment-35:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-aps-1.json

ral-experiment-36:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-dvs-1.json

ral-experiment-37:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-full-1.json

ral-experiment-38:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-aps-1.json

ral-experiment-39:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-dvs-1.json

ral-experiment-40:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-full-1.json

ral-experiment-41:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-aps-1.json

ral-experiment-42:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-dvs-1.json

ral-experiment-43:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-full-1.json

ral-experiment-44:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-aps-1.json

ral-experiment-45:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-dvs-1.json

ral-experiment-46:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-full-1.json

ral-experiment-47:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-aps-1.json

ral-experiment-48:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-dvs-1.json

ral-experiment-49:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-full-1.json

ral-experiment-50:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-aps-1.json

ral-experiment-51:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-dvs-1.json

ral-experiment-52:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-full-1.json

ral-experiment-53:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-aps-1.json

ral-experiment-54:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-dvs-1.json

ral-experiment-55:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-full-1.json

ral-experiment-56:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-aps-1.json

ral-experiment-57:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-dvs-1.json

ral-experiment-58:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-full-1.json

ral-experiment-59:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-aps-1.json

ral-experiment-60:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-dvs-1.json

ral-experiment-61:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-full-1.json

ral-experiment-62:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-aps-1.json

ral-experiment-63:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-dvs-1.json

ral-experiment-64:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-full-1.json

ral-experiment-65:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-aps-1.json

ral-experiment-66:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-dvs-1.json

ral-experiment-67:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-full-1.json

ral-experiment-68:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-aps-1.json

ral-experiment-69:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-dvs-1.json

ral-experiment-70:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-full-1.json

ral-experiment-71:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-aps-1.json

ral-experiment-72:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-dvs-1.json

ral-experiment-73:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-full-1.json

ral-experiment-74:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-aps-1.json

ral-experiment-75:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-dvs-1.json

ral-experiment-76:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-full-1.json

ral-experiment-77:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-aps-1.json

ral-experiment-78:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-dvs-1.json

ral-experiment-79:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-full-1.json

ral-experiment-80:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-aps-1.json

ral-experiment-81:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-dvs-1.json

ral-experiment-82:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-full-1.json

ral-experiment-83:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-aps-1.json

ral-experiment-84:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-dvs-1.json

ral-experiment-85:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-full-1.json

ral-experiment-86:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-aps-1.json

ral-experiment-87:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-dvs-1.json

ral-experiment-88:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-full-1.json

ral-experiment-89:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-aps-1.json

ral-experiment-90:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-dvs-1.json

ral-experiment-91:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-full-2.json

ral-experiment-92:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-aps-2.json

ral-experiment-93:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-dvs-2.json

ral-experiment-94:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-full-2.json

ral-experiment-95:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-aps-2.json

ral-experiment-96:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-dvs-2.json

ral-experiment-97:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-full-2.json

ral-experiment-98:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-aps-2.json

ral-experiment-99:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-dvs-2.json

ral-experiment-100:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-full-2.json

ral-experiment-101:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-aps-2.json

ral-experiment-102:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-dvs-2.json

ral-experiment-103:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-full-2.json

ral-experiment-104:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-aps-2.json

ral-experiment-105:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-dvs-2.json

ral-experiment-106:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-full-2.json

ral-experiment-107:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-aps-2.json

ral-experiment-108:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-dvs-2.json

ral-experiment-109:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-full-2.json

ral-experiment-110:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-aps-2.json

ral-experiment-111:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-dvs-2.json

ral-experiment-112:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-full-2.json

ral-experiment-113:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-aps-2.json

ral-experiment-114:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-dvs-2.json

ral-experiment-115:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-full-2.json

ral-experiment-116:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-aps-2.json

ral-experiment-117:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-dvs-2.json

ral-experiment-118:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-full-2.json

ral-experiment-119:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-aps-2.json

ral-experiment-120:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-dvs-2.json

ral-experiment-121:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-full-2.json

ral-experiment-122:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-aps-2.json

ral-experiment-123:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-dvs-2.json

ral-experiment-124:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-full-2.json

ral-experiment-125:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-aps-2.json

ral-experiment-126:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-dvs-2.json

ral-experiment-127:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-full-2.json

ral-experiment-128:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-aps-2.json

ral-experiment-129:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-dvs-2.json

ral-experiment-130:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-full-2.json

ral-experiment-131:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-aps-2.json

ral-experiment-132:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-dvs-2.json

ral-experiment-133:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-full-2.json

ral-experiment-134:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-aps-2.json

ral-experiment-135:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-dvs-2.json

ral-experiment-136:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-full-2.json

ral-experiment-137:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-aps-2.json

ral-experiment-138:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-dvs-2.json

ral-experiment-139:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-full-2.json

ral-experiment-140:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-aps-2.json

ral-experiment-141:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-dvs-2.json

ral-experiment-142:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-full-2.json

ral-experiment-143:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-aps-2.json

ral-experiment-144:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-dvs-2.json

ral-experiment-145:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-full-2.json

ral-experiment-146:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-aps-2.json

ral-experiment-147:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-dvs-2.json

ral-experiment-148:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-full-2.json

ral-experiment-149:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-aps-2.json

ral-experiment-150:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-dvs-2.json

ral-experiment-151:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-full-2.json

ral-experiment-152:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-aps-2.json

ral-experiment-153:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-dvs-2.json

ral-experiment-154:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-full-2.json

ral-experiment-155:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-aps-2.json

ral-experiment-156:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-dvs-2.json

ral-experiment-157:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-full-2.json

ral-experiment-158:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-aps-2.json

ral-experiment-159:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-dvs-2.json

ral-experiment-160:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-full-2.json

ral-experiment-161:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-aps-2.json

ral-experiment-162:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-dvs-2.json

ral-experiment-163:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-full-2.json

ral-experiment-164:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-aps-2.json

ral-experiment-165:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-dvs-2.json

ral-experiment-166:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-full-2.json

ral-experiment-167:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-aps-2.json

ral-experiment-168:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-dvs-2.json

ral-experiment-169:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-full-2.json

ral-experiment-170:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-aps-2.json

ral-experiment-171:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-dvs-2.json

ral-experiment-172:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-full-2.json

ral-experiment-173:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-aps-2.json

ral-experiment-174:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-dvs-2.json

ral-experiment-175:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-full-2.json

ral-experiment-176:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-aps-2.json

ral-experiment-177:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-dvs-2.json

ral-experiment-178:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-full-2.json

ral-experiment-179:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-aps-2.json

ral-experiment-180:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-dvs-2.json

ral-experiment-181:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-full-3.json

ral-experiment-182:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-aps-3.json

ral-experiment-183:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-dvs-3.json

ral-experiment-184:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-full-3.json

ral-experiment-185:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-aps-3.json

ral-experiment-186:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-dvs-3.json

ral-experiment-187:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-full-3.json

ral-experiment-188:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-aps-3.json

ral-experiment-189:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-dvs-3.json

ral-experiment-190:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-full-3.json

ral-experiment-191:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-aps-3.json

ral-experiment-192:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-dvs-3.json

ral-experiment-193:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-full-3.json

ral-experiment-194:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-aps-3.json

ral-experiment-195:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-dvs-3.json

ral-experiment-196:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-full-3.json

ral-experiment-197:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-aps-3.json

ral-experiment-198:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-dvs-3.json

ral-experiment-199:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-full-3.json

ral-experiment-200:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-aps-3.json

ral-experiment-201:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-dvs-3.json

ral-experiment-202:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-full-3.json

ral-experiment-203:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-aps-3.json

ral-experiment-204:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-dvs-3.json

ral-experiment-205:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-full-3.json

ral-experiment-206:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-aps-3.json

ral-experiment-207:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-dvs-3.json

ral-experiment-208:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-full-3.json

ral-experiment-209:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-aps-3.json

ral-experiment-210:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-dvs-3.json

ral-experiment-211:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-full-3.json

ral-experiment-212:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-aps-3.json

ral-experiment-213:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-dvs-3.json

ral-experiment-214:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-full-3.json

ral-experiment-215:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-aps-3.json

ral-experiment-216:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-dvs-3.json

ral-experiment-217:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-full-3.json

ral-experiment-218:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-aps-3.json

ral-experiment-219:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-dvs-3.json

ral-experiment-220:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-full-3.json

ral-experiment-221:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-aps-3.json

ral-experiment-222:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-dvs-3.json

ral-experiment-223:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-full-3.json

ral-experiment-224:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-aps-3.json

ral-experiment-225:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-dvs-3.json

ral-experiment-226:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-full-3.json

ral-experiment-227:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-aps-3.json

ral-experiment-228:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-dvs-3.json

ral-experiment-229:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-full-3.json

ral-experiment-230:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-aps-3.json

ral-experiment-231:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-dvs-3.json

ral-experiment-232:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-full-3.json

ral-experiment-233:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-aps-3.json

ral-experiment-234:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-dvs-3.json

ral-experiment-235:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-full-3.json

ral-experiment-236:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-aps-3.json

ral-experiment-237:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-dvs-3.json

ral-experiment-238:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-full-3.json

ral-experiment-239:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-aps-3.json

ral-experiment-240:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-dvs-3.json

ral-experiment-241:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-full-3.json

ral-experiment-242:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-aps-3.json

ral-experiment-243:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-dvs-3.json

ral-experiment-244:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-full-3.json

ral-experiment-245:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-aps-3.json

ral-experiment-246:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-dvs-3.json

ral-experiment-247:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-full-3.json

ral-experiment-248:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-aps-3.json

ral-experiment-249:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-dvs-3.json

ral-experiment-250:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-full-3.json

ral-experiment-251:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-aps-3.json

ral-experiment-252:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-dvs-3.json

ral-experiment-253:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-full-3.json

ral-experiment-254:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-aps-3.json

ral-experiment-255:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-dvs-3.json

ral-experiment-256:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-full-3.json

ral-experiment-257:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-aps-3.json

ral-experiment-258:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-dvs-3.json

ral-experiment-259:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-full-3.json

ral-experiment-260:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-aps-3.json

ral-experiment-261:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-dvs-3.json

ral-experiment-262:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-full-3.json

ral-experiment-263:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-aps-3.json

ral-experiment-264:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-dvs-3.json

ral-experiment-265:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-full-3.json

ral-experiment-266:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-aps-3.json

ral-experiment-267:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-dvs-3.json

ral-experiment-268:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-full-3.json

ral-experiment-269:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-aps-3.json

ral-experiment-270:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-dvs-3.json

ral-experiment-271:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-full-4.json

ral-experiment-272:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-aps-4.json

ral-experiment-273:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-dvs-4.json

ral-experiment-274:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-full-4.json

ral-experiment-275:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-aps-4.json

ral-experiment-276:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-dvs-4.json

ral-experiment-277:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-full-4.json

ral-experiment-278:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-aps-4.json

ral-experiment-279:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-dvs-4.json

ral-experiment-280:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-full-4.json

ral-experiment-281:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-aps-4.json

ral-experiment-282:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-dvs-4.json

ral-experiment-283:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-full-4.json

ral-experiment-284:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-aps-4.json

ral-experiment-285:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-dvs-4.json

ral-experiment-286:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-full-4.json

ral-experiment-287:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-aps-4.json

ral-experiment-288:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-dvs-4.json

ral-experiment-289:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-full-4.json

ral-experiment-290:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-aps-4.json

ral-experiment-291:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-dvs-4.json

ral-experiment-292:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-full-4.json

ral-experiment-293:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-aps-4.json

ral-experiment-294:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-dvs-4.json

ral-experiment-295:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-full-4.json

ral-experiment-296:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-aps-4.json

ral-experiment-297:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-dvs-4.json

ral-experiment-298:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-full-4.json

ral-experiment-299:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-aps-4.json

ral-experiment-300:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-dvs-4.json

ral-experiment-301:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-full-4.json

ral-experiment-302:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-aps-4.json

ral-experiment-303:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-dvs-4.json

ral-experiment-304:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-full-4.json

ral-experiment-305:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-aps-4.json

ral-experiment-306:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-dvs-4.json

ral-experiment-307:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-full-4.json

ral-experiment-308:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-aps-4.json

ral-experiment-309:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-dvs-4.json

ral-experiment-310:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-full-4.json

ral-experiment-311:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-aps-4.json

ral-experiment-312:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-dvs-4.json

ral-experiment-313:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-full-4.json

ral-experiment-314:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-aps-4.json

ral-experiment-315:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-dvs-4.json

ral-experiment-316:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-full-4.json

ral-experiment-317:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-aps-4.json

ral-experiment-318:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-dvs-4.json

ral-experiment-319:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-full-4.json

ral-experiment-320:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-aps-4.json

ral-experiment-321:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-dvs-4.json

ral-experiment-322:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-full-4.json

ral-experiment-323:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-aps-4.json

ral-experiment-324:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-dvs-4.json

ral-experiment-325:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-full-4.json

ral-experiment-326:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-aps-4.json

ral-experiment-327:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-dvs-4.json

ral-experiment-328:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-full-4.json

ral-experiment-329:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-aps-4.json

ral-experiment-330:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-dvs-4.json

ral-experiment-331:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-full-4.json

ral-experiment-332:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-aps-4.json

ral-experiment-333:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-dvs-4.json

ral-experiment-334:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-full-4.json

ral-experiment-335:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-aps-4.json

ral-experiment-336:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-dvs-4.json

ral-experiment-337:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-full-4.json

ral-experiment-338:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-aps-4.json

ral-experiment-339:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-dvs-4.json

ral-experiment-340:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-full-4.json

ral-experiment-341:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-aps-4.json

ral-experiment-342:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-dvs-4.json

ral-experiment-343:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-full-4.json

ral-experiment-344:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-aps-4.json

ral-experiment-345:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-dvs-4.json

ral-experiment-346:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-full-4.json

ral-experiment-347:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-aps-4.json

ral-experiment-348:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-dvs-4.json

ral-experiment-349:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-full-4.json

ral-experiment-350:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-aps-4.json

ral-experiment-351:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-dvs-4.json

ral-experiment-352:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-full-4.json

ral-experiment-353:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-aps-4.json

ral-experiment-354:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-dvs-4.json

ral-experiment-355:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-full-4.json

ral-experiment-356:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-aps-4.json

ral-experiment-357:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-dvs-4.json

ral-experiment-358:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-full-4.json

ral-experiment-359:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-aps-4.json

ral-experiment-360:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-dvs-4.json

ral-experiment-361:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-full-5.json

ral-experiment-362:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-aps-5.json

ral-experiment-363:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-1-dvs-5.json

ral-experiment-364:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-full-5.json

ral-experiment-365:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-aps-5.json

ral-experiment-366:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-2-dvs-5.json

ral-experiment-367:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-full-5.json

ral-experiment-368:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-aps-5.json

ral-experiment-369:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-3-dvs-5.json

ral-experiment-370:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-full-5.json

ral-experiment-371:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-aps-5.json

ral-experiment-372:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-4-dvs-5.json

ral-experiment-373:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-full-5.json

ral-experiment-374:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-aps-5.json

ral-experiment-375:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-5-dvs-5.json

ral-experiment-376:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-full-5.json

ral-experiment-377:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-aps-5.json

ral-experiment-378:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-6-dvs-5.json

ral-experiment-379:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-full-5.json

ral-experiment-380:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-aps-5.json

ral-experiment-381:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-7-dvs-5.json

ral-experiment-382:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-full-5.json

ral-experiment-383:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-aps-5.json

ral-experiment-384:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-8-dvs-5.json

ral-experiment-385:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-full-5.json

ral-experiment-386:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-aps-5.json

ral-experiment-387:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-9-dvs-5.json

ral-experiment-388:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-full-5.json

ral-experiment-389:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-aps-5.json

ral-experiment-390:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-10-dvs-5.json

ral-experiment-391:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-full-5.json

ral-experiment-392:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-aps-5.json

ral-experiment-393:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-11-dvs-5.json

ral-experiment-394:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-full-5.json

ral-experiment-395:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-aps-5.json

ral-experiment-396:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-12-dvs-5.json

ral-experiment-397:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-full-5.json

ral-experiment-398:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-aps-5.json

ral-experiment-399:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-13-dvs-5.json

ral-experiment-400:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-full-5.json

ral-experiment-401:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-aps-5.json

ral-experiment-402:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-14-dvs-5.json

ral-experiment-403:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-full-5.json

ral-experiment-404:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-aps-5.json

ral-experiment-405:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-night-15-dvs-5.json

ral-experiment-406:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-full-5.json

ral-experiment-407:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-aps-5.json

ral-experiment-408:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-1-dvs-5.json

ral-experiment-409:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-full-5.json

ral-experiment-410:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-aps-5.json

ral-experiment-411:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-2-dvs-5.json

ral-experiment-412:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-full-5.json

ral-experiment-413:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-aps-5.json

ral-experiment-414:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-3-dvs-5.json

ral-experiment-415:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-full-5.json

ral-experiment-416:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-aps-5.json

ral-experiment-417:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-4-dvs-5.json

ral-experiment-418:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-full-5.json

ral-experiment-419:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-aps-5.json

ral-experiment-420:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-5-dvs-5.json

ral-experiment-421:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-full-5.json

ral-experiment-422:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-aps-5.json

ral-experiment-423:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-6-dvs-5.json

ral-experiment-424:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-full-5.json

ral-experiment-425:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-aps-5.json

ral-experiment-426:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-7-dvs-5.json

ral-experiment-427:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-full-5.json

ral-experiment-428:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-aps-5.json

ral-experiment-429:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-8-dvs-5.json

ral-experiment-430:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-full-5.json

ral-experiment-431:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-aps-5.json

ral-experiment-432:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-9-dvs-5.json

ral-experiment-433:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-full-5.json

ral-experiment-434:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-aps-5.json

ral-experiment-435:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-10-dvs-5.json

ral-experiment-436:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-full-5.json

ral-experiment-437:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-aps-5.json

ral-experiment-438:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-11-dvs-5.json

ral-experiment-439:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-full-5.json

ral-experiment-440:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-aps-5.json

ral-experiment-441:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-12-dvs-5.json

ral-experiment-442:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-full-5.json

ral-experiment-443:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-aps-5.json

ral-experiment-444:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-13-dvs-5.json

ral-experiment-445:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-full-5.json

ral-experiment-446:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-aps-5.json

ral-experiment-447:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-14-dvs-5.json

ral-experiment-448:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-full-5.json

ral-experiment-449:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-aps-5.json

ral-experiment-450:
	KERAS_BACKEND=tensorflow PYTHONPATH=$(PYTHONPATH) python ./exps/resnet_steering.py with ./exps/configs/ral-exps/steering-day-15-dvs-5.json
