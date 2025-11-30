#!/bin/bash

echo "==> Copying apache config files..."

cp -v /vagrant/files/mercurio.olimpo.test/apache2.conf /etc/apache2/apache2.conf 2>/dev/null

cp -v /vagrant/files/mercurio.olimpo.test/apolo.olimpo.test.conf  /etc/apache2/sites-available/
cp -v /vagrant/files/mercurio.olimpo.test/atenea.olimpo.test.conf /etc/apache2/sites-available/

echo "==> Enabling virtual sites..."

a2ensite apolo.olimpo.test.conf
a2ensite atenea.olimpo.test.conf

echo "==> Disabling defult sites..."
a2dissite 000-default.conf

echo "==> Checking apache sintax..."
apachectl configtest

echo "==> Restarting Apache..."
systemctl restart apache2
systemctl enable apache2
