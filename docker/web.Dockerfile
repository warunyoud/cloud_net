FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y nginx mysql-server nodejs npm python3-pip memcached libmysqlclient-dev libmemcached-dev virtualenv
COPY . /cloud_net
WORKDIR /cloud_net
COPY mysite_nginx.conf /etc/nginx/sites-available
COPY mysite_nginx.conf /etc/nginx/sites-enabled
RUN pip3 install pymysql && pip3 install -r requirements.txt
RUN npm install; npm install material-ui@1.0.0-beta.34
EXPOSE 8000
ENTRYPOINT [ "sh", "-c", "service nginx restart; npm run build; npm start" ]