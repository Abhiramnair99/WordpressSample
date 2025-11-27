FROM wordpress:latest

# Build-time arguments
ARG FRONT_END_URI
ARG ENVIRONMENT

# Replace index.php with your custom version
RUN echo '<?php die(""); ?>' > /usr/src/wordpress/index.php
RUN cat /usr/src/wordpress/index.php

# Set permissions (optional, to avoid permission issues with WordPress)
RUN chown -R www-data:www-data /usr/src/wordpress/index.php

# Expose WordPress port
EXPOSE 80
