FROM docker.io/fedora:latest
LABEL maintainer "Tony James <tony@anthonyjames.org>"

RUN dnf install -y znc && \
    dnf clean all

COPY start.sh /usr/local/bin/start.sh

RUN usermod -a -G root znc && \
    chmod 755 /usr/local/bin/start.sh && \
    chgrp -R 0 /var/lib/znc && \
    chmod -R 774 /var/lib/znc

USER 1000

EXPOSE 8443 6667

CMD /usr/local/bin/start.sh