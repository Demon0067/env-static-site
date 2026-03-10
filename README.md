# env-static-site

Environment repository for deploying a static website on AWS S3 using Terraform.

## Features

- Terraform-managed S3 static website
- Remote state stored in S3
- Jenkins CI/CD pipeline
- Automatic website deployment using `aws s3 sync`

## Pipeline Stages

fmt → validate → plan → manual approve → apply → upload site

## Website Files

Located in `/site`

## Access

After deployment Terraform outputs the website endpoint.