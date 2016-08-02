cd ../meteor
meteor build ../build --architecture os.linux.x86_64
scp ../build/meteor.tar.gz user@example.org:/home/meteor/build
ssh user@example "cd /home/meteor/scripts && ./deploy-build.sh" &
