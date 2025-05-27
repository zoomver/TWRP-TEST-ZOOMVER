 # TWRP-TEST-ZOOMVER
0. TWRP собрано, протестировано.
1. Выполняются все основные функции.
2. Установил стоковый init.recovery.common.rc и добавил строки:
start boot-hal-1-1
start health-hal-2-1
Добавил строку из стока:
setprop sys.usb.configfs 1
