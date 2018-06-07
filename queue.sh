#!/bin/bash

#Queue and Move from linked script

if pgrep -x "ffmpeg" > /dev/null
then
        echo running
        exit
if pgrep -x "aws" > /dev/null
then
        echo running
        exit
else
        ~/MyScript/encoding.sh
fi
