#!/bin/bash

# This script loads the v4l2 loopback kernel module, then runs the flirone program in a screen, then runs a script to crop out the empty space in the video feed in another screen. This makes 3 video feeds available: Flir visible light camera on /dev/video2, Flir thermal imager on /dev/video3, cropped Flir thermal imager on /dev/video4
#
# Requirements:
#	screen
#	ffmpeg

./scripts/load_v4l2loopback_3-4-5-6

sleep 1

./scripts/screen_command "./flirone palettes/Iron_Black.raw"

sleep 5

./scripts/screen_command "/home/marc/scripts/crop-thermal.sh"

echo ""
echo "v4l2:///dev/video4"
echo "Flir visible light camera"
echo ""
echo "v4l2:///dev/video5"
echo "Flir thermal imager"
echo ""
echo "v4l2:///dev/video6"
echo "Cropped Flir thermal imager"
echo ""
echo "In OBS, set video delay filter on webcam device in Sources list to 300-500 ms to sync with Flir thermal imager"
