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

# Install Visual Studio
-----------------------

wget -O /tmp/code.deb https://az764295.vo.msecnd.net/stable/e8a3071ea4344d9d48ef8a4df2c097372b0c5161/code_1.74.2-1671532382_arm64.deb
apt-get install /tmp/code.deb

# Cleanup
# -------

rm -Rf /var/cache/apt/archives/
apt-get remove -y snapd
rm -Rf /var/lib/snapd

