#!/bin/bash
echo "192.168.50.10      nfss"  >> /etc/hosts
mount nfss:/srv/share /mnt -o udp,nolock
echo  "nfss:/srv/share  /mnt  nfs   nfsvers=3,proto=udp           0 0" >> /etc/fstab
systemctl daemon-reload 

