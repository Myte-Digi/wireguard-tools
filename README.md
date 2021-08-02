# Macos install
```
brew install wireguard-tools gpg qrencode grepcidr
git clone git@bitbucket.org:mytesend/wireguard-tools.git
```
## Copy config
```
cp wg0.conf wg0.conf 
nano  wg0.conf
```
  ### Edit
  1. WGCG_SERVER_NAME="wg0"
  2. WGCG_SERVER_WG_IP="10.0.10.1"
  3. WGCG_SERVER_PORT="52010"
## Generate Server
```
WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh -s
```

WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh --sysprep modules/wgcg-install-wireguard.sh

## Generate Client
```
WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh -c client10 10.0.10.2
```

## Sync
```
WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh -S
```

## Import client in folder wg0/client-10.conf to wireguard GUI

----

# Tricks

## Add rule
```
ufw status
ufw allow 52010/udp
```

## Add fw
```
iptables -A FORWARD -i wg0 -j ACCEPT
```

## Check firewall
```
iptables -S | grep "wg0"
```


## Debug

```
modprobe wireguard
echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control

dmesg -wT | grep 'wireguard'
```

