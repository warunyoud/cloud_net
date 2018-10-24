FROM ubuntu:18.04

COPY . /cloud_net
WORKDIR /cloud_net
RUN apt-get update
RUN apt-get install -y nodejs npm python3-pip memcached libmysqlclient-dev libmemcached-dev virtualenv
RUN virtualenv -p python3 env; source env/bin/activate
RUN pip3 install pymysql && pip3 install -r requirements.txt
RUN npm install; npm install material-ui@1.0.0-beta.34; npm run build

EXPOSE 8000
CMD ["npm", "start"]

