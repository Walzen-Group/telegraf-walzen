FROM telegraf:latest
# FROM telegraf:alpine

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-tinytuya ipmitool smartmontools sudo
RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/bin/ipmitool, /usr/sbin/smartctl" >> /etc/sudoers
# RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
