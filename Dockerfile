FROM telegraf:latest

RUN apt-get update && apt-get install -y --no-install-recommends python3 lm-sensors nvme-cli smartmontools sudo python3-venv git libgl1-mesa-dev libglib2.0-0 nano intel-gpu-tools
# RUN apt-get update && apt-get install -y --no-install-recommends python3 ipmitool smartmontools sudo python3-venv git libgl1-mesa-dev libglib2.0-0 nano
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install tinytuya polars requests beautifulsoup4 selenium
RUN pip install fusion_solar_py[captcha]@git+https://github.com/Walzen-Group/FusionSolarPy.git
RUN mkdir -p /etc/telegraf/.cache/selenium && chown -R telegraf:281 /etc/telegraf/.cache/selenium
RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/sbin/smartctl, /usr/bin/intel_gpu_top" >> /etc/sudoers
RUN setcap "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" /usr/bin/intel_gpu_top
# RUN echo "telegraf ALL=(ALL) NOPASSWD:/usr/bin/ipmitool, /usr/sbin/smartctl" >> /etc/sudoers
