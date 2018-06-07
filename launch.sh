#!/bin/bash

#Update and Upgrade Ubuntu
Sudo apt-get update && upgrade -y ;\

#install FFmpeg
sudo add-add-repository ppa:djcj/hybrid ;\
sudo apt-get update ;\
sudo apt-get install ffmpeg -y ;\

#install aws CLI
sudo apt install awscli -y ;\

#Create Script Directory and permission
sudo mkdir /home/ubuntu/MyScript ;\
sudo mkdir /home/ubuntu/Encoded ;\
sudo mkdir /home/ubuntu/Proxies ;\
sudo chmod 640 -R ~/MyScript ;\
sudo chmod 640 -R ~/Encoded ;\
sudo chmod 640 -R ~/Proxies ;\

#Transfer scripts from s3 (this is where you have encoding.sh and queue.sh before launching your instance)
aws s3 mv s3://"Bucket Name"/scripts/ ~/MyScript/ --recursive ;\

#complete recursive permission
sudo chmod 777 -R ~/MyScript ;\

done
