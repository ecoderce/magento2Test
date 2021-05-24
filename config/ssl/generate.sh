openssl req \
    -x509 \
    -nodes \
    -days 3650 \
    -newkey rsa:2048 \
    -keyout key.key \
    -out certificate.crt \
    -extensions v3_req \
    -config req.conf

openssl dhparam -dsaparam -out dhparams.pem 4096
