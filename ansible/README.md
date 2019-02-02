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

#### Notes

 - The passwordstore lookup, which is used to get the gogs secret and mailgun
   smtp password, requires `ansible>2.4.0` to work with python3.
 - The passwordstore lookup expects an executable called `pass` in PATH. If you
   want to use it with `gopass` or another `pass`-compatible tool, you'll need
   to create a symlink to it called `pass`.

### Running

You'll need a few environment variables set:

 - AWS credentials (authentication to AWS required by `ec2.py`): I recommend
   using [AWS profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)
   and setting `AWS_PROFILE` to the name of the profile you wish to use.

Once you've set these things up:

    AWS_PROFILE=<profile_name>

Now you can run ansible:

    ansible-playbook -i ec2.py site.yml

### Secrets

Secrets are read from [gopass](https://github.com/gopasspw/gopass) using
[passwordstore lookup plugin](https://docs.ansible.com/ansible/latest/plugins/lookup/passwordstore.html).
In order for this plugin to work you'll need gopass to be exposed as `pass` in
your PATH.

## Todo

 - There are probably a whole bunch of things that could be parametrised and
   made into variables. The mailgun smtp user, for instance.

 - The geerlingguy nginx role sets the hash bucket size in nginx.conf which then
   gets removed every run

 - Not 100% sure that vhosts and letsencrypt are correctly applied at first run

 - gogs db backup
