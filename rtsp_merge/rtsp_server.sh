#!/bin/bash

cat > rtsp-simple-server.yml << _EOF_
protocols: [tcp]
paths:
  all:
    source: publisher
_EOF_

docker run --rm -it \
	-v $PWD/rtsp-simple-server.yml:/rtsp-simple-server.yml \
	-p 8554:8554 \
	aler9/rtsp-simple-server:latest

# your local VLC can access `rtsp://localhost:8554/live.stream` to view the merged stream
