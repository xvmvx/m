#! /bin/bash
#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
apt-get update && apt-get install -y wget vim
curl -sSL https://get.daocloud.io/docker | sh
curl -L https://get.daocloud.io/docker/compose/releases/download/v2.1.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cat > /etc/docker/daemon.json <<EOF
{
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "20m",
        "max-file": "3"
    },
    "ipv6": true,
    "fixed-cidr-v6": "fd00:dead:beef:c0::/80",
    "experimental":true,
    "ip6tables":true
}
EOF
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://gap9aif6.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker


docker run --restart always \
--name fastosdocker -p 1081:8081 -p 8082:8082 \
-d -v /var/run/docker.sock:/var/run/docker.sock -e TZ="Asia/Shanghai" \
-v /etc/docker/:/etc/docker/ wangbinxingkong/fast

wget https://raw.githubusercontent.com/rnmrnmrn/m/main/my.yaml
mkdir /docker
mv my.yaml /docker/docker-compose.yml
cd /docker
docker-compose up -d
