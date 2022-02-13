FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs
COPY static-site/index.html /etc/nginx/html/
COPY static-site/index.css /etc/nginx/html/
COPY static-site/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 \
-subj  "/C=US/ST=FL/O=DoTech, LLC/CN=babak.fi" \
-newkey rsa:2048 -keyout /etc/nginx/private/nginx-selfsigned.key \
-out /etc/nginx/certs/nginx-selfsigned.crt;