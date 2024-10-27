#!/usr/bin/expect

# Start OrbStack, run commands, and exit
spawn orb
send "dtcpp ./arch/arm64/boot/dts/rockchip/rk3588-nanopc-cm3588-edp-mod.dts rk3588-nanopc-cm3588-edp-mod.dts.preprocessed && dtc -I dts -O dtb rk3588-nanopc-cm3588-edp-mod.dts.preprocessed -o edp-mod.dtb\r"
send "exit\r"
send "exit\r"

# SCP the .dtb file to the remote machine
spawn scp ./edp-mod.dtb t9@10.1.20.214:/usr/lib/firmware/6.1.0-1021-rockchip/device-tree/rockchip
expect "password:"
send "t\r"
