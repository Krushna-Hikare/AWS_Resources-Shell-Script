#!/bin/bash
#############
# Author: Krushna H
# Date: 07-06-2025

# This code will show AWS resource usage of EC2, S3, IAM, Lambda
#############

set -x #debug mode

x="resource_tracker"

#This shows all instances
echo "Print list of EC2 Instances"
aws ec2 describe-instances | jq .Reservations[].Instances[].InstanceId >> "$x"

#jq is json parsor and yq is for yaml parsor: it's used to take out specific out from json for jq.

#This lists all lambda functions
echo "Print list of lambda functions"
aws lambda list-functions >> "$x"

#This lists all S3
echo "Print list of all S3 buckets"
aws s3 ls >> "$x"

#List IAM users
echo "Print list of all IAM users"
aws iam list-users >> "$x"
