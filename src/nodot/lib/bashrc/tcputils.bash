#!/usr/bin/env bash
# TCP utility aliases
# Intended to be sourced

function tcplook { \
    if [[ $# < 1 ]] ; then \
        echo usage: tcplook dumpname ; \
    else \
        dumpname=$1 ; \
        tcpdump -n -tttt -r $dumpname src port 80 or src port 443 ; \
    fi ; \
}
function tcpread { \
    if [[ $# < 3 ]] ; then \
        echo usage: tcpread dumpname appliance-aux-ip local-ip ; \
    else \
        dumpname=$1 ; \
        auxip=$2 ; \
        localip=$3 ; \
        tcpdump -n -XX -tttt -r $dumpname \
            src host $auxip and \( src port 80 or src port 443 \) \
            and dst host $localip and 'ip[2:2] >= 249' | \
        tcpdata.py ; \
    fi ; \
}
