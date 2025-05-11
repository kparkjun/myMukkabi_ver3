<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 관리</title>



    <style>
        table {
          border-collapse: collapse;
          width: 100%;
        }

        th, td {
          padding: 8px;
          text-align: left;
          border-bottom: 1px solid #ddd;
        }

        .button-container button {
          margin-right: 8px;
        }
    </style>

</head>
<body>
<div id="app">
    <table>
        <thead>
        <tr>
            <th>주문번호</th>
            <th>주문내용</th>
            <th>상태</th>
            <th>액션</th>
        </tr>
        </thead>
        <tbody>
                            <tr v-for="order in orders" :key="order.user_order_response.id">
                                <td>{{ order.user_order_response.id }}</td>
                                <td>
                                    <ul>
                                        <li v-for="item in order.store_menu_response_list" :key="item.id">
                                            {{ item.name }} {{ item.amount }}
                                        </li>
                                    </ul>
                                </td>
                                <td>{{ order.user_order_response.status }}</td>
                                <td class="button-container">
                                    <button @click="acceptOrder(order)">주문수락</button>
                                    <button @click="startCooking(order)">조리시작</button>
                                    <button @click="startDelivery(order)">배달시작</button>
                                </td>
                            </tr>
                       </tbody>


    </table>
</div>

 <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    new Vue({
      el: "#app",
      data: {
        orders: [] // 서버로부터 받은 주문 데이터를 저장할 배열
      },
      methods: {
        acceptOrder(order) {
          console.log("주문수락:", order);
        },
        startCooking(order) {
          console.log("조리시작:", order);
        },
        startDelivery(order) {
          console.log("배달시작:", order);
        },
        pushData(order){
            this.orders.unshift(order);
        },
         pushTestEvent() {
                  const payload = {
                    storeId: 2,
                    message: "테스트 주문입니다" // 실제 API가 기대하는 형식으로 수정
                  };

             fetch("http://localhost:8081/api/sse/push-event", {
                    method: "POST",
                    headers: {
                      "Content-Type": "application/json"
                    },
                    body: JSON.stringify(payload)
                  })
                  .then(response => {
                    if (!response.ok) throw new Error("푸시 실패");
                    return response.text(); // or .json() depending on your API
                  })
                  .then(data => {
                    console.log("서버 응답:", data);
                  })
                  .catch(error => {
                    console.error("푸시 오류:", error);
                  });
                  }
                },

      mounted() {
        // SSE 연결
        const storeId=2;
        const url = `http://localhost:8081/api/sse/connect?storeId=2`;    // 접속주소
        const eventSource = new EventSource(url);

        eventSource.onopen = event => {
            console.log("sse connection");

        };

        eventSource.onmessage = event => {
            if (event.data === "connected") {
                console.log("SSE 연결 완료됨");
                return; // 무시
              }

          const raw = JSON.parse(event.data);

          const order = {
            user_order_response: {
              id: raw.orderId,
              status: raw.status
            },
            store_menu_response_list: raw.menus
          };

          this.pushData(order);
          this.acceptOrder(order);
        };
        }
      });
</script>
</body>
</html>

