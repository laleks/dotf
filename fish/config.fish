set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
   exec start-hyprland
end

function open
    exec xdg-open "$(find -type f | fzf)"
end

zoxide init --cmd cd fish | source

#alias getpath="find -type f | fzf | sed 's/^..//g' | tr -d '\n' | wl-copy"
#alias mf="ls | fzf -m"
#alias cppr="rsync --progress -auv"
alias ls='ls -lhaXA --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINTS,MODEL,UUID'
