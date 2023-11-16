obj-m += dm-dedup.o

dm-dedup-objs := dm-dedup-cbt.o dm-dedup-hash.o dm-dedup-ram.o dm-dedup-check.o dm-dedup-rw.o dm-dedup-target.o

EXTRA_CFLAGS := -Idrivers/md

all:
	# make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	make -C /home/femu/tool/linux-5.19.17 M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	sudo cp dm-dedup.ko /lib/modules/$(shell uname -r)/kernel/drivers/md
