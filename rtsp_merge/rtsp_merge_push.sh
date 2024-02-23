#!/bin/bash

USER="admin"
PASSWD="admin"

# use ffmpeg to merge the streams into a single stream
# Tapo camera's rtsp endpoints: `steam1` is 1080p and `stream2` is 720p.

ffmpeg \
   -i rtsp://$USER:$PASSWD@10.0.0.1:554/stream1 \
   -i rtsp://$USER:$PASSWD@10.0.0.2:554/stream1 \
   -i rtsp://$USER:$PASSWD@10.0.0.3:554/stream1 \
  -filter_complex " \
      [0:v] setpts=PTS-STARTPTS, scale=1920x1080 [a0]; \
      [1:v] setpts=PTS-STARTPTS, scale=1920x1080 [a1]; \
      [2:v] setpts=PTS-STARTPTS, scale=1920x1080 [a2]; \
      [a0][a1][a2]xstack=inputs=3:layout=0_0|0_h0|w0_0|w0_h0[out] \
      " \
    -map "[out]fps=15" \
    -c:v libx264 \
    -f rtsp -rtsp_transport tcp rtsp://localhost:8554/live.stream
