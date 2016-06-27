FROM jwilder/nginx-proxy

RUN apt-get update -qq\
 && apt-get install -y -qq --no-install-recommends \
    expect \
    openssl
RUN mkdir -p /etc/nginx/certs /etc/nginx/conf.d

WORKDIR /etc/nginx/certs
ADD newcert  /etc/nginx/certs/
ADD create_cert  /usr/local/bin
RUN chmod 755 /usr/local/bin/create_cert
RUN apt-get clean \	
 && rm -r /var/lib/apt/lists/*	



WORKDIR /app/
