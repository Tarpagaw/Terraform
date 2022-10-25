#!/bin/bash
yum -y update
sudo yum install git -y
sudo yum install python3 -y
sudo yum install python3-pip
git clone https://github.com/uturndata-public/tc-candidate-tarpagaw.git
cd Flaskapp
export TC_DYNAMO_TABLE=Candidates
pip3 install -r requirements.txt
cp app.py requirements.txt test_candidates.py /home/ec2-user/
sudo cp gunicorn /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn