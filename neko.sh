#!/bin/bash
FIRM=./firm/
IMG=./img/
function flash_sec () {
    echo "  flash sec in ${FIRM}"
    fastboot flash secboot ${FIRM}/secboot.toc
    fastboot flash scp ${FIRM}/init_dram.toc
    fastboot flash 1o0 ${FIRM}/secboot.toc
    fastboot flash 2o1 ${FIRM}/scp.toc
    fastboot flash 0o2820 ${FIRM}/u-boot.toc
    fastboot flash 1:380 ${FIRM}/secos.toc
    fastboot flash 1:320 ${FIRM}/modem.toc
}
function reboot () {
    echo "  rebooting"
    fastboot flash secboot ${FIRM}/secboot.toc
    fastboot flash scp ${FIRM}/reboot.toc
}
function burn_img () {
    echo "  flash imgs"
    fastboot flash boot ${IMG}/boot.img
    fastboot flash system ${IMG}/system.img
    fastboot flash userdata ${IMG}/userdata.img
    fastboot flash devicetree ${IMG}/elite2000-fpga.dtb
    fastboot flash cache ${IMG}/cache.img
    fastboot flash recovery ${IMG}/recovery.img
}
if [ $# -eq 0 ];then
    echo "usage: ./neko.sh [f] [r] [b]"
    echo "     [f]irm: burn firmware"
    echo "     [r]eboot: reboot"
    echo "     [b]urn: burn images"
    echo "                           *please use root user"
    exit
fi

if [ "$1" == "f" ];then
    if [ -n "$2" ];then
        if [ ! -d "$2" ];then
        echo "no such folder \"$2\""!
        exit
        fi
    FIRM=$2
    echo use firmware from $FIRM
    fi
    flash_sec
    exit
fi

if [ "$1" == "r" ];then
    if [ -n "$2" ];then
        if [ ! -d "$2" ];then
        echo "no such folder \"$2\""!
        exit
        fi
    FIRM=$2
    echo use reboot from $FIRM
    fi
    reboot
    exit
fi

if [ "$1" == "b" ];then
    burn_img
    exit
fi
