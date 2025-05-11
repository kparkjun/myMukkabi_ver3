package org.delivery.storeadmin.domain.sse.connection.model;


import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.delivery.storeadmin.domain.sse.connection.ifs.ConnectionPoolIfs;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public class UserSseConnection {

    private final SseEmitter sseEmitter;
    private final String uniqueKey;
    private final ConnectionPoolIfs<String, UserSseConnection> connectionPoolIfs;
    private final ObjectMapper objectMapper;

    // ✅ 생성자 안에서 초기화
    private UserSseConnection(
            String uniqueKey,
            ConnectionPoolIfs<String, UserSseConnection> connectionPoolIfs,
            ObjectMapper objectMapper
    ) {
        this.uniqueKey = uniqueKey;
        this.connectionPoolIfs = connectionPoolIfs;
        this.objectMapper = objectMapper;
        this.sseEmitter = new SseEmitter(0L);

        // emitter 콜백
        this.sseEmitter.onCompletion(() -> {
            this.connectionPoolIfs.onCompletionCallback(this);
        });

        this.sseEmitter.onTimeout(() -> {
            this.sseEmitter.complete();
        });

        // 최초 연결 시 이벤트 전송
       // this.sendMessage("onopen", "connect");
    }

    // ✅ 정적 팩토리 메서드에서 등록하고 반환
    public static UserSseConnection connect(
            String uniqueKey,
            ConnectionPoolIfs<String, UserSseConnection> connectionPoolIfs,
            ObjectMapper objectMapper
    ) {
        var connection = new UserSseConnection(uniqueKey, connectionPoolIfs, objectMapper);
        connectionPoolIfs.put(uniqueKey, connection); // ⭐ pool 등록
        return connection;
    }

    public void sendMessage(String eventName, Object data) {
        try {
            var json = objectMapper.writeValueAsString(data);
            var event = SseEmitter.event()
                    .name(eventName)
                    .data(json);
            this.sseEmitter.send(event);
        } catch (IOException e) {
            this.sseEmitter.completeWithError(e);
        }
    }

    public void sendMessage(Object data) {
        try {
            var json = objectMapper.writeValueAsString(data);
            var event = SseEmitter.event().data(json);
            this.sseEmitter.send(event);
        } catch (IOException e) {
            this.sseEmitter.completeWithError(e);
        }
    }

    public SseEmitter getSseEmitter() {
        return this.sseEmitter;
    }

    public String getUniqueKey() {
        return this.uniqueKey;
    }
}
