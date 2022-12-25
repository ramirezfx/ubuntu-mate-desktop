# Notes: 
#    1. Ubuntu 12.04 LTS (precise), 14.04 LTS (trusty), 16.04 LTS (xenial) can operate without systemd
#    2. Ubuntu 18.04 LTS (bionic), 20.04 LTS (focal), 20.10 (groovy), 21.04 (hirsute), 21.10 (impish) and upcoming 22.04 LTS (jammy) are fully-functional while using systemd.



# SET Version
ARG VER=jammy-arm64
FROM ramirezfx/ubuntu-mate-iso:$VER
ENV SHELL=/bin/bash
RUN bash -c 'if test -n "$http_proxy"; then echo "Acquire::http::proxy \"$http_proxy\";" > /etc/apt/apt.conf.d/99proxy; else echo "Using direct network connection."; fi'

RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      dbus-x11 \
      procps \
      psmisc && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      xdg-utils \
      xdg-user-dirs \
      menu-xdg \
      mime-support \
      desktop-file-utils \
      bash-completion && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      mesa-utils-extra \
      libxv1 \
      sudo \
      lsb-release \
      curl sudo wget pluma meld mate-calc atril pulseaudio vim x2goserver x2goserver-xsession
      



# Download latest nomachine-server
RUN wget -O nomachine.deb https://download.nomachine.com/download/8.2/Arm/nomachine_8.2.3_3_arm64.deb && dpkg -i nomachine.deb


# ADD nxserver.sh
RUN wget -O /nxserver.sh https://raw.githubusercontent.com/ramirezfx/ubuntu-mate-desktop/0.0.4-DE-arm64/nxserver.sh
RUN chmod +x /nxserver.sh

# Custom Packages And Sripts:
RUN wget -O /custom.sh https://raw.githubusercontent.com/ramirezfx/xubuntu-desktop/kinetic-0.0.8/custom.sh && chmod +x /custom.sh
RUN /custom.sh

# Ubuntu MATE desktop
# * package for 12.04 LTS and 14.04 LTS
# * task for 16.04 LTS and newer versions
RUN if lsb_release -cs | grep -qE "precise|trusty"; then \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ubuntu-mate-desktop --force-yes; \
    else \
      env DEBIAN_FRONTEND=noninteractive apt-get install -y \
      ubuntu-mate-desktop^; \
    fi

# remove mate-screensaver
RUN env DEBIAN_FRONTEND=noninteractive apt-get purge mate-screensaver -y
RUN env DEBIAN_FRONTEND=noninteractive apt-get autoremove --purge -y

# CMD ["mate-session"]
ENTRYPOINT ["/nxserver.sh"]
