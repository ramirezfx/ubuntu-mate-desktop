# Install latest Firefox-Browser
# ------------------------------

snap remove firefox
apt-get remove -y firefox
add-apt-repository -y ppa:mozillateam/ppa
echo "Package: *" > /etc/apt/preferences.d/mozilla-firefox
echo "Pin: release o=LP-PPA-mozillateam" >> /etc/apt/preferences.d/mozilla-firefox
echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
apt install -y firefox

# Install Seafile-Cloud-Sync-Client
# ---------------------------------

wget https://linux-clients.seafile.com/seafile.asc -O /usr/share/keyrings/seafile-keyring.asc
sudo bash -c "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/jammy/ stable main' > /etc/apt/sources.list.d/seafile.list"
apt update
apt install -y seafile-gui

# Install Jekyll
----------------

apt-get install -y ruby-full build-essential zlib1g-dev && gem install jekyll bundler

# Install Mobirise
------------------

DLLINK=$(wget --save-headers --output-document - https://mobirise.com/history.html | grep .deb | grep -Eo 'https://[^ >]+'|head -1 | cut -d'"' -f 1)
wget -O /tmp/mobirise-latest.deb $DLLINK
apt-get install -y /tmp/mobirise-latest.deb

# Cleanup
# -------

rm -Rf /var/cache/apt/archives/
apt-get remove -y snapd
rm -Rf /var/lib/snapd

