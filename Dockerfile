FROM centos:7.2.1511

ADD ./kolla /kolla
WORKDIR /kolla

RUN yum -y install epel-release
RUN yum -y install core-utils python-pip python-devel libffi-devel gcc openssl-devel ansible
RUN pip install -U pip
RUN ls -l
RUN pip install -r ./requirements.txt -r ./test-requirements.txt

VOLUME /etc/kolla

