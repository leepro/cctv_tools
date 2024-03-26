#!/bin/bash

ffmpeg -i "rtsp://$USER:$PASS@10.0.0.1:554/stream1" \
  -vf "drawtext=fontfile=~/arial.ttf: text='Hello': fontcolor=white: fontsize=24: box=1: boxcolor=black@0.5: boxborderw=5: x=(w-text_w)/2: y=h-(2*lh)" \
  -c:v libx264 -f rtsp -rtsp_transport tcp rtsp://localhost:8554/live.stream
