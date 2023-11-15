# s
A cli menu of available SSH connections based on your ~/.ssh/config file.

![Screenshot](https://github.com/naegelin/s/blob/main/example.png?raw=true)

Intended for Mac OSX.

## One line install:
```
curl -fsSL https://raw.githubusercontent.com/naegelin/s/main/s.sh -o install.sh && chmod +x install.sh && ./install.sh
```

## Useage:
### Setup your ~./ssh/config
Your ~./ssh/config file should contain a list of hosts, usernames, and ssh private key locations (identity files). This file will be parsed by `s`

Example:
```
Host production-server
    HostName prod.my-server.com
    User ubuntu
    IdentityFile ~/Documents/prod_credentials.pem
Host test-server
    HostName test.my-server.com
    User ubuntu
    IdentityFile ~/Documents/test_credentials.pem
```

### Run s
Assuming /usr/local/bin is in your default path, you can simply type `s` to get the ssh menu
