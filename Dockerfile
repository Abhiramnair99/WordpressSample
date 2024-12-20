FROM wordpress:latest
ARG FRONT_END_URI
ARG ENVIRONMENT

# Debugging environment variables (kept from your example)
RUN echo hello
RUN printenv
RUN echo $ENVIRONMENT
RUN echo "this is test for" $FRONT_END_URI

# Inject a visible change into the WordPress theme or page
RUN echo "<?php echo '<h1 style=\"color: red; text-align: center;\">Pipeline Test Change: $ENVIRONMENT</h1>'; ?>" > /var/www/html/wp-content/themes/twentytwentythree/test.php

# Include the test PHP in the WordPress homepage (optional but visible on homepage)
RUN echo "<?php include 'wp-content/themes/twentytwentythree/test.php'; ?>" >> /var/www/html/wp-content/themes/twentytwentythree/index.php
