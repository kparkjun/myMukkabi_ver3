package org.delivery.storeadmin;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableRabbit
public class StoreAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(StoreAdminApplication.class,args);
    }
}
