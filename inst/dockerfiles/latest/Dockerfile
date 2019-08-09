
# EOL April 2023
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get install -y \
    wget python2.7 python-numpy python-pandas python-pip curl unzip

RUN pip install sklearn logtools

# Updating version
RUN wget https://github.com/brettc/partitionfinder/archive/master.tar.gz && \
    tar zxvf master.tar.gz && \
    rm master.tar.gz && \
    mv partitionfinder-master partitionfinder

# outsider requires working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
