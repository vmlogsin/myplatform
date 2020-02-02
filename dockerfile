FROM ubuntu 
RUN apt-get update
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ wheezy nginx" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y nginx=${NGINX_VERSION} && rm -rf /var/lib/apt/lists/* && apt-get install iputils-ping -y && apt-get install wget curl -y
RUN mkdir goku_demo
ADD /home/osboxes/myplatform/ /goku_demo
EXPOSE 80/tcp 443/tcp
CMD ["nginx", "-g", "daemon off;"]