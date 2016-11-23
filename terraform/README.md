spark: terraform
================

Usage:

    $ export AWS_ACCESS_KEY_ID="anaccesskey" 
    $ export AWS_SECRET_ACCESS_KEY="asecretkey"
    $ terraform remote config \
      -backend=s3 \
      -backend-config="bucket=(YOUR_BUCKET_NAME)" \
      -backend-config="key=terraform.tfstate" \
      -backend-config="region=(YOUR_BUCKET_REGION)" \
      -backend-config="encrypt=true"
    $ terraform plan
