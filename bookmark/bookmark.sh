### #!/bin/sh

wtype $(grep -v '^#' /mnt/data/lt/dotfiles/bookmark/bookmark.txt | wofi --dmenu)
