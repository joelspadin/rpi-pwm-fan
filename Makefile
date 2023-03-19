BUILDDIR ?= build

all: rpi-pwm-fan.dtbo rpi-pwm-fan.eep

build-dir:
	mkdir -p $(BUILDDIR)

rpi-pwm-fan.dtbo: build-dir rpi-pwm-fan-overlay.dts
	dtc -@ -Hepapr -I dts -O dtb -o build/rpi-pwm-fan.dtbo rpi-pwm-fan-overlay.dts

rpi-pwm-fan.eep: build-dir $(BUILDDIR)/rpi-pwm-fan.dtbo
	eepmake eeprom_settings.txt $(BUILDDIR)/rpi-pwm-fan.eep $(BUILDDIR)/rpi-pwm-fan.dtbo

install: $(BUILDDIR)/rpi-pwm-fan.dtbo
	install $(BUILDDIR)/rpi-pwm-fan.dtbo /boot/overlays/

uninstall:
	rm -f /boot/overlays/rpi-pwm-fan.dtbo

flash: $(BUILDDIR)/rpi-pwm-fan.eep
	eepflash.sh -y -w -t=24c128 -f=$(BUILDDIR)/rpi-pwm-fan.eep

clean:
	rm -rf $(BUILDDIR)
