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


# rabbitmqctl命令
# 查看用户
rabbitmqctl list_users
# 添加用户
rabbitmqctl add_user admin admin
# 设置用户标签
rabbitmqctl set_user_tags admin administrator
# 设置用户权限
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
# 删除用户
rabbitmqctl delete_user admin
# 查看vhost
rabbitmqctl list_vhosts
# 添加vhost
rabbitmqctl add_vhost my_vhost
# 删除vhost
rabbitmqctl delete_vhost my_vhost
# 查看权限
rabbitmqctl list_permissions
# 设置权限
rabbitmqctl set_permissions -p my_vhost admin ".*" ".*" ".*"
# 查看队列
rabbitmqctl list_queues
# 查看交换机
rabbitmqctl list_exchanges
# 查看绑定
rabbitmqctl list_bindings
# 查看连接
rabbitmqctl list_connections
# 查看通道
rabbitmqctl list_channels
# 查看节点
rabbitmqctl cluster_status



 
