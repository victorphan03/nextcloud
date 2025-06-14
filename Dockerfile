FROM nextcloud:31.0.5

# Copy file config.php vào đúng thư mục trong container
COPY config.php /var/www/html/config/config.php

# Chỉnh quyền nếu cần (ví dụ)
RUN chown www-data:www-data /var/www/html/config/config.php && \
    chmod 640 /var/www/html/config/config.php
