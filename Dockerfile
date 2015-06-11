FROM dockerfile/mariadb

ENV TERM dumb
ENV OPEN_EYES_DB_HOST localhost
ENV OPEN_EYES_DB_USER openeyes
ENV OPEN_EYES_DB_PASS oe_test
ENV OPEN_EYES_DB_DATABASE openeyes

RUN sed -i "/bind-address\s*=\s*127.0.0.1/d" /etc/mysql/my.cnf
RUN sed -i "s/log_bin/#log_bin/g" /etc/mysql/my.cnf

ADD ./import.sh /usr/local/bin/import.sh

RUN chmod +x /usr/local/bin/import.sh

CMD ["mysqld_safe"]
