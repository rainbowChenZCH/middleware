import pika
import sys

def send_message(message):
    # 连接到 RabbitMQ 服务器
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
    channel = connection.channel()

    # 确保队列存在
    channel.queue_declare(queue='chat_queue', durable=True)

    # 发送消息
    channel.basic_publish(exchange='',
                          routing_key='chat_queue',
                          body=message,
                          properties=pika.BasicProperties(
                            delivery_mode = 2,  # 使消息持久化
                          ))
    print(f"发送消息成功：'{message}'")
    connection.close()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("使用方法：python send.py '消息内容'")
        sys.exit(1)
    
    message = sys.argv[1]
    send_message(message)