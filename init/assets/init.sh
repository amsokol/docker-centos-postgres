#!bin/bash

/usr/bin/postgresql-setup initdb
sed -i 's/#listen_addresses = \x27localhost\x27/listen_addresses = \x27*\x27/g' /var/lib/pgsql/data/postgresql.conf
sed -i 's/#port = 5432/port = 5432/g' /var/lib/pgsql/data/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

sudo -u postgres postgres -D /var/lib/pgsql/data &
sleep 10
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'Passw0rd';"
killall postgres
sleep 10

