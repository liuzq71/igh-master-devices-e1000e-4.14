igh Master 在linux 4.14.x的intel e1000e驱动程序,已经在intel82574L网卡运行,

本目录应和igh Master在同级目录。

1),$make

2),$sudo cp ec_e1000e.ko /lib/modules/$(shell uname -r)/ethercat/devices/

3),$sudo depmod

4),$sudo vim /etc/sysconfig/ethercat