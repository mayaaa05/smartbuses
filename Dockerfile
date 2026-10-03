FROM php:8.2-apache

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy project files into web root
COPY . /var/www/html/

# Grant write permissions for the SQLite database
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/database

EXPOSE 80
CMD ["apache2-foreground"]
