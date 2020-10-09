#!/bin/bash

AWS_PAGER=""

PREFIX=$1
REGION=$2

if [ -z "$PREFIX" ]; then
   echo "usage: $0 <instance_prefix> <region|'leave blank'>" >&2
   exit 1
fi

if [ -z "$REGION" ]; then
  REG=""
else
  REG="--region $REGION"
fi

aws $REG ec2 describe-instances --filters "Name=tag:Name,Values=${PREFIX}*" --query "Reservations[*].Instances[*].[Tags[?Key=='Name']|[0].Value,InstanceId,State.Name,PrivateIpAddress,PublicIpAddress,PublicDnsName] | sort_by(@, &@[0][0])" --output table 

