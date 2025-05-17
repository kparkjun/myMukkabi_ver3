<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 결과를 표시할 영역 -->
<div id="resultArea2"></div>

<!-- JavaScript 코드 -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
    const resultArea2 = document.getElementById("resultArea2");
    fetch("/api/store-menu/search?storeId=2", {

      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjIwNjIwMDgzOTJ9.q0m7ZvZ2aU_kBsuh7DrQU6hRkxqSclQFsV_z5wNoOvs"
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error("요청 실패: " + response.status);
      }
      return response.json(); // 응답을 JSON으로 파싱
    })
    .then(data => {
        data.body.forEach(item=>{
                const pre=document.createElement("pre");
                pre.innerHTML="가게메뉴 : ";
                pre.innerHTML+=JSON.stringify(item.name,null,2);
                pre.innerHTML+="가격 : ";
                pre.innerHTML+=JSON.stringify(item.amount,null,2);
                resultArea2.appendChild(pre);

                const iframe=document.createElement("iframe");
                iframe.src=item.thumbnail_url;
                iframe.width=400;
                iframe.height=300;
                resultArea2.appendChild(iframe);

                const orderBtn = document.createElement("button");
                                orderBtn.innerHTML = "주문하기";
                                orderBtn.addEventListener("click", function () {
                                    fetch("/api/user-order", {
                                        method: "POST",
                                        headers: {
                                            "Content-Type": "application/json",
                                            "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjIwNjIwMDgzOTJ9.q0m7ZvZ2aU_kBsuh7DrQU6hRkxqSclQFsV_z5wNoOvs" // 실제 토큰 함수 필요
                                        },
                                        body: JSON.stringify({
                                            body: {
                                            store_id: 2,
                                            store_menu_id_list: [9]
                                            }
                                        })

                                    })
                                    .then(resp => {
                                        if (!resp.ok) {
                                            throw new Error("주문 실패: " + resp.status);
                                        }
                                        return resp.json();
                                    })
                                    .then(data2 => {
                                        alert("주문 성공! ✅");
                                        console.log("응답:", data2);
                                    })
                                    .catch(err => {
                                        alert("주문 실패 ❌");
                                        console.error("에러:", err);
                                    });
                                });
                                resultArea2.appendChild(orderBtn);

                const hr = document.createElement("hr");
                resultArea2.appendChild(hr);


      });
    })
    .catch(error => {
      console.error("에러 발생:", error);
    });
});
</script>



