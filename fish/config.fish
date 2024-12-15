if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
   exec Hyprland
end

function open
    exec xdg-open "$(find -type f | fzf)"
end

#function y
#    set tmp (mktemp -t "yazi-cwd.XXXXXX")
#    yazi $argv --cwd-file="$tmp"
#    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
#        builtin cd -- "$cwd"
#    end
#    rm -f -- "$tmp"
#end

set -g fish_greeting
zoxide init --cmd cd fish | source

alias getpath="find -type f | fzf | sed 's/^..//g' | tr -d '\n' | wl-copy"
alias mf="ls | fzf -m"
alias cppr="rsync --progress -auv"
alias ks="/mnt/data/lt/dotf/script/kaspro-start.sh"
alias kc="/mnt/data/lt/dotf/script/kaspro-coding.sh"
# alias sotkaftp="curlftpfs ftp://sotka:say22say@192.168.0.189:2121 /home/lt/ftp/"
alias sotkaftp="curlftpfs 192.168.0.189:2121 /home/lt/ftp/ -o user=sotka:say22say"
alias usotkaftp="fusermount -u /home/lt/ftp"
alias ls='ls -lhaLXA --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias backup-make='/mnt/data/lt/dotf/script/backup-make.sh'


