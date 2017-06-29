#!/usr/bin/env bash
openssl req -new -sha256 -nodes -out onlinemeeting.dev.csr -newkey rsa:2048 -keyout onlinemeeting.dev.key -config <( cat server.csr.cnf )

openssl x509 -req -in onlinemeeting.dev.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out onlinemeeting.dev.crt -days 500 -sha256 -extfile v3.ext
