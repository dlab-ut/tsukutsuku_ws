#!/bin/bash
TODAY=`date "+%Y%m%d"`;
MEDIA=false
if [ -e /media/tsukutsuku/extreme_ssd ]; then
    MEDIA=true
fi

if "${MEDIA}"; then
    SAVE_DIR="/media/tsukutsuku/extreme_ssd/ros2bag/navigation"
else
    SAVE_DIR="/home/tsukutsuku/data/bag/ros2/navigation"
fi

if [ ! -d $SAVE_DIR/$TODAY ]; then
    mkdir -p $SAVE_DIR/$TODAY
fi

TIME=`date "+%H-%M-%S"`;

source /home/tsukutsuku/tsukutsuku_ws/install/setup.bash

ros2 bag record -o $SAVE_DIR/$TODAY/ros2bag_$TIME /ypspur/twist /ypspur/twist_with_covariance /ypspur/odom /sensing/velodyne_lower/rectified/pointcloud_ex /sensing/microstrain_imu/gx5/imu/data /sensing/microstrain_imu/gx5/nav/filtered_imu/data  /sensing/microstrain_imu/gx5/device/status /sensing/microstrain_imu/gx5/nav/odom /ypspur/pose_with_covariance /ypspur/pose /tf_static /tf /behavior_tree_log /cmd_vel /diagnostics /global_costmap/costmap /global_costmap/footprint /goal_pose /global_costmap/published_footprint /local_costmap/costmap /local_costmap/footprint  /local_costmap/published_footprint /local_costmap/voxel_grid /local_plan /localization/pose_estimator/pose_with_covariance /localization/pose_twist_fusion_filter/pose_with_covariance /localization/pose_twist_fusion_filter/pose_with_covariance_without_yawbias /localization/twist_estimator/twist /localization/util/downsampled/pointcloud /map /plan /received_global_plan /transformed_global_plan /speed_limit /waypoints /sensing/center_camera/image_raw
