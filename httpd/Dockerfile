FROM registry.redhat.io/ubi8

LABEL maintainer="Tony James"

RUN dnf update -y && \
    dnf install -y httpd

CMD ["httpd","-DFOREGROUND"]
