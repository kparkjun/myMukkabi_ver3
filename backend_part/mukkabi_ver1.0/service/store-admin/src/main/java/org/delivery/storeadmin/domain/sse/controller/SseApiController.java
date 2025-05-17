package org.delivery.storeadmin.domain.sse.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.delivery.storeadmin.domain.authorization.model.UserSession;
import org.delivery.storeadmin.domain.sse.connection.SseConnectionPool;
import org.delivery.storeadmin.domain.sse.connection.model.UserSseConnection;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/sse")
public class SseApiController {


    private final SseConnectionPool sseConnectionPool;

    private final ObjectMapper objectMapper;

    @CrossOrigin(origins = "*")
    @GetMapping(path="/connect",produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseBodyEmitter connect(@RequestParam Long storeId){

            log.info("SSE 연결 시도: storeId={}", storeId);

    var userSseConnection = UserSseConnection.connect(
            storeId.toString(),
            sseConnectionPool,
            objectMapper
    );

        userSseConnection.sendMessage("connected");
             return userSseConnection.getSseEmitter();
    }

    @GetMapping("/push-event")
    public void pushEvent(@RequestParam Long storeId){


        var userSseConnection=sseConnectionPool.get(storeId.toString());

        Optional.ofNullable(userSseConnection)
                .ifPresentOrElse(
                   it -> it.sendMessage("hello world"),
                        () -> log.warn("SSE 연결 없음: storeId={}",storeId)
                );
    }
}
