#!/bin/bash

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

aws $REG ec2 start-instances --instance-ids $(aws ec2 describe-instances --filters  "Name=instance-state-name,Values=stopped" --filters "Name=tag:Name,Values=${PREFIX}*" --query "Reservations[].Instances[].[InstanceId]" --output text | tr '\n' ' ')

