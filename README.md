# 常用命令
## 脚本
### 综合脚本1
```
wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
```
### Debian
#### 系统升级
```
sudo apt-get update & sudo apt-get upgrade
```
### Docker
#### 安装
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

```
#### Po
```

```
# 常用工具
## 管理
## PBX
## 开发
## 网络
### 短网址
#### Porl
```
git clone https://github.com/ajanvier/docker-polr.git
mv docker-polr /docker/polr & cd /docker/polr/
echo "修改后台域名和密码，第8-15行,然后运行docker-compose up -d"
cp .env.example .env & vim .env
```
