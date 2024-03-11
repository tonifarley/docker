#!/bin/bash

# creates an AWS Lambda compatible zip from requirements.txt
docker run --rm -v $(pwd):/var/task lambci/lambda:build-python3.8 \
    pip install -r requirements.txt -t python
zip -r layer.zip python/
aws lambda publish-layer-version --layer-name requests2-25-1 --profile brainwave \
    --zip-file fileb://layer.zip --compatible-runtimes python3.8