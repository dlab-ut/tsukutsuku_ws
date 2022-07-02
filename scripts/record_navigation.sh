#!/bin/bash
TODAY=`date "+%Y%m%d"`;
if [ ! -d /home/tsukutsuku/data/bag/ros2/navigation/$TODAY ]; then
    mkdir -p /home/tsukutsuku/data/bag/ros2/navigation/$TODAY
fi
TIME=`date "+%H-%M-%S"`;

source /home/tsukutsuku/tsukutsuku_ws/install/setup.bash

ros2 bag record --compression-mode file --compression-format zstd -b 3000000000 -o /home/tsukutsuku/data/bag/ros2/navigation/$TODAY/ros2bag_$TIME /ypspur/twist /ypspur/twist_with_covariance /ypspur/odom /sensing/velodyne_lower/rectified/pointcloud_ex /sensing/microstrain_imu/gx5/imu/data /sensing/microstrain_imu/gx5/nav/filtered_imu/data  /sensing/microstrain_imu/gx5/device/status /sensing/microstrain_imu/gx5/nav/odom /ypspur/pose_with_covariance /ypspur/pose /tf_static /tf /behavior_tree_log /cmd_vel /diagnostics /global_costmap/costmap /global_costmap/footprint /goal_pose /global_costmap/published_footprint /local_costmap/costmap /local_costmap/footprint  /local_costmap/published_footprint /local_costmap/voxel_grid /local_plan /localization/pose_estimator/pose_with_covariance /localization/pose_twist_fusion_filter/pose_with_covariance /localization/pose_twist_fusion_filter/pose_with_covariance_without_yawbias /localization/twist_estimator/twist /localization/util/downsampled/pointcloud /map /plan /received_global_plan /transformed_global_plan /speed_limit /waypoints 
