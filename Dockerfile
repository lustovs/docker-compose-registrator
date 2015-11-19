# Version: 0.0.1

FROM ubuntu:14.04
MAINTAINER Lustov Stepan <lustovs@gmail.com>

# Install: Node.js, npm, supervisor
RUN apt-get update && apt-get install -y nodejs git npm supervisor rsync openssh-server bash

#Make dirs,copy configs
RUN mkdir -p /var/log/supervisor
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
COPY supervisor/*.conf /etc/supervisor/conf.d/


#SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
#ENV SSH_AUTH_SOCK=/tmp/ssh_auth_sock
#RUN git clone git@github.com:lustovs/docker-compose-registrator.git repo
COPY ./clone.sh /
#RUN /root/clone.sh

# Install app dependencies
# Bundle app source
#VOLUME ./src:/src
COPY ./src /src
RUN cd /src; npm install


EXPOSE  80
EXPOSE  22
CMD ["/usr/bin/supervisord"]

