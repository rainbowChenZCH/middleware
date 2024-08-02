# 搜索RMQ镜像
docker search rabbitmq
# 拉取RMQ镜像
docker pull rabbitmq:3.7.7-management
# 创建RMQ容器实例
docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 -v /Users/pro/Documents/practice/data:/var/lib/rabbitmq --hostname myRabbit -e RABBITMQ_DEFAULT_VHOST=my_vhost  -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=admin masstransit/rabbitmq 
# 进入容器
docker exec -it rabbitmq /bin/bash
# 允许远程访问
rabbitmqctl add_vhost /
rabbitmqctl set_permissions -p "/" guest ".*" ".*" ".*"
# python连接RMQ
# 提前安装pika：pip install pika
python3 mq_pika-server.py
python3 mq_pika-client.py


 
