### #!/bin/bash

read -p 'Next sync with /mnt/multi' var3
rsync -vrt --progress --delete /mnt/data/distrib /mnt/multi/backup/
rsync -vrt --progress --delete /mnt/data/homem /mnt/multi/backup/
rsync -vrt --progress --delete /mnt/data/lt /mnt/multi/backup/


read -p 'Next sync with /mnt/flash' var3
rsync -vrt --progress --delete /mnt/data/distrib /mnt/flash/backup/
rsync -vrt --progress --delete /mnt/data/homem /mnt/flash/backup/
rsync -vrt --progress --delete /mnt/data/lt /mnt/flash/backup/
