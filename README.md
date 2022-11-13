# ubuntu-mate-desktop-002-en

This docker-stack contains a full-working Virtual Ubuntu MATE Desktop which is accessible via NoMachine-Client (https://www.nomachine.com). Clients available for Windows/Linux/Mac OS/Raspberry PI
The deskop can also be accessed via the X2GO-Client (https://x2go.org). Clients are available for Windows/Linux/Mac OS/Raspberry PI

## INSTALLATION/SETUP

Install Docker and Docker-Compose:

`sudo apt-get install docker.io docker-compose`

Install GIT:

`sudo apt-get install git`

Clone this Repo:

`git clone https://github.com/ramirezfx/ubuntu-mate-desktop-002-en.git`

Navigate into the project-folder:

`cd ubuntu-mate-desktop-002-en`

Change the file-attributes:

`chmod +x *`

Configuration:

Open the file docker-compose.yml with your favourite editor

Modify all variables (In brackets):

- USER={{ USERNAME }} -> Change this to the username you wanna use (example: - USER=mate)

- PASSWORD={{ PASSWORD }} -> Change this to the password you wanna use (example: - PASSWORD=mate)

image: ramirezfx/ubuntu-mate-desktop-002-en:{{ VERSION }} -> Change this to the version you wanna use (example: image: ramirezfx/ubuntu-mate-desktop-002-en:kinetic)

- {{ NOMACHINE_PORT }}:4000/tcp -> Change this to the port you wanna use for the NoMachine-Client (example: - 4000:4000/tcp) for Port 4000 (Default)

- {{ X2GO_PORT }}:22/TCP -> Change this to the port you wanna use for the X2GO-Client (example: - 2222:22/TCP) for Port 2222 (Default)

When you made the changes, safe the file

start the container with this command:

`sudo docker-compose up -d`

If you wanna change your locale/language, connect via NoMachine-Client or X2GO-Client to your docker-container. Open a console and type this command:

`sudo dpkg-reconfigure locales`

If you wanna change your timezone, connect via NoMachine-Client or X2GO-Client to your docker-container. Open a console and type this command:

`sudo dpkg-reconfigure tzdata`

You can change your keyboard-layout in the conbtrol-panel

Log out and Log in again to see the changes

## CREATE/MODIFY the image

An other option would be to build your own docker-image

## INSTALLATION/SETUP

Install Docker and Docker-Compose:

`sudo apt-get install docker.io docker-compose`

Install GIT:

`sudo apt-get install git`

Clone this Repo:

`git clone https://github.com/ramirezfx/ubuntu-mate-desktop-002-en.git`

Navigate into the project-folder:

`cd ubuntu-mate-desktop-002-en`

Change the file-attributes:

`chmod +x *`

Open/Edit the file Dockerfile with your favourite editor

Locate the line that starts with ARG VER=kinetic and change the version if you want

Locate the line that starts with ENV TZ=US/Eastern and change the timezone to your needs

Locate the line that starts with ENV LANG en_US.UTF-8 and change the Language/Locale to your needs

Save the file

Build the image with this command:

`sudo docker build -t myusername/imagename:version .`

Replace myusername with your docker-username and imagename to the name you wanna give the image (example: ubuntu-mate) and version with the version (example latest)

If you wanna push it to your docker-hub, you can do this by typing this command:

`sudo docker push myusername/imagename:version`

If you don't have a docker-account you could also use this command:

`sudo docker build -t imagename:version`
