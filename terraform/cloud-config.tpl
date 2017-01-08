#cloud-config
#
# vim: syntax=yaml

users:
  - name: dan
    groups: wheel
    ssh-authorized-keys:
      - ${authorized_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
