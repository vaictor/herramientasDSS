FROM ubuntu:22.04 as base

RUN apt update -y && \
apt upgrade -y && \
apt-get install -y tzdata && \
apt -y install software-properties-common && \
apt -y install apache2 libapache2-mod-fcgid composer && \
a2enmod rewrite actions fcgid alias proxy_fcgi && \
add-apt-repository ppa:ondrej/php && \
apt-get update && \
apt install -y php7.4 php7.4-cli php7.4-fpm php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring \
php7.4-curl php7.4-xml php-pear php7.4-bcmath openssh-server

# Exponer puertos para Web SSL y SSH
EXPOSE 81

# Iniciar ssh, apache2 y php-fpm
ENTRYPOINT service apache2 start && service php7.4-fpm start && bash