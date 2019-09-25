#!/bin/bash

PREFIX=$1

if [ -z "$PREFIX" ]; then
   echo "usage: $0 <instance_prefix>" >&2
   exit 1
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=${PREFIX}*" --query "Reservations[*].Instances[*].[Tags[?Key=='Name']|[0].Value,InstanceId,State.Name,PrivateIpAddress,PublicIpAddress,PublicDnsName]" --output text | sort

