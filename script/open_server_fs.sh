#!/bin/bash
#sshfs root@x.x.x.x:/var/www/html /media/maniya.hair -o reconnect
sshfs root@x.x.x.x:/var/www/html /media/maniya.hair -o reconnect,idmap=user

# for mount: execute this file without sudo
# for umount: fusermount -u /media/maniya.hair
