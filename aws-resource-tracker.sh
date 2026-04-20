#!/bin/bash
############################
#Author:Rakesh Jha
#Date:20 April 2026
#
#Version:V2
#
#This Script Will report the aws resource usage 
#############################################
#

#Resources that we are going to track are 

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users 
#These are the details our script will report back
#
#####################################################################################

#List S3 Buckets 
echo "S3 Buckets in use:"
aws s3 ls 

####################################################################################
#List EC2 Instances
echo "EC2 Instances Running:"
aws ec2 describe-instances

###################################################################################

#list lambda Functions
echo "List of Lambda Functions are:"
aws lambda list-functions

######################################################################################

#Checking IAM Resources 
echo "===== IAM RESOURCES ====="

echo "Users:"
aws iam list-users --query 'Users[*].UserName' --output text

echo "Roles:"
aws iam list-roles --query 'Roles[*].RoleName' --output text

echo "Policies:"
aws iam list-policies --scope Local --query 'Policies[*].PolicyName' --output text

###############################################################################################

#Checking Users Without MFA
echo "====Checking Users Without MFA========="
aws iam list-users --query 'Users[*].UserName' --output text | while read user; do
    mfa=$(aws iam list-mfa-devices --user-name "$user" --query 'MFADevices' --output text)
    if [ -z "$mfa" ]; then
        echo "User without MFA: $user"
    fi
done
########################################################


