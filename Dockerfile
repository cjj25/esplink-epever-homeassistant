FROM bushrangers/ha-epever-mqtt
RUN apk add --update-cache \
    socat \
  && rm -rf /var/cache/apk/*
COPY looper.sh /root/
RUN chmod +x /root/looper.sh

ENTRYPOINT ["/root/looper.sh"]