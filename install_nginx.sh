apt update
apt install nginx




nano /etc/nginx/nginx.conf

# Load balance UDP‑based DNS traffic across two servers
stream {
    upstream dns_upstreams {
        server 167.71.208.53:50000;#vpn2
        server 188.166.241.118:50000; #vpn3
    }

    server {
        listen 51820 udp;
        proxy_pass dns_upstreams;
        proxy_timeout 1s;
        proxy_responses 1;
        error_log /var/log/nginx/wireguard_error.log;
    }
}

nginx -t

service nginx restart