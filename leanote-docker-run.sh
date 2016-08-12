#!/bin/sh

docker run -d --name=leanote-blog \
	--link mongo-blog:mongodb \
	-v $(pwd)/leanote-conf/app.conf:/usr/local/leanote/conf/app.conf \
	-v $(pwd)/leanote-conf/run.sh:/usr/local/leanote/bin/run.sh \
	david/lean-server


