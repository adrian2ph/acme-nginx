# 自动配置化证书的nginx

使用 https://github.com/auto-ssl/lua-resty-auto-ssl 自动申请配置ssl

## 使用

ssl文件夹保存证书，chown -R a+rw ssl

* 制作镜像

docker compose build

* 启动命令

进入文件夹
docker compose up -d

* 重启
docker compose restart

* 删除
docker compose down

* 测试nginx配置
docker exec  nginx-acme  nginx  -t

* 查看日志
docker logs --tail 100 -f  nginx-acme