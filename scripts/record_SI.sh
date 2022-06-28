#!/bin/bash
TODAY=`date "+%Y%m%d"`;
if [ ! -d /home/tsukutsuku/data/bag/ros2/$TODAY ]; then
    mkdir /home/tsukutsuku/data/bag/ros2/$TODAY
fi
TIME=`date "+%H-%M-%S"`;

source /home/tsukutsuku/tsukutsuku_ws/install/setup.bash

ros2 bag record --compression-mode file --compression-format zstd -b 3000000000 -o /home/tsukutsuku/data/bag/ros2/$TODAY/ros2bag_$TIME  /sensing/velodyne_upper/pointcloud_raw /sensing/velodyne_lower/pointcloud_raw
