FROM ramirezfx/mate:latest

ENV DEBIAN_FRONTEND=noninteractive

# Configure timezone and locale to spanish and America/Bogota timezone. Change locale and timezone to whatever you want
RUN apt-get update -y && apt-get install -y software-properties-common sudo
RUN add-apt-repository universe
RUN apt-get update -y && apt-get install -y vim xterm pulseaudio cups curl iputils-ping libnss3 libxss1 wget xdg-utils libpango1.0-0 fonts-liberation qttranslations5-l10n

# Goto https://www.nomachine.com/download/download&id=10 and change for the latest NOMACHINE_PACKAGE_NAME and MD5 shown in that link to get the latest version.
ENV NOMACHINE_MD5 4c6c5228825355dcb30ba5adfdd32c18

# Install the mate-desktop-enviroment version you would like to have
RUN apt-get update -y && \
        apt-get install -y mate-desktop-environment-extras
#    apt-get install -y ubuntu-mate-themes ubuntu-mate-icon-themes ubuntu-mate-desktop ubuntu-mate-lightdm-theme ubuntu-mate-core mate-desktop-environment mate-desktop-environment-core mate-desktop-environment-extras locales openssh-server sudo

# download tor, firefox, libreoffice and git
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update -y && apt-get install -y firefox libreoffice htop nano git vim ubuntu-release-upgrader-core kmymoney x2goserver x2goserver-xsession

# Install nomachine, change password and username to whatever you want here
RUN curl -fSL "https://download.nomachine.com/download/6.12/Linux/nomachine_6.12.3_7_amd64.deb" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb

ADD nxserver.sh /
RUN chmod +x /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
