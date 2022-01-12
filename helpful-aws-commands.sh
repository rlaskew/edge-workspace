#!/bin/bash
alias acf='aws cloudformation'
acf validate-template --template-body file://vpc.yaml
# acf create-stack --template-body file://vpc.yaml --stack-name myvpc
acf create-stack --template-body file://vpc.yaml --stack-name myvpc --region us-east-1 --parameter ParameterKey=EnvironmentName,ParameterValue=dev
acf describe-stack-events --stack-name myvpc
aws ec2 describe-vpcs
acf delete-stack --stack-name myvpc
