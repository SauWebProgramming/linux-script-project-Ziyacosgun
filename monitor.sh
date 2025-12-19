#!/bin/bash
# PATH ekleyerek Cron'un komutlari bulmasini sagliyoruz
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# 1. Verileri Topla (Odev maddelerine gore) [cite: 17]
TARIH=$(date "+%d/%m/%Y %H:%M:%S") # [cite: 18]
# CPU: 1 dakikalik ortalama yuku alir (%100 hatasini onler) [cite: 19]
CPU=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | sed 's/ //g')
RAM=$(free -m | awk 'NR==2{printf "%sMB / %sMB", $3, $2}') # [cite: 20]
DISK=$(df -h / | awk 'NR==2{printf "%s / %s", $3, $2}') # [cite: 21]
USER_COUNT=$(who | wc -l) # [cite: 22]

# 2. HTML Olustur (Afilli Tablo) [cite: 23, 24]
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="refresh" content="60">
    <meta charset="UTF-8">
    <title>Sistem Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #1a1a2e; color: #fff; display: flex; justify-content: center; padding-top: 50px; }
        .card { background-color: #16213e; padding: 30px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.5); width: 500px; border: 1px solid #0f3460; }
        h1 { text-align: center; color: #e94560; text-transform: uppercase; }
        table { width: 100%; margin-top: 20px; }
        th { color: #e94560; text-align: left; padding: 10px; border-bottom: 1px solid #0f3460; }
        td { color: #cfd2d6; padding: 10px; border-bottom: 1px solid #0f3460; }
    </style>
</head>
<body>
    <div class="card">
        <h1>SUNUCU DURUM PANELI</h1>
        <table>
            <tr><th>Rapor Saati</th><td>$TARIH</td></tr>
            <tr><th>CPU Yuku (1dk)</th><td>$CPU</td></tr>
            <tr><th>RAM Durumu</th><td>$RAM</td></tr>
            <tr><th>Disk Dolulugu</th><td>$DISK</td></tr>
            <tr><th>Aktif Kullanici</th><td>$USER_COUNT</td></tr>
        </table>
        <p style="text-align:center; font-size:10px; color:#533483; margin-top:20px;">Otomatik Guncelleme Sistemi Aktif</p>
    </div>
</body>
</html>
EOF
