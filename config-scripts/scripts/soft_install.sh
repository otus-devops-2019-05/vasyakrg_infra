#!/bin/bash

mkdir /home/userapp/
cd /home/userapp
# Ruby install
cat <<EOF >> install_ruby.sh
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
EOF

sh install_ruby.sh

# MondoDB install
cat <<EOF >> install_mongodb.sh
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
EOF

sh install_mongodb.sh

# Work to deploy
cat <<EOF >> deploy.sh
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install && puma -d && ps aux | grep puma > puma_state.txt
EOF

sh deploy.sh