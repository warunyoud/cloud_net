FROM ubuntu:18.04

RUN apt-get update
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d
RUN apt-get install -y mysql-server nodejs npm python3-pip memcached libmysqlclient-dev libmemcached-dev virtualenv
COPY . /cloud_net
WORKDIR /cloud_net
RUN pip3 install pymysql && pip3 install -r requirements.txt
RUN npm install; npm install material-ui@1.0.0-beta.34; npm run build

EXPOSE 80
CMD ["npm", "start"]
