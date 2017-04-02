# dsinfra/terraform

Terraform configuration for my personal infrastructure.

This repo has my SSH public key hard-coded in, so you'll probably need to
change that for it to work if you're not me.

## Quickstart

### Dependencies

Just [terraform](https://www.terraform.io/).

### Running

Terraform needs your AWS credentials. There are
[various ways](https://www.terraform.io/docs/providers/aws/) you can provide
these, but I recommend using
[AWS profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)
and setting `AWS_PROFILE` to the name of the profile you wish to use:

    export AWS_PROFILE=<profile_name>

Before you run this for the first time, I'd recommend setting up remote state.
To do this you'll need to create an S3 bucket. Google it.

> *IMPORTANT:* if you're actually making changes to _my_ running
> infrastructure, rather than your own, I will need to give you access to my
> remote state bucket. Otherwise _terrible things_ will happen.

    terraform remote config \
      -backend=s3 \
      -backend-config="bucket=(YOUR_BUCKET_NAME)" \
      -backend-config="key=terraform.tfstate" \
      -backend-config="region=(YOUR_BUCKET_REGION)" \
      -backend-config="encrypt=true"

All done? Cool:

    terraform plan -out=tf.plan

Plan look good?

    terraform apply tf.plan

## Todo
