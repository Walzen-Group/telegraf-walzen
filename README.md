# Telegraf for Walzen Group

This is the telegraf container with software added to function for the Walzen Group.
Will need to be periodically updated with the upstreeam image.

Added software & tools:

Programs:
- python3
- ~~ipmitools~~ deprecated as we switched hardware
- lm-sensors
- smartmontools
- nano
- nvme/cli

Python packages:
- ~~pandas~~ migrated to polars
- polars
- tinytuya
- requests
- beautifulsoup4
- selenium
- [fusionsolarpy](https://github.com/Walzen-Group/FusionSolarPy) (forked from jgriss)

