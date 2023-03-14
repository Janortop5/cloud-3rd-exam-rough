FROM ubuntu:22.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install nginx wget lsb-release software-properties-common -y 

EXPOSE 80

WORKDIR /var/www/html/

COPY ./laravel-realworld-example-app /var/www/html/laravel-realworld-example-app

COPY ./.env.example /var/www/html/laravel-realworld-example-app/.env

RUN apt install apt-transport-https gnupg2 ca-certificates -y

RUN apt install php8.1-fpm libapache2-mod-php php php-common php-xml php-gd php8.1-opcache php-mbstring php-tokenizer \
    php-json php-bcmath php-zip unzip curl php8.1-curl php8.1-mbstring php8.1-xml zip php-mysql php8.1-mysql vim git -y

COPY ./php.ini /etc/php/8.1/fpm/php.ini

RUN chown -R www-data:www-data /var/www/html/laravel-realworld-example-app/ \
    && chmod -R 775 /var/www/html/laravel-realworld-example-app/

RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html/laravel-realworld-example-app/

RUN update-alternatives --set php /usr/bin/php8.1

RUN composer create-project

COPY ./web.php /var/www/html/laravel-realworld-example-app/routes/web.php

COPY ./laravel /etc/nginx/sites-available/laravel

RUN ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

RUN rm /etc/nginx/sites-enabled/default

RUN service nginx reload && service php8.1-fpm restart

CMD ["nginx", "-g", "daemon off;"]


