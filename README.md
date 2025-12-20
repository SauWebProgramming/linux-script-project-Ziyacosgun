[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/g9rN3dhc)


# Linux Sunucu Durum Paneli (Server Dashboard)

Bu proje, bir Linux sunucusunun temel sağlık verilerini (CPU, RAM, Disk, Kullanıcı Sayısı) otomatik olarak çeken ve web arayüzü üzerinden anlık olarak sunan bir otomasyon sistemidir.

## 🚀 Özellikler
- **Anlık Veri:** Sistem kaynaklarını (CPU, RAM, Disk) Linux komutlarıyla çeker.
- **Otomatik Güncelleme:** Cronjob sayesinde her dakika verileri yeniler.
- **Modern Arayüz:** CSS ile zenginleştirilmiş, karanlık mod (dark mode) destekli kullanıcı dostu tasarım.
- **Canlı İzleme:** Tarayıcı tarafında 60 saniyede bir otomatik sayfa yenileme (Meta Refresh).

## 🛠️ Kurulum ve Yapılandırma

### 1. Web Sunucu Kurulumu
Projenin yayını için Apache2 web sunucusu kullanılmıştır:
```bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
```
### 2. Scriptin Hazırlanması

monitor.sh dosyası oluşturuldu ve gerekli çalışma izinleri verildi:
```bash
chmod +x monitor.sh
```
### 3. Otomasyon (Cronjob)
#crontab -e komutu ile aşşağıdaki satır eklenmiştir: 
```bash
* * * * * /bin/bash /home/kali/Desktop/bilisimodev/monitor.sh
```
