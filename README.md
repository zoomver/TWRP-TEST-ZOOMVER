 # TWRP-TEST-ZOOMVER
0. TWRP собрано, протестировано.
1. Выполняются все основные функции.
2. Не решён вопрос по работе fastbootd.

Код: /recovery/root/init.recovery.usb.rc
### main function : fastboot ###
on property:sys.usb.config=fastboot && property:sys.usb.configfs=1
    stop adbd
    start fastbootd

on property:sys.usb.ffs.ready=1 && property:sys.usb.config=fastboot
    write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration "fastboot"
    rm /config/usb_gadget/g1/configs/b.1/f1
    rm /config/usb_gadget/g1/configs/b.1/f2
    rm /config/usb_gadget/g1/configs/b.1/f3
    rm /config/usb_gadget/g1/configs/b.1/f4
    rm /config/usb_gadget/g1/configs/b.1/f5
    write /config/usb_gadget/g1/idVendor 0x18d1
    write /config/usb_gadget/g1/idProduct 0x4ee0
    symlink /config/usb_gadget/g1/functions/ffs.fastboot /config/usb_gadget/g1/configs/b.1/f1
    write /config/usb_gadget/g1/UDC ${sys.usb.controller}
    setprop sys.usb.state ${sys.usb.config}

### main function : mtp,fastboot ###
on property:sys.usb.config=mtp,fastboot && property:sys.usb.configfs=1
    stop adbd
    start fastbootd

on property:sys.usb.ffs.ready=1 && property:sys.usb.config=mtp,fastboot
    write /config/usb_gadget/g1/configs/b.1/strings/0x409/configuration "mtp_fastboot"
    rm /config/usb_gadget/g1/configs/b.1/f1
    rm /config/usb_gadget/g1/configs/b.1/f2
    rm /config/usb_gadget/g1/configs/b.1/f3
    rm /config/usb_gadget/g1/configs/b.1/f4
    rm /config/usb_gadget/g1/configs/b.1/f5
    write /config/usb_gadget/g1/idVendor 0x2717
    write /config/usb_gadget/g1/idProduct 0xff18
    symlink /config/usb_gadget/g1/functions/mtp.gs0 /config/usb_gadget/g1/configs/b.1/f1
    symlink /config/usb_gadget/g1/functions/ffs.fastboot /config/usb_gadget/g1/configs/b.1/f2
    write /config/usb_gadget/g1/UDC ${sys.usb.controller}
    setprop sys.usb.state ${sys.usb.config}

    Код: /recovery/root/init.recovery.RMX3231.rc
on boot
    start boot-hal-1-1
    start health-hal-2-1
    setprop sys.usb.config adb
