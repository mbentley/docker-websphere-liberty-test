#!/bin/bash

set -x

docker build -f Dockerfile -t ibmjava8:antmbasev1.2 .
docker build -f Dockerfile_1 -t sit-dtr.anthem.com/digitech_dev/antm-base-liberty7web:v1.1 .
#docker build -f Dockerfile_2 -t wastest .
