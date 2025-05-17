package org.delivery.storeadmin.config.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.List;

@Configuration
@EnableWebSecurity // security 활성화
public class SecurityConfig {

    private static  final List<String> SWAGGER = List.of("/swagger-ui.html", "/swagger-ui/**", "/v3/api-docs/**");

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf().disable()
                .authorizeHttpRequests(it -> {
                    it
                            .requestMatchers(
                                    PathRequest.toStaticResources().atCommonLocations()
                            ).permitAll()

                            .mvcMatchers(
                                    SWAGGER.toArray(new String[0])
                            ).permitAll()
                            .mvcMatchers(
                                    "/open-api/**","/index","/store-menu/signup",
                                    "/login/loginModal","/order/order","/api/sse/connect"
                            ).permitAll()
                            .mvcMatchers("/").authenticated()
                            .anyRequest().authenticated();

                })
                .formLogin(form -> form
                        .loginPage("/login/loginModal")
                        .defaultSuccessUrl("/order/order", true)
                        .permitAll())
                ;

        return httpSecurity.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
       // hash로 암호화
       return new BCryptPasswordEncoder();
    }

}

