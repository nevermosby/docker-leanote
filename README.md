# Run leanote by docker
## Use binary installation
It is simple to just use binary installation to start leanote.
- Dockerfile for the standalone leanote server
  ```yml
  FROM alpine:3.3
  RUN apk --update add curl && \
      curl -L http://sourceforge.net/projects/leanote-bin/files/1.4.2/leanote-linux-amd64-v1.4.2.bin.tar.gz/download >> \
      /usr/local/leanote-linux-amd64-v1.4.2.bin.tar.gz && \
      apk del --purge curl && \
      rm -rf /var/cache/apk/*

  RUN tar -xzvf /usr/local/leanote-linux-amd64-v1.4.2.bin.tar.gz -C /usr/local
  EXPOSE 9000
  WORKDIR  /usr/local/leanote/bin
  ENTRYPOINT ["sh","run.sh"]
  ```
- Docker compose file for leanote server and MongoDB
  ```yml
  leanote-db:
  restart: always
  image: mongo:3.2.3
  volumes:
    - ./mongo-data:/data/db

  leanote-server:
  restart: always
  build: .
  dockerfile: Dockerfile-leanote-bin
  volumes:
    - ./leanote-conf/app.conf:/usr/local/leanote/conf/app.conf
    - ./leanote-conf/run.sh:/usr/local/leanote/bin/run.sh
    - ./leanote-conf/public:/usr/local/leanote/public
    - ./leanote-conf/files:/usr/local/leanote/files
  links:
    - leanote-db:mongodb
  ```

## Use source installation
TBD
