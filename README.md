# Configure router
Script to configure an openwrt router for Bielefeld LAN
## How to use

### First Boot

After turned on the router, visit his IP on the browser to choose the language and the **router password** that is necessary to connect to the router with ssh.

### Copy the script

Copy the script to the router with :

```console
smog@maryjane:~$ scp configure_router_bielefeld.sh root@router_ip:/root/
```
Where **router_ip** is the ip of the router that you want to configure.
And type **yes** to register the ssh key if asked and after insert the password that you choosed when you logged the first time in the gateway.

### Connect to the router

Connect with ssh to the router with:

```console
smog@maryjane:~$ ssh root@router_ip
```

And type **yes** to register the ssh key if asked and after insert the password that you choosed when you logged the first time in the gateway.

### Launch the script

First make the script executable with:

```console
root@modem_name:~$ chmod +x configure_router_bielefeld.sh
```

And launch the script with:

```console
root@modem_name:~$ ./configure_router_bielefeld.sh
```

When asked insert you Bielefeld email and password and the job is done!
