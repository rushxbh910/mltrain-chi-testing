import boto3
s3 = boto3.client('s3', endpoint_url='http://localhost:9000', aws_access_key_id='admin', aws_secret_access_key='password')
print(s3.list_buckets())
print(s3.get_object(Bucket='mybucket', Key='foo/bar.txt')['Body'].read())
