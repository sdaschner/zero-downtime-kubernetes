FROM tomee:8-jre-7.0.4-plus

COPY target/coffee-shop.war /usr/local/tomee/webapps/
