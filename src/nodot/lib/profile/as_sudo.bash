#!/usr/bin/env bash

pgrep rpcbind &>/dev/null || sudo /sbin/rpcbind
