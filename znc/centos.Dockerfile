FROM docker.io/centos:latest
LABEL maintainer "Tony James <tony@anthonyjames.org>"

RUN yum install -y epel-release && \
    yum install -y znc && \
    yum clean all

COPY start.sh /usr/local/bin/start.sh

RUN usermod -a -G root znc && \
    chmod 755 /usr/local/bin/start.sh && \
    chgrp -R 0 /var/lib/znc && \
    chmod -R 774 /var/lib/znc

USER znc

EXPOSE 8443 6667

CMD /usr/local/bin/start.sh