cd ../meteor
meteor build ../build/meteor --architecture os.linux.x86_64
scp ../build/meteor/meteor.tar.gz user@example.org:/home/meteor/build/meteor
ssh user@example "cd /home/meter/scripts && ./deploy-build.sh" &
