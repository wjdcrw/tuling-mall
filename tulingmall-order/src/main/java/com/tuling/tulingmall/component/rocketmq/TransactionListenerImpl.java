package com.tuling.tulingmall.component.rocketmq;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQTransactionListener;
import org.apache.rocketmq.spring.core.RocketMQLocalTransactionListener;
import org.apache.rocketmq.spring.core.RocketMQLocalTransactionState;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.messaging.Message;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;

import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@RocketMQTransactionListener(txProducerGroup = "${rocketmq.tulingmall.transGroup}")
public class TransactionListenerImpl implements RocketMQLocalTransactionListener {
    private ConcurrentHashMap<String, Integer> localTrans = new ConcurrentHashMap<String, Integer>();
    private static int maxTryMums = 3;

    @Override
    public RocketMQLocalTransactionState executeLocalTransaction(Message msg, Object orderDto) {
        log.info("------------RocketMQ执行本地订单创建-------------");
        String transId = (String)msg.getHeaders().get(RocketMQHeaders.PREFIX + RocketMQHeaders.TRANSACTION_ID);
        /**
         *
         * 写你的本地事务执行逻辑
         *
         * */
        localTrans.put(transId, 0);
        return RocketMQLocalTransactionState.UNKNOWN;
    }

    @Override
    public RocketMQLocalTransactionState checkLocalTransaction(Message msg) {
        RocketMQLocalTransactionState retState;
        String transId = (String)msg.getHeaders().get(RocketMQHeaders.PREFIX + RocketMQHeaders.TRANSACTION_ID);

        int retryTimes = localTrans.get(transId);//事务recheck次数
        int isExists = 0;//订单是否已经生成
        if(retryTimes < maxTryMums && isExists > 0){
            retState = RocketMQLocalTransactionState.COMMIT;
            localTrans.remove(transId);
        }else if(retryTimes < maxTryMums && isExists == 0){
            localTrans.put(transId,retryTimes+1);
            retState = RocketMQLocalTransactionState.UNKNOWN;
        }else{
            retState = RocketMQLocalTransactionState.ROLLBACK;
            localTrans.remove(transId);
        }
        log.info("------ !!!回查订单是否成功提交,msgTransactionId={}, TransactionState={} status={}", transId, retState, retryTimes);
        return retState;
    }

    static class MessageConvertHelper extends MappingJackson2MessageConverter {
        private final static MessageConvertHelper converter;
        static{
            converter = new MessageConvertHelper();
        }

        public static Object convert(Message<?> message, Class<?> targetClass){
            return converter.convertFromInternal(message,targetClass,null);
        }
    }

}

