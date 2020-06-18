+++
title = "Ghost"
author = ["Rakhim Davketkaliyev"]
lastmod = 2020-06-18T11:15:21+03:00
slug = "ghost"
draft = false
+++

Ghost is a lightweight blogging CMS written in Node.js.


## Nginx caching configuration {#nginx-caching-configuration}


### Enable gzip {#enable-gzip}

Edit `/etc/nginx/nginx.conf`:

```conf
http {
     ...
     gzip on;
     gzip_disable "msie6";
     gzip_vary on;
     gzip_proxied any;
     gzip_comp_level 6;
     gzip_buffers 16 8k;
     gzip_http_version 1.1;
     gzip_min_length 256;
     gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/vnd.ms-fontobject application/x-font-ttf font/opentype image/svg+xml image/x-icon;
     ...
}
```


### Enable caching {#enable-caching}

```conf
http {
     ...
     proxy_cache_path /home/cache/ghost_cache levels=1:2 keys_zone=ghost_cache:60m max_size=300m inactive=24h;
     proxy_cache_key "$scheme$request_method$host$request_uri";
     proxy_cache_methods GET HEAD;
     ...
}

```


### Configure caching for Ghost site {#configure-caching-for-ghost-site}

Edit `/etc/nginx/sites-available/my-site-ssl.conf`:

```conf
location / {
        proxy_cache ghost_cache;
        proxy_cache_valid 60m;
        proxy_cache_valid 404 1m;
        # use conditional GET requests to refresh the content from origin servers
        proxy_cache_revalidate on;
        proxy_buffering on;
        # Allows starting a background subrequest to update an expired cache item,
        # while a stale cached response is returned to the client.
        proxy_cache_background_update on;

        # Remove cookies which are useless for anonymous visitor and prevent caching
        proxy_ignore_headers Set-Cookie Cache-Control;
        proxy_hide_header Set-Cookie;
        # Add header for cache status (miss or hit)
        add_header X-Cache-Status $upstream_cache_status;

        proxy_cache_bypass $http_cache_control; # enable cache bypass
        proxy_cache_use_stale error timeout invalid_header updating http_500 http_502 http_503 http_504;
        proxy_ignore_headers Cache-Control;

        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://localhost:2368;
    }

    location ~ ^/(ghost/|p/)/ {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://localhost:2368;
    }

    location ~ /.well-known {
        allow all;
    }

    location ^~ /assets/ {
        root /var/www/ghost/content/themes/kummitus;
    }

    location ^~ /content/images/(!size) {
        root /var/www/ghost;
    }

```


### Restart nginx {#restart-nginx}

`sudo service nginx restart`


### Resources {#resources}

-   [Nginx Caching](https://serversforhackers.com/c/nginx-caching)
-   [Caching Ghost with Nginx](https://scotthelme.co.uk/caching-ghost-with-nginx/)
-   [Caching Ghost with Nginx (Stanislas)](https://stanislas.blog/2019/08/ghost-nginx-cache/)
