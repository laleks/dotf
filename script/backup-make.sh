### #!/bin/bash

read -p 'Next sync with /mnt/ext' var3
rsync -vrt --progress --delete /mnt/data/distrib /mnt/ext/
rsync -vrt --progress --delete /mnt/data/dotf /mnt/ext/
rsync -vrt --progress --delete /mnt/data/dotf-local /mnt/ext/
rsync -vrt --progress --delete /mnt/data/homem /mnt/ext/
rsync -vrt --progress --delete /mnt/data/inbox /mnt/ext/
rsync -vrt --progress --delete /mnt/data/obsidian /mnt/ext/
rsync -vrt --progress --delete /mnt/data/res /mnt/ext/
