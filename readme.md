### 项目启动
项目启动需要使用nacos导入document/nacos-config/nacos_config_export.zip压缩包，不需要解压，直接导入即可，本压缩包注意及时更新最新版本，可能会随着课程进行内容变更

### 异步下单注意
需要添加RocketMQ的配置,配置添加到Nacos配置文件当中: tulingmall-order-dev.yml
```
rocketmq:
  name-server: 192.168.232.198:9876 #连接超时时间
  producer:
    send-message-timeout: 30000 #发送消息超时时间
    group: order-group
  tulingmall:
    scheduleTopic: order-status-check #定时任务
    cancelGroup: cancel-order #消费组业务逻辑,取消超时未支付订单
    transGroup: cart-delete #事务消息群组
    transTopic: order-cart #订单-购物车主题
    asyncOrderTopic: async-order #异步订单topic
    asyncOrderGroup: async-order-group #异步下单消息消费
```

### 图灵电商项目微服务架构图
![jiagou.jpg](http://git.jiagouedu.com/java-vip/tuling-mall/raw/master/Document/tuling-mall%e5%95%86%e5%9f%8e%e5%be%ae%e6%9c%8d%e5%8a%a1%e6%9e%b6%e6%9e%84%e5%9b%be.jpg)