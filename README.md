# Introduction
This is a series of scripts and files for production-grade deployment of Meteor
Please visit this forum thread to get the history: https://forums.meteor.com/t/deploying-to-aws-with-meteor-1-3-5-still-using-mup/27306/20

![PM2 Web client](https://github.com/ramezrafla/meteor-deployment/blob/master/screenshots/pm2.png?raw=true)

# Warnings
1. First, this is for experienced system administrators. Please don't submit an issue asking 'How do I generate an SSH key'. 
2. You should really look into using MDG's own hosting solution first. Only if you have different needs does it make sense to launch your own servers.
3. These scripts are sanitized versions of what we are currently using for our app (https://zeschool.zegenie.com), we will make every effort to keep up to date
4. PR's are welcome

# Setup
We are using:

1. PM2 for all process management (see sample pm2.json which you have to start manually the first time on the server) -- and read PM2 docs for more info
2. tengine with stick session -- see our sample nginx.conf
3. Shell scripts to push build via SSH
4. Shell scripts to install build remotely on server
5. Of course, nodejs / npm should be installed on your server (as well as pm2)

# Folders

On the server, 

1. we assume the app will be started from /home/meteor/build
2. pm2.json and deploy-build.sh should be located in /home/meteor/scripts


# Process
1. We compile on our dev machine
2. Push the tarball onto server
3. Decompress and install on server
4. Reload PM2

All this is done by calling local script ./build-remote.sh which takes care of everything (if you set things based on the folders above).

# A note about tengine
Tengine (http://tengine.taobao.org/documentation.html) is a fork of nginx but with solid production-grade features (that you would have to pay for with the pro version of nginx). nginx.conf in this repo contains our (sanitized) setup. 

# Bonus
1. You will notice in the nginx.conf we are accessing the pm2 web interface to get real time view of how our processes are running (Really cool!) -- see image at top of this readme
2. You will also notice in nginx.conf that status.example.org provides real-time view of the three meteor processes we have launched (load balancer status)
![Status](https://github.com/ramezrafla/meteor-deployment/blob/master/screenshots/status.png?raw=true)
3. We use Icinga2 (you can use Nagios too) to monitor server health, including checking on the load balancer status and pm2 processes (not included yet)
