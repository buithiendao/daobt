#!/bin/bash

USERNAME="hltech2025"
PASSWORD="123456"   # Đổi password ở đây
PORT=1080

echo "[*] Cập nhật và cài đặt các gói cần thiết..."
sudo apt update -y
sudo apt install dante-server curl build-essential libpam0g-dev -y

echo "[*] Cài Dante (SOCKS5 Proxy)..."
sudo touch /var/log/danted.log
sudo chown nobody:nogroup /var/log/danted.log

IFACE=$(ip route | grep default | awk '{print $5}')

sudo bash -c "cat > /etc/danted.conf" <<EOF
logoutput: /var/log/danted.log
internal: 0.0.0.0 port = $PORT
external: $IFACE
method: username
user.privileged: root
user.notprivileged: nobody
client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: connect disconnect error
}
socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: connect disconnect error
}
EOF

sudo systemctl restart danted
sudo systemctl enable danted

# Tạo user nếu chưa có
if ! id "$USERNAME" &>/dev/null; then
    sudo useradd --shell /usr/sbin/nologin "$USERNAME"
fi
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Mở port nếu UFW đang bật
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw allow $PORT/tcp
fi

# Lấy IP public
IP=$(curl -s ifconfig.me)

# Xuất thông tin proxy
echo -e "\n✅ SOCKS5 proxy: socks5:$IP:$PORT:$USERNAME:$PASSWORD"
