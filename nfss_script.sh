#!/bin/bash

yum install nfs-utils vim -y
systemctl start firewalld
firewall-cmd --add-service="nfs3"  --add-service="rpc-bind"  --add-service="mountd"  --permanent
firewall-cmd --reload
systemctl enable nfs --now
mkdir -p /srv/share/upload        
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
cat << EOF > /etc/exports
/srv/share      *(rw,sync,root_squash)
EOF
touch /srv/share/file_test
exportfs -a
systemctl status nfs-server
