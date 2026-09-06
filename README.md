# Arch setup

This repo contains the scripts I use to set up a new (Arch btw) machine. It installs
all the programs I rely on and configures my desktop environment so I can go from
a fresh OS install to a fully working setup in minutes

## Setup

Run this line on a fresh install:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/dev-setup/refs/heads/main/setup)"
```

After the script finishes:
* Remember to setup your yubikey and ssh credentials using the scripts in '~/.local/bin`. 
* If your on a laptop remember to setup powertop and tlp for battery life.
