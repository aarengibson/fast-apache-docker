FROM httpd:2.4

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Copy certificates
COPY server.crt /usr/local/apache2/conf/server.crt
COPY server.key /usr/local/apache2/conf/server.key

# Enable SSL module + config
# RUN echo "Include conf/extra/httpd-ssl.conf" >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
EXPOSE 443

# docker build -t fast-apache-docker .
# docker save fast-apache-docker -o fast-apache-docker.tar
# docker run -d -p 80:80 -p 443:443 fast-apache-docker
# docker ps
# docker logs 00dc035fc649aede6cd567e095232a34a12d87b0cb68f9cee8e628d8dea07803

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt -subj "/C=MY/ST=KualaLumpur/L=KualaLumpur/O=FAST/OU=IT/CN=fast2uat.bnm.gov.my"