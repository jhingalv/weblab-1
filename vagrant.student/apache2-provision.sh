#!/bin/bash

echo "==> Copiando configuraciones de Apache..."

cp -v /vagrant/files/mercurio.olimpo.test/apache2.conf /etc/apache2/apache2.conf 2>/dev/null

cp -v /vagrant/files/mercurio.olimpo.test/apolo.olimpo.test.conf  /etc/apache2/sites-available/
cp -v /vagrant/files/mercurio.olimpo.test/atenea.olimpo.test.conf /etc/apache2/sites-available/

echo "==> Habilitando sitios virtuales..."

a2ensite apolo.olimpo.test.conf
a2ensite atenea.olimpo.test.conf

echo "==> Deshabilitando sitio por defecto..."
a2dissite 000-default.conf

echo "==> Comprobando sintaxis de Apache..."
apachectl configtest

echo "==> Reiniciando Apache..."
systemctl restart apache2
systemctl enable apache2
