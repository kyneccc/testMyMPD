#!/bin/bash 

apt-get install -y sudo
#добавление рута в файл sudoers
echo 'root ALL=(ALL:ALL) ALL' >> /etc/sudoers
# Создание всех необходимых папок и файлов
sudo -u test mkdir -p /home/test/Music/playlists
sudo -u test mkdir -p /home/test/logs/
sudo -u test mkdir /home/test/.config/mpd/
sudo -u test touch /home/test/.config/mpd/db.mpd

# Копирование конфигурационного файла
cp ./mpd.conf /home/test/.config/mpd/

#установка необходимых пакетов
apt-get update && apt-get install -y myMPD mpd

sudo -u  test mpd /home/test/.config/mpd/mpd.conf
systemctl start mympd                          
