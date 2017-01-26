#cloud-config
#
# vim: syntax=yaml

hostname: ${hostname}

users:
  - name: dan
    groups: wheel
    ssh-authorized-keys:
      - ${authorized_key}
    sudo: ALL=(ALL) NOPASSWD:ALL
