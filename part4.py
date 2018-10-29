import boto3

ec2 = boto3.client('ec2', region_name='us-east-2')
response = ec2.describe_instances()
print('INSTANCES')
for r in response['Reservations']:
    for instance in r['Instances']:
        if instance['State']['Name'] == 'terminated':
            continue
        print('{} {} {} {}'.format(
            instance['InstanceId'],
            instance['State']['Name'],
            instance['PrivateIpAddress'],
            instance['PublicDnsName'],
        ))

print('RDS')
rds = boto3.client('rds', region_name='us-east-2')
response = rds.describe_db_instances()
#for key in response['DBInstances'][0]:
#    print(key)

for instance in response['DBInstances']:
    print('{} {} {} {}'.format(
        instance['DBName'],
        instance['MasterUsername'],
        instance['DBInstanceStatus'],
        instance['Endpoint']['Address'],
    ))

print('ELASTICACHE')

cache = boto3.client('elasticache', region_name='us-east-2')
response = cache.describe_cache_clusters()
#for key in response['CacheClusters'][0]:
#    print(key)
for instance in response['CacheClusters']:
    print('{} {} {} {}'.format(
        instance['CacheClusterId'],
        instance['CacheClusterStatus'],
        instance['Engine'],
        instance['NumCacheNodes'],
    ))
print('ELASTIC BEANSTALK')
ebs = boto3.client('elasticbeanstalk', region_name='us-east-2')
response = ebs.describe_applications()
#for key in response['Applications'][0]:
#    print(key)
for instance in response['Applications']:
    print('{} {} {}'.format(
        instance['ApplicationArn'],
        instance['ApplicationName'],
        instance['DateCreated'],
    ))
