FROM telegraf:latest
# FROM telegraf:alpine

RUN apt-get update && apt-get install -y --no-install-recommends python3 ipmitool smartmontools sudo pipx
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install tinytuya fusion_solar_py pandas
RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/bin/ipmitool, /usr/sbin/smartctl" >> /etc/sudoers
# RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
