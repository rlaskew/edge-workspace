#!/bin/sh

## from https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-awscli.html

## tested commands from AWS cloudshell

## create role for lambda execution
aws iam create-role --role-name lambda-ex --assume-role-policy-document '{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'

## alternate version
aws iam create-role --role-name lambda-ex --assume-role-policy-document file://trust-policy.json

## attach policy
aws iam attach-role-policy --role-name lambda-ex --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

## create deployment package
zip function.zip index.py

## get account number
ACCOUNT=$(aws sts get-caller-identity --query "Account" --output text)
echo $ACCOUNT

## deploy lambda with cli 
aws lambda create-function --function-name my-function \
	--zip-file fileb://function.zip --handler index.lambda_handler --runtime python3.9 \
	--role arn:aws:iam::${ACCOUNT}:role/lambda-ex
