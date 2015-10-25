#!/usr/bin
sudo service tomcat7 stop
dropdb propitious_octo_waddle -U postgres
createdb propitious_octo_waddle -U postgres
psql -U postgres -d propitious_octo_waddle -f /home/wbond/Documents/Projects/propitious-octo-waddle/propitious-octo-waddle-datasource/src/main/sql/baseline.sql
sudo service tomcat7 start