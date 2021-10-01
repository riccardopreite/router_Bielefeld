# Configure router
Script to configure an openwrt router for Bielefeld LAN. For this guide **Gl.inet GL_AR300M** has been used.
It arrive already with openwrt installed but an update is necessary.
Link tu buy [a link] https://www.amazon.de/dp/B01I92T754/ref=redir_mobile_desktop?_encoding=UTF8&openid.assoc_handle=deamazon&openid.claimed_id=https%3A%2F%2Fwww.amazon.de%2Fap%2Fid%2Famzn1.account.AFHZK5M4EE466WJCJDUTHFWO4QEA&openid.identity=https%3A%2F%2Fwww.amazon.de%2Fap%2Fid%2Famzn1.account.AFHZK5M4EE466WJCJDUTHFWO4QEA&openid.mode=id_res&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.op_endpoint=https%3A%2F%2Fwww.amazon.de%2Fap%2Fsignin&openid.pape.auth_policies=http%3A%2F%2Fschemas.openid.net%2Fpape%2Fpolicies%2F2007%2F06%2Fnone&openid.pape.auth_time=2021-09-26T14%3A50%3A20Z&openid.response_nonce=2021-09-26T14%3A50%3A42Z-8903084168365254785&openid.return_to=https%3A%2F%2Fwww.amazon.de%2Fgp%2Faw%2Fd%2FB01I92T754&openid.sig=r02bm0wTqXok6GhT8Jw59i34zt7R91pEcPTJhzdq50E%3D&openid.signed=assoc_handle%2Cclaimed_id%2Cidentity%2Cmode%2Cns%2Cop_endpoint%2Cresponse_nonce%2Creturn_to%2Cns.pape%2Cpape.auth_policies%2Cpape.auth_time%2Csigned&serial=

## Update GL-iNet
For this part you need a connection to the router. Visit the gateway page and just click on "update" item on the left. 
From there the update of the firmware is very simple, it will do it by is own.


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
