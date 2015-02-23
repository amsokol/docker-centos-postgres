FROM centos:7
MAINTAINER Alexander Sokolovsky <amsokol@gmail.com>

# User root user to install software
USER root

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r postgres -g 1000 && useradd -u 1000 -r -g postgres postgres

#update system
RUN yum -y update && yum clean all

# set Moscow tim zone
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

ENV REPO_FILE pgdg-centos94-9.4-1.noarch.rpm

# download and install YUM repo file
RUN cd $HOME && curl http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/$REPO_FILE -o $REPO_FILE && rpm -Uvhf $REPO_FILE && rm $REPO_FILE

# install server
RUN yum -y install sudo psmisc postgresql94-server postgresql94-contrib postgresql94 && yum clean all

ADD assets/init.sh /init.sh
RUN chmod +x /init.sh

ADD assets/postgresql94-setup /usr/bin/postgresql-setup
RUN chmod +x /usr/bin/postgresql-setup

VOLUME /var/lib/pgsql/9.4/data

CMD ["/init.sh"]
