FROM wordpress:latest

# Build-time arguments
ARG FRONT_END_URI
ARG ENVIRONMENT

# Debugging environment variables
RUN echo "Hello from Docker build!" \
    && echo "Environment: $ENVIRONMENT" \
    && echo "Front-end URI: $FRONT_END_URI"

# Add a test message to the WordPress theme
RUN echo "<?php echo '<h1 style=\"color: red; text-align: center;\">Pipeline Test Change: Environment = $ENVIRONMENT, Front-end URI = $FRONT_END_URI</h1>'; ?>" > /var/www/html/wp-content/themes/twentytwentythree/test-message.php

# Include the test PHP in the WordPress homepage (append to the theme's index.php)
RUN echo "<?php include 'wp-content/themes/twentytwentythree/test-message.php'; ?>" >> /var/www/html/wp-content/themes/twentytwentythree/index.php

# Set permissions (optional, to avoid permission issues with WordPress)
RUN chown -R www-data:www-data /var/www/html

# Expose WordPress port
EXPOSE 80
