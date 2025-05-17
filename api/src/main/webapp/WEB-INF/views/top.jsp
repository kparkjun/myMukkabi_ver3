<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=myctx%>/css/index.css" rel="stylesheet" type="text/css">
</head>
<script>
		const accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImV4cCI6MTc0MzI2NTEyMX0.WNnd_LROwQSO_-lY_e-HiyJEyaFa5VKKO38jpGv0UEk"; // 복사해서 붙이세요!

        fetch("http://localhost:8080/index", {
          method: "GET",
          headers: {
            "authorization-token": accessToken
          }
        })
        .then(response => {
          if (!response.ok) {
            throw new Error("API 호출 실패: " + response.status);
          }
          return response.json();
        })
        .then(data => {
          document.getElementById("result").textContent = JSON.stringify(data, null, 2);
        })
        .catch(error => {
          document.getElementById("result").textContent = "에러: " + error.message;
        });
	</script>
<body>

	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main">
				<span>Brand</span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="main">Home</a></li>
					<li><a href="member/signup">손님가입</a></li>
                    <li><a href="login/login">손님로그인</a></li>
                    <li><a href="store-menu/loginModal">가게 로그인</a></li>
                    <li><a href="store-menu/signup">가게메뉴등록</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Messages</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>