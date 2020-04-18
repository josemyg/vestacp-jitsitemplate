<VirtualHost %ip%:%web_ssl_port%>

    ServerName %domain_idn%
    Redirect permanent / https://%domain_idn%/
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]

</VirtualHost>