# dsinfra

Configuration for my personal infrastructure. Terraform manages AWS resources
and performs some simple bootstrapping with cloud-init (adds user + SSH keys).
Ansible then provisions instances.

## spark
 - [Gogs](https://gogs.io/)

## TODO

 - [Security updates](https://github.com/rothgar/ansible-yum-security-updates)
 - Continuous integration
 - Monitoring

## Notes

  - Make sure default vhost is removed, is geerlingguy installing that?
  - Do we even need geerlingguy nginx?

### Mutual TLS Key Generation

Generate keys

```bash
openssl req -x509 -days 9999 -nodes -newkey rsa:4096 -keyout client.key -out client.crt
```

Note that `-days 9999` means the key will expire in 9999 days (slightly over 27
years). The default if `-days` is not set is 30 days.

Put client key on webserver at `/etc/nginx/ssl/trust/client.crt`

Nginx conf:

```nginx
server {
    ...

    ssl_client_certificate /etc/nginx/ssl/trust/client.crt;
    ssl_verify_client on;

    ...
}
```

Firefox wants a PKCS#12 archive:

```bash
openssl pkcs12 -export -in client.crt -inkey client.key -name Adhoc -out adhoc.p12
# adhoc.p12 can be imported into the browser
rm client.key
```
