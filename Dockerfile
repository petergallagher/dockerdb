FROM dockerfile/mariadb

ENV OPEN_EYES_DB_HOST localhost
ENV OPEN_EYES_DB_USER openeyes
ENV OPEN_EYES_DB_PASS oe_test
ENV OPEN_EYES_DB_DATABASE openeyes

ADD ./import.sh /usr/local/bin/import.sh

RUN chmod +x /usr/local/bin/import.sh


