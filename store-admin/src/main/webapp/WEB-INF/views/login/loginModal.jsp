<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />
<%
    String myctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Modal</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=myctx%>/css/index.css" rel="stylesheet" type="text/css">

    <style>
        div#myModal {
            background-color: black;
            color: red;
        }
    </style>

    <script>
        const accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImV4cCI6MTc0MzI2NTEyMX0.WNnd_LROwQSO_-lY_e-HiyJEyaFa5VKKO38jpGv0UEk"; // 실제 토큰으로 교체하세요

        fetch("http://localhost:8081/open-api/store-user/login", {
            method: "post",
            headers: {
                "Content-Type": "application/json",
                "authorization-token": accessToken
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("API 호출 실패: " + response.status);
            },
            body: JSON.stringify({ storeId, storeName,password })

        })
       .then(response => response.json())
       .then(data => {
           console.log("Login success", data);
       })
       .catch(err => {
           console.error("Login failed", err);
       });
    </script>

</head>

<body>

<!-- 모달 열기 버튼 -->
<button class="btn btn-info" data-toggle="modal" data-target="#myModal">로그인 창 열기</button>

<!-- 결과 출력용 -->
<pre id="result" style="background:#eee; padding:10px;"></pre>

<!-- Modal -->
<form method="post" action="<%=myctx%>/login">
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="text-center text-dark">Login</h4>
                <button data-dismiss="modal" class="close">&times;</button>
            </div>

            <div class="modal-body">

                <div class="row m-2" style="margin-bottom:10px;">
                    <label for="storeId" class="col-md-3">storeId</label>
                    <div class="col-md-9">
                        <input type="text" name="storeId" id="storeId" placeholder="storeId 입력" class="form-control">
                    </div>
                </div>


                <div class="row m-2" style="margin-bottom:10px;">
                    <label for="storeName" class="col-md-3">storeName</label>
                    <div class="col-md-9">
                        <input type="text" name="storeName" id="storeName" placeholder="storeName 입력" class="form-control">
                    </div>
                </div>

                <div class="row m-2" style="margin-bottom:10px;">
                    <label for="email" class="col-md-3">이메일</label>
                    <div class="col-md-9">
                        <input type="text" name="email" id="email" placeholder="email" class="form-control">
                    </div>
                </div>

                <div class="row m-2">
                    <label for="pwd" class="col-md-3">비밀번호</label>
                    <div class="col-md-9">
                        <input type="password" name="password" id="password" placeholder="Password" class="form-control">
                    </div>
                </div>


            <div class="row m-2" style="margin-bottom:10px;">
                <label for="role" class="col-md-3">role</label>
                <div class="col-md-9">
                    <input type="text" name="role" id="role" placeholder="role" class="form-control">
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" onclick="loginForm()" class="btn btn-primary">Login</button>
                <button type="button" class="btn btn-danger" onclick="closeAndMove()">Close</button>
            </div>

        </div>
    </div>
</div>
</form>

<script>
    function closeAndMove() {
        // 모달 수동으로 닫기
        $('#myModal').modal('hide');

        // 페이지 이동
        window.location.href = '<%=myctx%>/order/order';
    }
    </script>


<script>
function loginForm() {
    const storeId=document.getElementById("storeId").value;
    const storeName=document.getElementById("storeName").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const role=document.getElementById("role").value;

    const requestBody = {
            storeId: storeId,
            storeName: storeName,
            email: email,
            password: password,
            role: role
    };

    fetch("/open-api/store-user/login", {
        method: "post",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(requestBody)
    })
    .then(response => {
        if (!response.ok) throw new Error("서버 오류");
        return response.json();
    })
    .then(data => {
        alert("로그인 성공: " + JSON.stringify(data));
    })
    .catch(error => {
        console.error("에러 발생:", error);
        alert("로그인 실패");
    });
}


</script>
<jsp:include page="../foot.jsp"/>
</body>
</html>
