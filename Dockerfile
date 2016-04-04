FROM centos:6.7
MAINTAINER Timur Babyuk

#ADD https://URL/LINUX-voltdb-ent-4.9.3.tar.gz /tmp/voltdb/
COPY LINUX-voltdb-ent-4.9.3.tar.gz /tmp/voltdb/

RUN yum install -y centos-release-SCL
RUN yum install -y tar
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y python27

RUN yum install -y ntp ntpdate ntp-doc
RUN chkconfig ntpd on
RUN ntpdate pool.ntp.org
RUN /etc/init.d/ntpd start

RUN tar -xzf /tmp/voltdb/LINUX-voltdb-ent-4.9.3.tar.gz -C /tmp/voltdb/
