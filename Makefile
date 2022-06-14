TARGET  = hello

OBJS    = obj/bootstrap.o obj/main.o

ARCH    = arm-none-eabi
CFLAGS  = -W -Wall -g -Os -mcpu=cortex-m3 -mthumb -mabi=aapcs -mfloat-abi=soft $(CFLAGS_EXTRA)
LDFLAGS = -Wl,--gc-sections -march=armv7-m -mabi=aapcs  -nostartfiles -nostdlib -lc -lnosys -lgcc
AFLAGS  = --warn --fatal-warnings -mcpu=cortex-m3

all: $(TARGET).bin

$(TARGET).bin: obj/$(TARGET).elf
	$(ARCH)-objcopy -O binary $< $@

obj/$(TARGET).elf: $(OBJS)
	$(ARCH)-gcc $^ $(LDFLAGS) -T link.ld -o $@ -Wl,-Map=$@.map

obj/%.o: %.c
	@mkdir -p $(dir $@)
	$(ARCH)-gcc $(CFLAGS) -c $< -fdata-sections -ffunction-sections -o $@

obj/%.o: %.s
	@mkdir -p $(dir $@)
	$(ARCH)-as $(AFLAGS) $< -o $@

clean:
	rm -rf *.{bin,elf,map,lst,tgz,zip,hex} obj

load: $(TARGET).bin
	st-flash --reset write $(TARGET).bin 0x08000000

probe:
	st-info --probe
