# 常用命令
## 脚本
### 综合脚本1
```
wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
```
### 国内脚本1
```
wget -O docker_install.sh https://raw.githubusercontent.com/rnmrnmrn/m/main/docker_install.sh && chmod +x docker_install.sh && clear && ./docker_install.sh
```
### Debian
#### 系统升级
```
sudo apt-get update & sudo apt-get upgrade
```
### Docker
#### 安装
##### 国内
```
wget -O docker_install.sh https://raw.githubusercontent.com/rnmrnmrn/m/main/docker_install.sh && chmod +x docker_install.sh && clear && ./docker_install.sh
```
##### 国外
```
wget https://raw.githubusersontent.com/xvmvx/new/main/docker.sh
chmod +x docker.sh
sudo ./docker.sh
```
#### 加速
```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://gap9aif6.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```
#### Fast OS Docker
```
docker run --restart always \
--name fastosdocker -p 1081:8081 -p 8082:8082 \
-d -v /var/run/docker.sock:/var/run/docker.sock -e TZ="Asia/Shanghai" \
-v /etc/docker/:/etc/docker/ wangbinxingkong/fast
```
#### Po
```
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```
# 常用工具
## 管理
## PBX
## 开发
## 网络
### 内网穿透
#### VPN 3合1
```
git clone --depth=1 https://github.com/bedefaced/vpn-install.git
```
##### pptp
默认情况下使用 172.16.0.0/24（可修改 pptpd.conf.dist 和 env.sh）。
```
vpn-install/pptp/install.sh
```
##### openvpn
```
vpn-install/openvpn/install.sh
```
##### ipsec
```
vpn-install/ipsec/install.sh
```
##### 卸载
在安装过程中，脚本将备份系统中的配置文件，并将创建卸载脚本。所以使用一些（在根下或使用sudo）：
```
vpn-install/pptp/uninstall/uninstall.sh
vpn-install/openvpn/uninstall/uninstall.sh
vpn-install/ipsec/uninstall/uninstall.sh
```
#### PPTP 4个
##### 一键脚本
```
wget https://raw.githubusercontent.com/saaiful/PPTP-VPN/master/install.sh
chmod +x install.sh
sudo bash install.sh
```

##### entos6一键脚本
```
git clone https://github.com/longtengdidu/centos6_pptp_sh.git
chmod +x centos6_pptp_sh
./centos6_pptp_sh
```
######  如果遇到807或者619错误，运行以下命令
```
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 1723 -j ACCEPT
iptables -A INPUT -m state --state NEW -m udp -p udp --dport 1723 -j ACCEPT
iptables -I INPUT -p tcp --dport 1723 -j ACCEPT
iptables -I INPUT -p udp --dport 1723 -j ACCEPT
/etc/init.d/iptables save
/etc/init.d/iptables restart
```

##### ccentos6带添加用户的一键脚本
```
wget https://raw.githubusercontent.com/xvmvx/m/main/vpn_centos6.sh
chmod +x vpn_centos6.sh
./vpn_centos6.sh
```


### 短网址
#### Porl
```
git clone https://github.com/ajanvier/docker-polr.git
mv docker-polr /docker/polr & cd /docker/polr/
echo "修改后台域名和密码，第8-15行,然后运行docker-compose up -d"
cp .env.example .env & vim .env
```
