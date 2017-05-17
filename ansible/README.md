# dsinfra/ansible

Ansible configuration for my personal infrastructure. Inventory is handled by
ec2.py (read the docstring) and ec2.ini.

A bunch of stuff (domain names, etc.) is hardcoded here, so reusability could
be improved a great deal.  On the other hand, this is (so far) a pretty thin
wrapper around third-party modules, so there's not much to reuse.

## Quickstart

### Dependencies

I recommend running this in [python virtual enviroment](https://virtualenv.pypa.io/en/stable/):

    virtualenv venv                 # create virtualenv called `venv`
    source venv/bin/activate        # source the activation script; you should then be in a venv
    pip install -r requirements.txt # install requirements with pip

This will install `ansible`, as well as `boto` (required by ec2.py). Now you
need a few roles from the [Ansible Galaxy](https://galaxy.ansible.com/):

    ansible-galaxy install -r requirements.yml

### Running

You'll need a few environment variables set:

 - AWS credentials (authentication to AWS required by `ec2.py`): I recommend
   using [AWS profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)
   and setting `AWS_PROFILE` to the name of the profile you wish to use.
 - `MAILGUN_SMTP_PASSWORD`: the SMTP password for your mailgun account. User is
   currently hard-coded to `postmaster@git.glyx.co.uk`.
 - `GOGS_SECRET_KEY`: secret key for GOSS, used internally for crypto of some
   kind. Make it long and random.

Once you've set these things up:

    export AWS_PROFILE=<profile_name>
    export MAILGUN_SMTP_PASSWORD=<mailgun_pass>
    export GOGS_SECRET_KEY=<gogs_secret>

Now you can run ansible:

    ansible-playbook -i ec2.py site.yml

## Todo

 - There are probably a whole bunch of things that could be parametrised and
   made into variables. The mailgun smtp user, for instance.

 - The geerlingguy nginx role sets the hash bucket size in nginx.conf which then
   gets removed every run

 - Mutual TLS support

 - Default vhosts (so that only requests to correct vhost domains are accepted)

 - Not 100% sure that vhosts and letsencrypt are correctly applied at first run

 - In order to actually set up gogs from scratch, have to get gogs running on
   8080 but also disable registration so I can create first user. This would be
   fixed by starting from gogs db backup.

 - On that note: gogs db backup
