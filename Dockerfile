FROM dockerfile/mariadb

ENV OPEN_EYES_DB_HOST $OPEN_EYES_DB_HOST
ENV OPEN_EYES_DB_USER $OPEN_EYES_DB_USER
ENV OPEN_EYES_DB_PASS $OPEN_EYES_DB_PASS
ENV OPEN_EYES_DB_DATABASE $OPEN_EYES_DB_DATABASE

ADD ./import.sh /usr/local/bin/import.sh

RUN chmod +x /usr/local/bin/import.sh

CMD ["/usr/local/bin/import.sh"]

