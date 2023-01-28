#!/bin/bash
echo "192.168.50.10      nfss"  >> /etc/hosts
mount nfss:/srv/share /mnt
echo "nfss:/srv/share         /mnt    nfs     defaults,nofail 0 0" >> /etc/fstab
