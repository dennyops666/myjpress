FROM fuhai/jpress:v5.1.2
LABEL maintainer="dennyops66@outlook.com"

WORKDIR /opt/jpress

EXPOSE 8080

CMD ["/opt/jpress/jpress.sh", "start"]