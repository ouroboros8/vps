#cloud-config
#
# vim: syntax=yaml

users:
  - name: dan
    groups: wheel
    ssh-authorized-keys:
      - ${authorized_key}
    sudo: ALL=(ALL) NOPASSWD:ALL

yum_repos:
  epel:
    baseurl: https://dl.fedoraproject.org/pub/epel/7/x86_64/
    enabled: false
    gpgcheck: true
    gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
    name: Extra Packages for Enterprise Linux 7

packages:
  - python34
