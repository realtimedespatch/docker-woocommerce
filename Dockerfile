FROM wordpress:latest

ENV WOOCOMMERCE_VERSION 3.1.2
ENV WOOCOMMERCE_UPSTREAM_VERSION 3.1.2

RUN apt-get update
RUN apt-get install -y --no-install-recommends unzip wget vim

RUN wget https://downloads.wordpress.org/plugin/woocommerce.${WOOCOMMERCE_VERSION}.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /tmp/wp-cli.phar
RUN chmod +x /tmp/wp-cli.phar
RUN mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN wget https://www.dropbox.com/s/bo5z0afnc77j0sg/woocommerce-shipment-tracking.zip?dl=0 -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

RUN wget https://www.dropbox.com/s/ew1ylfqkvxsjn05/disable-woocommerce-authentication.zip?dl=0 -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

#RUN wp core config --dbhost=host.db --dbname=wp_ --dbuser=root --dbpass=swialyitt6 --path=/usr/src/wordpress --allow-root
#RUN wp core install --url=yourwebsite.com --title="Your Blog Title" --admin_name=admin --admin_password=admin --#admin_email=test@test.com --allow-root

#RUN wp plugin activate --all --allow-root

#RUN echo "add_filter( 'woocommerce_api_check_authentication', function() { return new WP_User( 1 ); } );" >> /usr/src/wordpress/wp-content/themes/twentyseventeen/functions.php
