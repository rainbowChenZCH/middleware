import pika

def main():
    credentials = pika.PlainCredentials('guest', 'guest')
    # 连接到 RabbitMQ 服务器
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost',5672,'/', credentials))
    channel = connection.channel()

    # 声明一个队列，如果不存在则创建
    channel.queue_declare(queue='chat_queue', durable=True)

    # 定义接收消息的回调函数
    def callback(ch, method, properties, body):
        print(f"接收到消息：{body.decode()}")

    # 订阅队列中的消息
    channel.basic_consume(queue='chat_queue', on_message_callback=callback, auto_ack=True)

    print('聊天服务器启动成功，等待接收消息...')
    channel.start_consuming()

if __name__ == '__main__':
    main()