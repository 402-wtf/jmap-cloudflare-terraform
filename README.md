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


