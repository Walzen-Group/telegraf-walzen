FROM telegraf:latest
# FROM telegraf:alpine

RUN apt-get update && apt-get install -y --no-install-recommends python3 ipmitool smartmontools sudo python3-venv git wget unzip
ARG CHROMEDRIVER_VERSION=119.0.6045.105
RUN wget -q "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip" \
    && unzip chromedriver_linux64.zip -d /opt/chromedriver \
    && rm chromedriver_linux64.zip \
    && chmod +x /opt/chromedriver/chromedriver \
    && ln -fs /opt/chromedriver/chromedriver /usr/local/bin/chromedriver
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install tinytuya pandas requests beautifulsoup4 selenium
RUN pip install fusion_solar_py@git+https://github.com/Walzen-Group/FusionSolarPy.git
RUN mkdir -p /etc/telegraf/.cache/selenium && chown -R telegraf:281 /etc/telegraf/.cache/selenium
RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/bin/ipmitool, /usr/sbin/smartctl" >> /etc/sudoers
# RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
