#!/bin/bash

# tmux 세션 시작
tmux new-session -d -s turtlebot 'roscore'

# roscore가 시작될 때까지 대기
sleep 5

# 터미널 1: bringup 실행
tmux split-window -h 'roslaunch turtlebot3_bringup turtlebot3_robot.launch'

# 잠시 대기
sleep 5

# 터미널 2: SLAM 실행
tmux split-window -v 'export TURTLEBOT3_MODEL=waffle; roslaunch turtlebot3_slam turtlebot3_slam.launch'

# 터미널 3: teleop 실행
tmux split-window -v 'export TURTLEBOT3_MODEL=waffle; roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'

# tmux 세션 시작
tmux -2 attach-session -d