#!/bin/bash
############################
#Author:Rakesh Jha
#Date:20 April 2026
#
#Version:V1
#
#This Script Will report the aws resource usage 
#############################################
#
set -x
#Resources that we are going to track are 

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users 
#These are the details our script will report back
#
#
#List S3 Buckets 
echo "S3 Buckets in use:"
aws s3 ls > resourceTracker

#List EC2 Instances
echo "EC2 Instances Running:"
aws ec2 describe-instances|jq'.Reservations[].Instances[].InstancesID'

#list lambda Functions
echo "List of Lambda Functions are:"
aws lambda list-functions >> resourceTracker:q!
