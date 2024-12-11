#!/usr/bin/bash

ip_addr_tv="192.168.2.126"
ip_addr_complev="192.168.2.103"
ip_addr_complt="192.168.2.101"

scr_active="disable"
compare_str="enable"

while [ true ]; do
    if [ "$scr_active" = "$compare_str" ]; then
        if ping -q -c 1 -n ${ip_addr_tv} >/dev/null; then
            echo -e "TV is on"
        elif ping -q -c 1 -n ${ip_addr_complev} >/dev/null; then
            echo -e "CompLev is on"
	elif ping -q -c 1 -n ${ip_addr_complt} >/dev/null; then
            echo -e "CompLt is on"
        else
           echo -e "TV and CompLev and CompLt is off"
           echo -e "Server now poweroff"
           poweroff
           exit
        fi
    else
        echo -e "scr_active = ${scr_active}"
        if ping -q -c 1 -n ${ip_addr_tv} >/dev/null; then
           scr_active="enable"
           echo -e "scr_active = ${scr_active} by TV"
        elif ping -q -c 1 -n ${ip_addr_complev} >/dev/null; then
           scr_active="enable"
           echo -e "scr_active = ${scr_active} by CompLev"
        elif ping -q -c 1 -n ${ip_addr_complt} >/dev/null; then
           scr_active="enable"
           echo -e "scr_active = ${scr_active} by CompLt"
        fi
    fi
    sleep 300
done
