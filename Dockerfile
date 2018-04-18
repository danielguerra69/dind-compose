FROM docker:stable-dind
MAINTAINER Daniel Guerra
RUN apk --update --no-cache add supervisor py-pip git
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir docker-compose
# Add docker user
RUN addgroup docker
RUN adduser  -G docker -s /bin/sh -D docker
ADD etc /etc
ADD bin /usr/local/bin
RUN rm -rf /tmp/* /root/.cache
RUN mkdir -p /var/log/supervisor/
RUN mkdir -p /docker-compose
VOLUME ["/docker-compose"]
WORKDIR /docker-compose
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["supervisord"]
