FROM tomee:8-jre-7.0.4-plus

COPY deployment/docker/deactivate-health-check.sh /

COPY target/coffee-shop.war /usr/local/tomee/webapps/
