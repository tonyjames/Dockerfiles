FROM fedora:latest
LABEL maintainer "Tony James <tony@anthonyjames.org>"

ENV user chrome
ENV group chrome

RUN dnf update -y && \
    dnf install -y \
        libglvnd-glx \
        mesa-dri-drivers \
        libcanberra-gtk3 \
        pulseaudio-libs \
        PackageKit-gtk3-module && \
    rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub && \
    dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm && \
    dnf clean all

RUN groupadd ${group} && \
    useradd -g ${group} -m -d /home/${user} ${user} && \
    chown -R ${user}:${group} /home/${user}

COPY local.conf /etc/fonts/local.conf
COPY entrypoint.sh /usr/bin/entrypoint.sh

USER ${user}

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]