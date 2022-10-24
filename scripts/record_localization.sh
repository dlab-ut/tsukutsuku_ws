#!/bin/bash
TODAY=`date "+%Y%m%d"`;
MEDIA=false
if [ -e /media/tsukutsuku/extreme_ssd ]; then
    MEDIA=true
fi

if "${MEDIA}"; then
    SAVE_DIR="/media/tsukutsuku/extreme_ssd/ros2bag/localization"
else
    SAVE_DIR="/home/tsukutsuku/data/bag/ros2/localization"
fi

if [ ! -d $SAVE_DIR/$TODAY ]; then
    mkdir -p $SAVE_DIR/$TODAY
fi

TIME=`date "+%H-%M-%S"`;
source /home/tsukutsuku/tsukutsuku_ws/install/setup.bash

ros2 bag record -o $SAVE_DIR/$TODAY/ros2bag_$TIME /ypspur/twist /ypspur/twist_with_covariance /ypspur/odom /sensing/velodyne_lower/rectified/pointcloud_ex /sensing/velodyne_lower/rectified/pointcloud /sensing/microstrain_imu/gx5/imu/data /sensing/microstrain_imu/gx5/nav/filtered_imu/data  /sensing/microstrain_imu/gx5/device/status /sensing/microstrain_imu/gx5/nav/odom /ypspur/pose_with_covariance /ypspur/pose /tf_static /tf /sensing/center_camera/image_raw
