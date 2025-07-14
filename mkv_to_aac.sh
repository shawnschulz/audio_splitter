#!/bin/bash

input=$1
# This is a ridiculously pointless script but I hate having to remember the ffmpeg command for this
ffmpeg -i $input -vn -acodec copy $(basename "$input" .mkv).aac

