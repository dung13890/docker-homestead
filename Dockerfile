FROM shincoder/homestead:php7.0

# Install dev
RUN apt-get update
RUN apt-get install -y autoconf g++ make openssl libssl-dev libcurl4-openssl-dev pkg-config

# Install mongoDB Driver PHP
RUN git clone https://github.com/mongodb/mongo-php-driver.git && \
cd mongo-php-driver && \
git submodule sync && git submodule update --init && \
phpize && \
./configure && \
make all -j 5 && \
make install

# Extension mongodb
RUN echo  "extension = mongodb.so" > /etc/php/7.0/mods-available/mongo.ini && \
ln -s /etc/php/7.0/mods-available/mongo.ini /etc/php/7.0/fpm/conf.d/mongo.ini && \
ln -s /etc/php/7.0/mods-available/mongo.ini /etc/php/7.0/cli/conf.d/mongo.ini

# Restart Services
RUN supervisorctl restart nginx && service php7.0-fpm restart
