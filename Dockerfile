FROM wordpress:latest

# Build-time arguments
ARG FRONT_END_URI
ARG ENVIRONMENT

# Add a test message to the WordPress theme
RUN echo "<?php die("new version pushed")?>" > /usr/src/wordpress/index.php


# Set permissions (optional, to avoid permission issues with WordPress)
RUN chown -R www-data:www-data /usr/src/wordpress/index.php

# Expose WordPress port
EXPOSE 80
