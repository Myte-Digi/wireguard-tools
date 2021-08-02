#Macos
brew install wireguard-tools gpg qrencode grepcidr
git clone git@bitbucket.org:mytesend/wireguard-tools.git

cp wg0.conf wg11.conf 

WGCG_CONFIG_FILE=wg11.conf ./wgcg.sh -s
WGCG_CONFIG_FILE=wg11.conf ./wgcg.sh -c loi11 10.0.11.2
WGCG_CONFIG_FILE=wg11.conf ./wgcg.sh -S

#Add rule
ufw status
ufw allow 52004/udp

# Check fw
iptables -S

#Add fw
iptables -A FORWARD -i wg11 -j ACCEPT

#Check
iptables -S | grep "wg2"


WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh --sysprep modules/wgcg-install-wireguard.sh
WGCG_CONFIG_FILE=wg0.conf ./wgcg.sh -S