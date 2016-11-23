Ansible playbooks
=================

bootstrap.yaml
--------------
This playbook is to be run immediately after spinning up a new centos server.
It created an admin user dan, sets up ssh keys and the sudoers file, then
removed the default centos user.

tools.yaml
----------
Install miscellaneous useful tools.
