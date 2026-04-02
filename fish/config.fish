source /usr/share/cachyos-fish-config/cachyos-config.fish

#set -g fish_greeting
#set -gx PATH $PATH /opt/android-sdk/platform-tools
#set -gx PATH $PATH /var/lib/snapd/snap/bin

#if status is-interactive
#    # Commands to run in interactive sessions can go here
#end


# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# zoxide init --cmd cd fish | source

#alias ls='ls -lhaXA --color=auto --group-directories-first'
#alias grep='grep --color=auto'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,FSUSED,MOUNTPOINTS,MODEL,UUID'
# alias nvim="VIMRUNTIME=/mnt/data/distrib/aur/neovim/runtime NVIM_APPNAME=kek /mnt/data/distrib/aur/neovim/build/bin/nvim"