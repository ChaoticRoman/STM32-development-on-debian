# Getting started with STM32 on Linux

## Requirements

On Debian install required tools:

```
sudo apt install gcc-arm-none-eabi stlink-tools make
```

## Build

```
make
```

## Upload using ST-LINK V2

```
make load
```

## Linker script `link.ld`

**TODO:**

* Understand it
* Should not be it modified if some RAM is used?
* What is this `LENGTH` below? Address size?

```
MEMORY {
  rom : ORIGIN = 0x08000000, LENGTH = 0x10000
  ram : ORIGIN = 0x20000000, LENGTH = 0x10000
}
```

## `bootstrap.s`

**TODO:** What is this for?

* https://stackoverflow.com/questions/18848776/what-does-label-word-label-mean-in-arm-assembly
* https://stackoverflow.com/questions/48084634/what-does-b-mean-in-this-assembly-code

## References

* [RM0008 Reference manual: STM32F101xx, STM32F102xx, STM32F103xx, STM32F105xx and STM32F107xx advanced Arm®-based 32-bit MCUs](https://www.st.com/resource/en/reference_manual/cd00171190.pdf)
* [Blue Pill (STM32F103C8T6)](https://erc-bpgc.github.io/handbook/electronics/Development_Boards/STM32/)
* [stackoverflow.com: Really Minimal STM32 Application: linker failure](https://stackoverflow.com/questions/49885034/really-minimal-stm32-application-linker-failure)


