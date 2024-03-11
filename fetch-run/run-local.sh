#!/bin/bash

AWS_ACCESS_KEY_ID=$(aws --profile brainwave configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile brainwave configure get aws_secret_access_key)

# --it interactive (keep stdin open) and psuedo-TTY
# --rm removes container after running

docker run -it --rm \
   -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
   -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
   -e BATCH_FILE_TYPE=zip \
   -e BATCH_FILE_S3_URL=s3://exlsource/btorch.zip \
   -e MPLCONFIGDIR=/tmp \
   -e PYTHONUNBUFFERED=0 \
   -e AWS_BATCH_JOB_ID=0 \
    fetch-run train.py
