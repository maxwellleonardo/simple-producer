#!/bin/bash

deploy-simple-producer(){
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 576962245852.dkr.ecr.us-east-1.amazonaws.com
    docker build -t simple-producer .
    docker tag simple-producer:latest 576962245852.dkr.ecr.us-east-1.amazonaws.com/simple-producer:latest
    docker push 576962245852.dkr.ecr.us-east-1.amazonaws.com/simple-producer:latest
    
    kubectl apply -f deployment.yml
}

deploy-simple-producer