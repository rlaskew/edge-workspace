#!/bin/sh

alias acf='aws cloudformation'
acf validate-template --template-body file://ec2-test-machine.yaml

## ec2 test machine
VPC_ID=vpc-0d97c362a89da1538 && SUBNET_ID=subnet-024bc978ff6547694
acf create-stack --template-body file://ec2-test-machine.yaml --region us-east-1 --stack-name ec2-test-machine-take1 \
	--parameter ParameterKey=KeyNameParameter,ParameterValue=MyKeyPair \
       	ParameterKey=VpcIdParameter,ParameterValue=${VPC_ID} \
       	ParameterKey=SubnetIdParameter,ParameterValue=${SUBNET_ID} \
       	ParameterKey=AZParameter,ParameterValue=us-east-1a --capabilities CAPABILITY_IAM 
