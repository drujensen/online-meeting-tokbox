FROM nginx

MAINTAINER Dru Jensen <djensen@ascendhit.com>

# Install wget and install/updates certificates
RUN apt-get update
RUN apt-get install -yqq ca-certificates wget
RUN apt-get clean && rm -r /var/lib/apt/lists/*

# Add main NGINX config
COPY nginx.conf /etc/nginx/

# Add www certificates
COPY ssl/. /etc/ssl/certs/

# Add virtual hosts
COPY vhosts/ /etc/nginx/conf.d/

