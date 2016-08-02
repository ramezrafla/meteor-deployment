# Introduction
This is a series of scripts and files for production-grade deployment of Meteor
Please visit this forum thread to get the history: https://forums.meteor.com/t/deploying-to-aws-with-meteor-1-3-5-still-using-mup/27306/20

# Warnings
1. First, this is for experienced system administrators. Please don't submit an issue asking 'How do I generate an SSH key'. 
2. You should really look into using MDG's own hosting solution first. Only if you have different needs does it make sense to launch your own servers.
3. These scripts are sanitized versions of what we are currently using for our app (https://zeschool.zegenie.com), we will make every effort to keep up to date
4. PR's are welcome

# Setup
We are using:

1. PM2 for all process management (see sample pm2.json) -- and read PM2 docs for more info
2. tengine with stick session -- see our sample nginx.conf
3. Shell scripts to push build via SSH
4. Shell scripts to install build remotely on server

# Process
1. We compile on our dev machine
2. Push the tarball onto server
3. Decompress and install on server
4. Reload PM2
