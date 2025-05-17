package org.delivery.storeadmin.domain.sse.connection.ifs;

public interface ConnectionPoolIfs<K,V> {

    void onCompletionCallback(V value);
    V get(K key);
    void put(K key, V value);
}
