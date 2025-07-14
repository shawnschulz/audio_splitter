#!/bin/bash

input=$1

silent_times=$(ffmpeg -i $input -af silencedetect -f null - |& grep -o -P '(?<=silence_start: )[0-9]{0,50}\.[0-9]{0,50}|(?<=silence_end: )[0-9]{0,50}\.[0-9]{0,50}')
echo -e "$silent_times"
times_csv=$(echo -e "$silent_times" | tr '\n' ',')
echo $times_csv
# remove the tailing comma
times_csv=$(echo $times_csv | sed 's/\(.*\),/\1 /')
echo $times_csv

dt=$(date "+%F-%T")
output_name=${dt}.m4a
ffmpeg -i $input -f segment -segment_times $times_csv -reset_timestamps 1 -map 0:a -c:a copy output_%03d.aac

# The jankiest of jank solutions, but exile anything less than 2Mb to the shadow realm. 
# This may nix some songs that are under 1:30 but c'est la vie
find . -type f -maxdepth 1 -size -2000k -exec mv {} junk/ \;

#for time in "$silent_times[@]"; do
#    
#    dt=$(date "+%F-%T")
#    output_name=${dt}.m4a
#    ffmpeg -i $input -f segment -segment_times $time -reset_timestamps 1 -map 0:a -c:a copy $output_name.m4a
#    ffmpeg -i $output_name -af silenceremove=1:0:-50dB ${output_name}_silence_removed.m4a
#done
