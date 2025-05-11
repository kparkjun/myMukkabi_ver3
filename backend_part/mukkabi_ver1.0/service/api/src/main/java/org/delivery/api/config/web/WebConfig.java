package org.delivery.api.config.web;

import lombok.RequiredArgsConstructor;
import org.delivery.api.interceptor.AuthorizationInterceptor;
import org.delivery.api.resolver.UserSessionResolver;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@RequiredArgsConstructor
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("classpath:/static/");
    }


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // 모든 경로에 대해
                .allowedOrigins("http://localhost:8080","https://localhost:8080") // 허용할 출처
                .allowedMethods("GET", "POST", "PUT", "DELETE") // 허용할 HTTP 메서드
                .allowedHeaders("*") // 허용할 헤더
                .allowCredentials(true); // 자격 증명 허용
    }

    private final AuthorizationInterceptor authorizationInterceptor;
    private final UserSessionResolver userSessionResolver;

    private List<String> OPEN_API = List.of(
        "/open-api/**"

    );

    private List<String> DEFAULT_EXCLUDE = List.of(
        "/",
        "favicon.ico",
        "/error",
        "/main.jsp",
        "/contact",
        "/join",
        "/index",
        "/member/signup",
        "/login/login",
        "/login/loginModal.jsp",
        "store-menu/signup",
        "store-menu/loginModal",
        "maim_detail/main_detail"
    );

    private List<String> SWAGGER = List.of(
        "/swagger-ui.html",
        "/swagger-ui/**",
        "/v3/api-docs/**"
    );

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authorizationInterceptor)
                .addPathPatterns("/api/**")
                .excludePathPatterns(OPEN_API)
            .excludePathPatterns(DEFAULT_EXCLUDE)
            .excludePathPatterns(SWAGGER)
                .excludePathPatterns(
                        "/css/**",
                        "/store-menu/signup",
                        "/store-menu/loginModal",
                        "/main_detail/main_detail",
                        "/login/loginModal",
                        "order/order",
                        "/api/sse/connect"
                )
            ;

    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(userSessionResolver);
    }
}
