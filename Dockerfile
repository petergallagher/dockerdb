FROM dockerfile/mariadb

ENV TERM dumb
ENV OPEN_EYES_DB_HOST localhost
ENV OPEN_EYES_DB_USER openeyes
ENV OPEN_EYES_DB_PASS oe_test
ENV OPEN_EYES_DB_DATABASE openeyes

VOLUME /var/log

RUN apt-get update && apt-get install -y supervisor
RUN chmod +x /usr/local/bin/import.sh

ADD ./my.cnf /etc/mysql/my.cnf
ADD ./import.sh /usr/local/bin/import.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start supervisor
CMD ["/usr/bin/supervisord"]
