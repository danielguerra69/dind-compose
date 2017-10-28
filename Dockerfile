FROM docker:stable-dind
MAINTAINER Daniel Guerra
RUN apk --update --no-cache add supervisor py-pip
RUN pip install --upgrade pip 
RUN pip install docker-compose
ADD etc /etc
RUN rm -rf /tmp/* /root/.cache
RUN mkdir -p /var/log/supervisor/
RUN mkdir -p /docker-compose
VOLUME ["/docker-compose"]
WORKDIR /docker-compose
CMD ["supervisord"]