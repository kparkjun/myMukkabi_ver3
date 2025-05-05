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
        "Content-Type": "application/json"
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
                 pre.innerHTML=JSON.stringify(item.name,null,2);
                 pre.innerHTML+=JSON.stringify(item.amount,null,2);
                 resultArea2.appendChild(pre);

                const iframe=document.createElement("iframe");
                iframe.src=item.thumbnail_url;
                iframe.width=400;
                iframe.height=300;
                resultArea2.appendChild(iframe);

                const hr = document.createElement("hr");
                resultArea2.appendChild(hr);


      });
    })
    .catch(error => {
      console.error("에러 발생:", error);
    });
});
</script>



