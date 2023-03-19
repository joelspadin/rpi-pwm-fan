# Raspberry Pi PWM Fan Hat

DeviceTree overlay for a Raspberry Pi HAT with a PWM fan, based on https://github.com/lzoledziewski/rpi-pwm-fan

The fan's PWM wire should be connected to GPIO18 (PWM0). This can be changed to a different PWM pin with the `pwms` property in [rpi-pwm-fan-overlay.dts](rpi-pwm-fan-overlay.dts).

## Install Dependencies

```bash
sudo apt install make gcc device-tree-compiler

git submodule update --init --recursive
cd hats/eepromutils
make && sudo make install
```

## Build

```bash
make
```

## Flash to HAT EEPROM

```bash
sudo make flash
```

## Enable Driver

Add to `/boot/config.txt`:

```ini
[all]
dtoverlay=pwm
dtoverlay=rpi-pwm-fan
```

## Install

If not using a HAT EEPROM, you can install the files to your system:

```bash
sudo make install
```

This can be reversed with:

```bash
sudo make uninstall
```
