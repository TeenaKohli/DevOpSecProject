#!/bin/bash
yum update -y
sudo yum install -y docker 
sudo docker --version
sudo service docker start
sudo systemctl enable docker
sudo docker login --username=teenakohli2286 --password=teena123
sudo docker pull teenakohli2286/petkeepers.jar
sudo docker run -p 8080:8080 -d teenakohli2286/petkeepers.jar
sudo docker pull teenakohli2286/petkeepers-ui
sudo docker run -p 3000:3000 -d teenakohli2286/petkeepers-ui
