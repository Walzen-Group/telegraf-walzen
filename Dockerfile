FROM telegraf:latest
# FROM telegraf:alpine

RUN apt-get update && apt-get install -y --no-install-recommends python3 ipmitool smartmontools sudo
# RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
