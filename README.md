# ffmpeg_AMI_ubuntu

Canon MXF Proxy encoding machine on Amazon Linux with Ubuntu for instance

**First step** is to have Role with Ec2 accessing S3 Buckets with Reading and Writing permission.

You should have 2 Buckets and adapt their **UNIQUE names** in the **encodin.sh** script

Copy encoding.sh and queue.sh in a new **"bucket of your choice"/script** (adapt your naming in the launch.sh)

And finally launch an Amazon **UBUNTU** instance and in the **ADVANCED** settings copy the **launch.sh** which will:

1. Update your Ubuntu Instance
2. Install FFmpeg
3. Create Folders and Permissions
4. Transfer necessary scripts
5. Change Execute Permissions

I could have done it easier but didn't feel like spending more time than I already did on this!

![alt text]( ffmpeg_AMI_ubuntu/peaws.jpeg)

Enjoy
