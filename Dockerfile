FROM telegraf:alpine

RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
