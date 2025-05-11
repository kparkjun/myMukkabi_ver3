package org.delivery.storeadmin.domain.userorder.consumer;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.delivery.common.message.model.UserOrderMessage;
import org.delivery.db.userorder.UserOrderEntity;
import org.delivery.storeadmin.domain.userorder.business.UserOrderBusiness;
import org.delivery.storeadmin.domain.userorder.service.UserOrderService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
@Slf4j
public class UserOrderConsumer {

    private final UserOrderBusiness userOrderBusiness;
    private final UserOrderService userOrderService;
    @RabbitListener(queues="delivery.queue")
    public void userOrderConsumer(
          UserOrderMessage userOrderMessage
    ){
          log.info("message queue >> {}",userOrderMessage);

        if (userOrderMessage.getStoreId() == null) {
            Optional<UserOrderEntity> userOrder = userOrderService.getUserOrder(userOrderMessage.getUserOrderId());

            if(userOrder.isEmpty()){
                throw new RuntimeException("주문 정보 없음");
            }


            UserOrderEntity entity = userOrder.get();

            userOrderMessage = UserOrderMessage.builder()
                    .userOrderId(entity.getId())
                    .storeId(entity.getStoreId())
                    .build();
        }

          userOrderBusiness.pushUserOrder(userOrderMessage);
    }
}
