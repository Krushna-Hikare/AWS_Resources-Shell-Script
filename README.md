# 🧾 AWS Resource Tracker Script

A simple, powerful Bash script that uses the AWS CLI and `jq` to fetch and log details about your AWS infrastructure, including:

- 🖥️ EC2 Instances  
- 🧬 Lambda Functions  
- ☁️ S3 Buckets  
- 👤 IAM Users

---

## 🚀 Features

✅ Lists and logs all:
- EC2 instance IDs  
- Lambda function names  
- S3 bucket names  
- IAM user names  

✅ Uses `jq` to parse JSON neatly  
✅ Appends output to a single tracker file  
✅ Debug-friendly with support for `set -x`  
✅ Stops on error using `set -e` and `pipefail` for safer execution  

---

## 🛠️ Requirements

- AWS CLI installed and configured  
- `jq` installed  
- Valid AWS credentials  
- Bash shell

---

## 📂 Script Overview

```bash
#!/bin/bash
set -eo pipefail  # Safer scripting

x="resource_tracker"
> "$x"  # Clear previous output

echo "Print list of EC2 Instances"
aws ec2 describe-instances | jq .Reservations[].Instances[].InstanceId >> "$x"

echo "Print list of lambda functions"
aws lambda list-functions >> "$x"

echo "Print list of all S3 buckets"
aws s3 ls >> "$x"

echo "Print list of all IAM users"
aws iam list-users >> "$x"
