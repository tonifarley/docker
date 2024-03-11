FROM 763104351884.dkr.ecr.us-east-2.amazonaws.com/pytorch-training:1.6.0-gpu-py36-cu101-ubuntu16.04
RUN apt-get update && apt-get install -y unzip awscli
ADD fetch-run.sh /usr/local/bin/fetch-run.sh
RUN pip install gym
WORKDIR /tmp
USER root
RUN chmod 755 /usr/local/bin/deep_learning_container.py
USER nobody
ENTRYPOINT ["/usr/local/bin/fetch-run.sh"]
