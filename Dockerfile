FROM open-liberty:javaee8-java12

COPY src/main/liberty/config/ /opt/ol/wlp/usr/servers/defaultServer/

COPY target/*.war /opt/ol/wlp/usr/servers/defaultServer/apps/
