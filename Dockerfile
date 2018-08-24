FROM tomee:8-jre-7.0.4-plus

COPY target/zero-downtime.war /usr/local/tomee/webapps/
