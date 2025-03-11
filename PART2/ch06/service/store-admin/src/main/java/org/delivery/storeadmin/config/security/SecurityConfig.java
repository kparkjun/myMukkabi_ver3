package org.delivery.storeadmin.config.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import java.util.List;

@Configuration
@EnableWebSecurity // security 활성화
public class SecurityConfig {

    private static  final List<String> SWAGGER = List.of("/swagger-ui.html", "/swagger-ui/**", "/v3/api-docs/**");

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf(csrf -> csrf.disable()).authorizeHttpRequests(it -> it.requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()

                .requestMatchers(SWAGGER.toArray(new String[0])).permitAll()
                        .requestMatchers("/open-api/**").permitAll()
                .anyRequest().authenticated()
               )
            .formLogin(login->login //로그인 설정
                    .loginPage("/login") // 로그인 페이지 지정 (기본값 : Spring Security 제공
                    .defaultSuccessUrl("/dashboard",true) // 로그인 성공 시 이동 페이지
                    .permitAll()
            )
                .logout(logout -> logout //로그이웃 설정
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                );

        return httpSecurity.build();
    }
}

