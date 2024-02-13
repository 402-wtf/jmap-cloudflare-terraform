# jmap-cloudflare-terraform
Deployment code for jmap-cloudflare

# Terraform Init
```
terraform init \
  -backend-config "bucket=<bucket_name_value>" \
  -backend-config 'endpoints={ s3 = "https://xxxxx.r2.cloudflarestorage.com" }' \
  -backend-config "access_key=<access_key>" \
  -backend-config "secret_key=<secret_key>"
```

# Environment variables used during CI

|------------------------|------------------------------------------------------------|
| Name                   | Description                                                |
|------------------------|------------------------------------------------------------|
| CLOUDFLARE_API_TOKEN   | The API token used to access Cloudflare tokens             |
| TF_VAR_account_id      | The Cloudflare Account Number to deploy to                 |
| TF_VAR_resource_prefix | The string to prepend to resources created by this project |
|------------------------|------------------------------------------------------------|


# Variables for CI

|------------|----------------------------------------------------|
| Name       | Description                                        |
|------------|----------------------------------------------------|
| bucket     | S3-compatible bucket used to store Terraform state |
| endpoint   | S3 endpoint URL for state management               |
| access_key | S3 access key credential for accessing state       |
| secret_key | S3 secret key credential for accessing state       |
|------------|----------------------------------------------------|


