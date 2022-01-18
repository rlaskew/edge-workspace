#!/bin/bash

### commit
git config --global user.email "you@example.com" && git config --global user.name "Your Name"
### Generate EC2 Key pair
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

alias acf='aws cloudformation'
acf validate-template --template-body file://vpc.yaml
# acf create-stack --template-body file://vpc.yaml --stack-name myvpc
acf create-stack --template-body file://vpc.yaml --stack-name myvpc --region us-east-1 --parameter ParameterKey=EnvironmentName,ParameterValue=dev
acf describe-stack-events --stack-name myvpc
aws ec2 describe-vpcs
acf delete-stack --stack-name myvpc

## useful for seeding parameters
aws ec2 describe-subnets | jq .Subnets[0]

## create ec2
acf create-stack --template-body file://ec2.yaml --region us-east-1 --stack-name ec2-take1 --parameter ParameterKey=KeyNameParameter,ParameterValue=MyKeyPair --capabilities CAPABILITY_IAM
