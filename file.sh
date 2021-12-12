sudo yum install -y docker 
sudo docker --version
sudo service docker start
sudo systemctl enable docker
sudo docker login --username=teenakohli2286 --password=teena123
sudo docker pull teenakohli2286/petkeepers.jar
sudo docker run -p 8080:8080 -d teenakohli2286/petkeepers.jar
sudo docker pull teenakohli2286/petkeepers-ui
<<<<<<< HEAD
sudo docker run -p 3000:3000 -d teenakohli2286/petkeepers-ui
=======
sudo docker run -p 3000:3000 -d teenakohli2286/petkeepers-ui
>>>>>>> 1d35b839fca5d7a7a1170677d2dff1c9b2ba22e0
