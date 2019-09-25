#!/bin/bash

PREFIX=$1

if [ -z "$PREFIX" ]; then
   echo "usage: $0 <instance_prefix>" >&2
   exit 1
fi

aws ec2 stop-instances --instance-ids $(aws ec2 describe-instances --filters  "Name=instance-state-name,Values=running" --filters "Name=tag:Name,Values=${PREFIX}*" --query "Reservations[].Instances[].[InstanceId]" --output text | tr '\n' ' ')

