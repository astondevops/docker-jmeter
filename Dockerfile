FROM fedora:23
MAINTAINER  dockerlite@gmail.com 

ENV JMETER_BIN /home/jmeter/apache-jmeter-3.1/bin/

RUN dnf -y update && \
    yum -y install wget tar git python3    && \
    yum -y install java-1.8.0-openjdk-headless.x86_64 && \
    dnf clean all 

RUN mkdir -p /home/jmeter

WORKDIR /home/jmeter
RUN wget http://wwwftp.ciril.fr/pub/apache/jmeter/binaries/apache-jmeter-3.1.tgz
RUN tar -zxvf apache-jmeter-3.1.tgz

RUN mkdir -p /home/developpement
WORKDIR /home/developpement
RUN git clone https://github.com/astondevops/web_server_flask.git

VOLUME ['/jmeter_log']

CMD ${JMETER_BIN}/jmeter -? 
