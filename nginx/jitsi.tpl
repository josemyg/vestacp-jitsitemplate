server {

    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;

    location ^~ /.well-known/acme-challenge/ {
       default_type "text/plain";
       root         /usr/share/jitsi-meet;
    }
    location = /.well-known/acme-challenge/ {
       return 404;
    }
    location / {
       return 301 https://$host$request_uri;
    }
}
