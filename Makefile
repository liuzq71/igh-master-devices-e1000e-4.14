##################################################################
#1, obj-m   是告诉makefile最终的编译目标是什么。比如obj-m   = test.o   
#那么最终编译的模块镜像就是test.ko
#2, $(TARGET)-objs  是告诉makefile 最终的编译目标需要依赖哪些目标文件，
#再利用makefile的隐式规则生成所需的目标文件。最终链接为模块目标文件
##################################################################
 
KVERS = $(shell uname -r)
PWD := $(shell pwd)
CURDIR := $(shell pwd)  
TARGET := ec_e1000e

#Kernel modules
obj-m +=  $(TARGET).o
 
$(TARGET)-objs:= netdev-4.14-ethercat.o ethtool-4.14-ethercat.o \
	param-4.14-ethercat.o 82571-4.14-ethercat.o \
	ich8lan-4.14-ethercat.o 80003es2lan-4.14-ethercat.o \
	mac-4.14-ethercat.o nvm-4.14-ethercat.o phy-4.14-ethercat.o \
	manage-4.14-ethercat.o ptp-4.14-ethercat.o 

#$(TARGET)-objs += $(PWD)/../etherlabmaster-code/master/device.o $(PWD)/../etherlabmaster-code/master/module.o
 
#specify flags for the module compilation.
EXTRA_CFLAGS +=-g -O0
EXTRA_CFLAGS +=-I$(INCDIR1) -I$(INCDIR2)
 
build:kernel_modules
 
kernel_modules:
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) INCDIR1=$(PWD) INCDIR2=$(PWD)/../etherlabmaster-code/devices modules
 
clean:
	make -C /lib/modules/$(KVERS)/build M=$(CURDIR) INCDIR1=$(PWD) INCDIR2=$(PWD)/../etherlabmaster-code/devices clean


