# aws-scripts


__**Pre-requisites:**__

- AWS cli installed (https://docs.aws.amazon.com/cli/latest/userguide/install-bundle.html#install-bundle-other)



__**Installation:**__

1) Configure AWS credentials as follows:

```
::::::::::::::::::::::::::
~/.aws/config
::::::::::::::::::::::::::

[default]
output = text
region = us-east-1

::::::::::::::::::::::::::
~/.aws/credentials
::::::::::::::::::::::::::

[default]
aws_access_key_id = <your_access_key_id>
aws_secret_access_key = <your_secret_access_key>
```

2) Copy the scripts to /usr/local/bin directory and ensure that /usr/local/bin is included in your $PATH



__**Usage:**__

- Listing AWS instances using an instance name prefix (based on a Name tag value) :
```
# awslist.sh <instance_prefix>
```

- Starting AWS instances using an instance name prefix (based on a Name tag value) :
```
# awsstart.sh <instance_prefix>
```

- Stopping AWS instances using an instance name prefix (based on a Name tag value) :
```
# awsstop.sh <instance_prefix>
```
