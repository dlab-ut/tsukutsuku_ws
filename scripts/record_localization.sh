#!/bin/bash
TODAY=`date "+%Y%m%d"`;
if [ ! -d /home/tsukutsuku/data/bag/ros2/localization/$TODAY ]; then
    mkdir -p /home/tsukutsuku/data/bag/ros2/localization/$TODAY
fi
TIME=`date "+%H-%M-%S"`;

source /home/tsukutsuku/tsukutsuku_ws/install/setup.bash

ros2 bag record --compression-mode file --compression-format zstd -b 3000000000 -o /home/tsukutsuku/data/bag/ros2/localization/$TODAY/ros2bag_$TIME /ypspur/twist /ypspur/twist_with_covariance /ypspur/odom /sensing/velodyne_lower/rectified/pointcloud_ex /sensing/microstrain_imu/gx5/imu/data /sensing/microstrain_imu/gx5/nav/filtered_imu/data  /sensing/microstrain_imu/gx5/device/status /sensing/microstrain_imu/gx5/nav/odom /ypspur/pose_with_covariance /ypspur/pose /tf_static /tf
