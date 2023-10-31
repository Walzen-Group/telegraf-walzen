FROM telegraf:latest
# FROM telegraf:alpine

RUN apt-get update && apt-get install -y --no-install-recommends python3 ipmitool smartmontools sudo python3-venv git wget unzip

ARG CHROME_VERSION=119.0.6045.105

RUN wget -q "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chromedriver-linux64.zip"
RUN unzip chromedriver-linux64.zip -d /opt/chromedriver 
RUN rm chromedriver-linux64.zip 
RUN chmod +x /opt/chromedriver/chromedriver-linux64 
RUN ln -fs /opt/chromedriver/chromedriver-linux64 /usr/local/bin/chromedriver-linux64

# Set the Chrome version

# Download and install Google Chrome
RUN wget -q "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chrome-linux64.zip" \
    && unzip chrome-linux64.zip -d /opt/chrome \
    && rm chrome-linux64.zip \
    && chmod +x /opt/chrome/chrome-linux64 \
    && ln -fs /opt/chrome/chrome-linux64 /usr/local/bin/google-chrome-linux64


ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install tinytuya pandas requests beautifulsoup4 selenium
RUN pip install fusion_solar_py@git+https://github.com/Walzen-Group/FusionSolarPy.git
RUN mkdir -p /etc/telegraf/.cache/selenium && chown -R telegraf:281 /etc/telegraf/.cache/selenium
RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/bin/ipmitool, /usr/sbin/smartctl" >> /etc/sudoers
# RUN apk update && apk upgrade && apk add python3 && apk add ipmitool && apk add smartmontools
