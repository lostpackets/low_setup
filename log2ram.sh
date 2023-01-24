#!/usr/bin/env
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
sudo apt update
sudo apt install log2ram

echo "Modifying the RAM use of log2ram"
echo "SystemMaxUse=20M" >> /etc/systemd/jounald.conf

echo "Checking pre-existing systemctl status of log2ram..."
systemctl status log2ram
echo "The system must reboot for log2ram to be enabled.."
sudo reboot
