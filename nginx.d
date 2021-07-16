server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name  server.flappigotchi.com;

    listen 443 ssl; # managed by Certbot

    # RSA certificate
    ssl_certificate /etc/letsencrypt/live/server.flappigotchi.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/server.flappigotchi.com/privkey.pem; # managed by Certbot

    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

    # Redirect non-https traffic to https
    if ($scheme != "https") {
        return 301 https://$host$request_uri;
    } # managed by Certbot
}