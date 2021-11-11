#!/bin/bash
alias acf='aws cloudformation'
acf validate-template --template-body file://vpc.yaml
acf create-stack --template-body file://vpc.yaml --stack-name myvpc
acf describe-stack-events --stack-name myvpc
aws ec2 describe-vpcs
