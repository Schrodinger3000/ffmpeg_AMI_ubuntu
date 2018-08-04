#!/bin/bash

#01 - Move Encoded stuff out
mv ~/Encoded/* ~/Proxies/ ;\

#02 - Move Watch folder content into Encoding for process
aws s3 sync s3://"source BUCKET NAME"/ ~/Encoded/ ;\

#03 - Remove Moved Content from Source Folder
aws s3 rm s3://"source BUCKET NAME"/ --recursive ;\

#04 - Sync Proxies to bucket
aws s3 sync ~/Proxies/ s3://"destination BUCKET NAME"/ ;\

#05 - Empty Proxy Folder
rm -rf ~/Proxies/* ;\

#06 - Encoding MXF to MOV proxy
for i in ~/Encoded/*/*/*.MXF ; do
        ffmpeg -y -i "$i" -c:v prores_ks -profile:v 0 -qscale:v 12 -vendor ap10 -pix_fmt yuv422p10le -s 1920x1080 -filter_complex 'amerge=inputs=4,channelmap=channel_layout=quad' -c:a pcm_s24le -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:fontsize=36: x=(w-tw)/2: y=h-(2*lh): text=PROXY: fontcolor=white: box=1: boxcolor=0x00000000@1" -an -f mov "${i%.*}"_proxy.mov ;\


done
