wget https://downloads.raspberrypi.org/raspbian_lite_latest -O raspbian_lite_latest.zip
unzip raspbian_lite_latest.zip
grep ^### steps.sh
exit
###
###  Next steps:
###
###  sudo dd if=$(ls *raspbian-jessie-lite.img | head -1) of=/dev/sd? bs=4M ; echo "Syncing" ; sudo sync
###  touch /media/$USER/boot/ssh
###  echo "dtoverlay=dwc2" >> /media/$USER/boot/config.txt
###  sed -i 's/rootwait quiet/rootwait modules-load=dwc2,g_serial quiet/' /media/$USER/boot/cmdline.txt
###  for i in $(ls /media/$USER) ; do umount /media/$USER/$i; done
###
