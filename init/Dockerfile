FROM centos:7
MAINTAINER Alexander Sokolovsky <amsokol@gmail.com>

# User root user to install software
USER root

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r postgres -g 1000 && useradd -u 1000 -r -g postgres postgres

#update susyem
RUN yum -y update && yum clean all

# install server
RUN yum -y install sudo psmisc postgresql-server postgresql-contrib postgresql && yum clean all

ADD assets/init.sh /init.sh

ADD assets/postgresql-setup /usr/bin/postgresql-setup
RUN chmod +x /usr/bin/postgresql-setup

VOLUME /var/lib/pgsql/data

CMD ["/init.sh"]
