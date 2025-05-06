package org.delivery.storeadmin.config.rabbitmq;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;



@Configuration
public class RabbitMqConfig {

    @Bean
    MessageConverter messageConverter(ObjectMapper objectMapper){
        return new Jackson2JsonMessageConverter(objectMapper);
    }

          @Bean
        public Queue deliveryQueue() {
            return new Queue("delivery.queue", true); // durable=true
        }

        @Bean
        public DirectExchange exchange() {
            return new DirectExchange("delivery.exchange");
        }

        @Bean
        public Binding binding(Queue deliveryQueue, DirectExchange exchange) {
            return BindingBuilder.bind(deliveryQueue).to(exchange).with("delivery.key");
        }


}
