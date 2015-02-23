FROM amsokol/centos-postgres-init:9.4.1
MAINTAINER Alexander Sokolovsky <amsokol@gmail.com>

#update system
RUN yum -y update && yum clean all

VOLUME /var/lib/pgsql/9.4/data

EXPOSE 5432

USER postgres
CMD ["/usr/pgsql-9.4/bin/postgres", "-D", "/var/lib/pgsql/9.4/data"]
