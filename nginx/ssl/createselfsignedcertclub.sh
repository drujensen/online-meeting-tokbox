#!/usr/bin/env bash
openssl req -new -sha256 -nodes -out onlinemeeting.club.csr -newkey rsa:2048 -keyout onlinemeeting.club.key -config <( cat serverclub.csr.cnf )

openssl x509 -req -in onlinemeeting.club.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out onlinemeeting.club.crt -days 500 -sha256 -extfile v3club.ext
