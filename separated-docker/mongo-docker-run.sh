#!/bin/sh

docker run -d --name=mongo-blog -v /home/a-david/leanote-bin/mongo-data:/data/db mongo:3.2.3

