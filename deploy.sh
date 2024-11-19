#!/bin/bash
docker pull <dockerhub-username>/dev:<tag>
docker run -d -p 80:80 <dockerhub-username>/dev:<tag>

