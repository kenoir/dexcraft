import os

import boto3

region = 'eu-west-1'
instance_id = os.environ['INSTANCE_ID']
ec2 = boto3.client('ec2', region_name=region)


def lambda_handler(event, context):
    ec2.start_instances(InstanceIds=[instance_id])
    print('started your instance: ' + instance_id)
