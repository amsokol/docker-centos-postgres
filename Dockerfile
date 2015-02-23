FROM amsokol/centos-postgres-init:9.2.7
MAINTAINER Alexander Sokolovsky <amsokol@gmail.com>

#update system
RUN yum -y update && yum clean all

VOLUME /var/lib/pgsql/data

EXPOSE 5432

USER postgres
CMD ["postgres", "-D", "/var/lib/pgsql/data"]
