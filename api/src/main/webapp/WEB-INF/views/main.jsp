<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String myctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

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

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="<%=myctx%>/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span>Brand</span></a>
		</div>

	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-pills">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="<%=myctx%>/member/signup">손님가입</a></li>
                    <li><a href="<%=myctx%>/login/login">손님로그인</a></li>
                    <li><a href="<%=myctx%>/store-menu/signup">가게 메뉴 등록</a></li>
                 	<li><a href="<%=myctx%>/store-menu/loginModal">가게로그인</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="carousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="item active">
							<img src="https://unsplash.imgix.net/photo-1423439793616-f2aa4356b37e?w=1024&amp;q=50&amp;fm=jpg&amp;s=3b42f9c018b2712544debf4d6a4998ff">
							<div class="carousel-caption">
								<h2>먹깨비 ver 1.0</h2>
								<p>배달앱</p>
								<P> << 사용자용 >></P>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-example" data-slide="prev">
						<i class="icon-prev fa fa-angle-left"></i>
					</a>
					<a class="right carousel-control" href="#carousel-example" data-slide="next">
						<i class="icon-next fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-3" id="resultIndex">
                <img src="img/chiken.png" id="chickenImage" class="img-responsive" style="cursor:pointer;">
                				<h2>치킨</h2>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    document.getElementById("chickenImage").addEventListener("click", function () {
                      window.location.href = "<%=myctx%>/main_detail/main_detail";
                    });
                });

                document.addEventListener("DOMContentLoaded",function(){
                const resultIndex=document.getElementById("resultIndex");
                fetch("/api/store/search?storeCategory=CHICKEN",{
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
                        pre.innerHTML="가게이름 : ";
                        pre.innerHTML+=JSON.stringify(item.name,null,2);
                        pre.innerHTML+="주소 : ";
                        pre.innerHTML+=JSON.stringify(item.address,null,2);
                        pre.innerHTML+="별점 : ";
                        pre.innerHTML+=JSON.stringify(item.star,null,2);
                        pre.innerHTML+="최소가격 : ";
                        pre.innerHTML+=JSON.stringify(item.minimum_amount,null,2);
                        pre.innerHTML+="최소배달가격 : ";
                        pre.innerHTML+=JSON.stringify(item.minimum_delivery_amount,null,2);
                        pre.innerHTML+="전화번호 : ";
                        pre.innerHTML+=JSON.stringify(item.phone_number,null,2);
                        resultIndex.appendChild(pre);
            });
        })
        .catch(error => {
              console.error("에러 발생:", error);
            });
        });
        </script>
    </div>

			<div class="col-md-3">
				<img src="img/chiness.png" class="img-responsive">
				<h2>중국 음식</h2>
				<img src="img/jambong.png" class="img-responsive">
			</div>
			<div class="col-md-3">
				<img src="img/ssi.png" class="img-responsive img-rounded">
				<h2>스시</h2>
				<img src="img/cho.png" class="img-responsive">
			</div>
			<div class="col-md-3">
				<img src="img/yoa.png" class="img-responsive img-rounded">
				<h2>아이스크림/커피</h2>
				<img src="img/cf.png" class="img-responsive">
			</div>
		</div>
	</div>
</div>


<footer class="hidden-xs section section-primary">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>Footer header</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisici elit,<br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.<br>Ut enim ad minim veniam, quis nostrud</p>
			</div>
			<div class="col-sm-6">
				<p class="text-info text-right"><br><br></p>
				<div class="row">
					<div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
						<a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 hidden-xs text-right">
						<a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
						<a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
</body>
</html>
