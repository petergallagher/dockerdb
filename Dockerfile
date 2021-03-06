FROM mariadb

ENV TERM dumb
ENV OPEN_EYES_DB_HOST localhost
ENV OPEN_EYES_DB_USER openeyes
ENV OPEN_EYES_DB_PASS oe_test
ENV OPEN_EYES_DB_DATABASE openeyes

ADD ./my.cnf /etc/mysql/my.cnf
ADD ./import.sh /usr/local/bin/import.sh

VOLUME /var/log

RUN chmod +x /usr/local/bin/import.sh

CMD ["mysqld_safe"]
