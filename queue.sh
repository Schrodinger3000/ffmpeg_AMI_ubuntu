#!/bin/bash

#Queue and Move from linked script

if pgrep -x "ffmpeg" > /dev/null
then
        echo running
if pgrep -x "aws" > /dev/null
then
        echo running        
else
        ~/MyScript/encoding.sh
fi
