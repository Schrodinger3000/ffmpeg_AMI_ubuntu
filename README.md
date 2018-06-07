# FFmpeg For Amazon Linux with Ubuntu

Canon MXF Proxy encoding machine on Amazon Linux with Ubuntu for instance. This is to solve the issue of mapping sound that every other apps have, switching channel 3 and 4 to 1 and 2 leaving 3 and 4 blank. Even AME has this issue!

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

![preAWS.jpeg](https://images.zenhubusercontent.com/5b191e8c80f2a54a594719b5/170ce1f0-2d45-4a81-be9f-63f66a7c5d18)

For the Lambda part, you can follow this Tutorial and adapt it to this solution : https://aws.amazon.com/blogs/compute/scheduling-ssh-jobs-using-aws-lambda/

The Lambda Folder are included:
* Policies
1. lambda_basic_execution.json (which should be in the trigger and the worker)
2. trigger_policy.json
3. worker_policy.json
* worker_function.zip (if you follow tutorial, this is the compiled and zipped version including all dependencies)
FYI you will have to extract worker_function.py from it, edit the path to launch the command and edit the Pem Key.

Problem I have encountered:
*Lambda overrides **queue.sh** conditions and launches **encoding.sh** no matter what when the CloudWatch event is triggered.

I suggest root volume stays small and hold the system only and add a secondary volume mounted and move this solution to it and adapt all paths to reflect this change.

Enjoy
