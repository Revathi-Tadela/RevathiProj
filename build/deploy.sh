#!/bin/bash
ssh -i /home/ec2-user/devops-build.pem ec2-user@<34.228.194.161> << EOF
docker pull revathi-tadela1/dev1:latest
docker ps -q --filter "ancestor=revathi-tadela1/dev1:latest" | xargs -r docker stop
docker ps -a -q --filter "ancestor=revathi-tadela1/dev1:latest" | xargs -r docker rm
docker run -d -p 80:80 revathi-tadela1/dev1:latest
EOF

