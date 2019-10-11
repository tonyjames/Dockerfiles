FROM registry.centos.org/centos:7
  
ENV DISPLAY host.docker.internal:0

RUN yum install -y java-1.8.0-openjdk

VOLUME ["/IPMIView"]

USER 1000

WORKDIR /IPMIView

CMD ["./IPMIView20"]
