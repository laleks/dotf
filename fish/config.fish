if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

alias ls='ls -lhaXA --group-directories-first'
#alias grep='grep --color=auto'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,FSUSED,MOUNTPOINTS,MODEL,UUID'

#alias pacmanplayr='epm query' # проверка наличия установленного пакета по его точному имени
#alias pacman-Ss='epm grep' # Поиск установленных пакетов по названию

abbr -a aptupd "sudo apt-get update" # обновление списка пакетов
abbr -a apti "epm install"
abbr -a aptr "epm remove"
abbr -a aptupg "epm upgrade && epm play --update all" # обновить все пакеты в системе
abbr -a apts "epm search" # поиск пакета по кэшу репазитория
abbr -a aptp "epm play" # установить пакет с помощью epm play
abbr -a aptl "epm filelist" # список файлов внутри установленного пакета
abbr -a aptinf "epm info" # показывает детали по пакету
