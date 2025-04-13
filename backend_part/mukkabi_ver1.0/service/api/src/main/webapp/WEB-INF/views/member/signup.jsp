<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />
<script type="text/javascript">


</script>

<div>
	<h1 class="text-center">회원가입</h1>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<form>
						
						<div class="form-group">
                        							<div class="col-sm-2">
                        								<label for="name" class="control-label">이름</label>
                        							</div>
                        							<div class="col-sm-10">
                        								<input type="text" class="form-control"
                        								name="name" id="name" placeholder="User Name">
                        							</div>
                        						</div>

						<div class="form-group">
							<div class="col-sm-2">
								<label for="email" class="control-label">이메일</label>
							</div>
							<div class="col-sm-10">
								<input type="email" class="form-control"
								 name="email" id="email" placeholder="Email">
							</div>
						</div>



						<div class="form-group">
							<div class="col-sm-2">
								<label for="address" class="control-label">주소</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								name="address" id="address"
									placeholder="서울시 종로구 혜화동">
							</div>
						</div>

						<div class="form-group">
                        							<div class="col-sm-2">
                        								<label for="password" class="control-label">비밀번호</label>
                        							</div>
                        							<div class="col-sm-10">
                        								<input type="password" class="form-control"
                        								name="address" id="password"
                        									placeholder="비밀번호">
                        							</div>
                        						</div>

						<div class="form-group text-center">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" onclick="submitForm()"
								 class="btn btn-success">가입하기</button>
							</div>
						</div>
					</form>

					<script>
					    function submitForm(){
					        const name=document.getElementById("name").value;
					        const email=document.getElementById("email").value;
					        const address=document.getElementById('address').value;
					        const password=document.getElementById("password").value;

					        const requestBody={
					            body: {
					                name: name,
					                email: email,
					                address: address,
					                password: password
					            }
					        };

					        fetch("/open-api/user/register",{
					            method: "POST",
					            headers: {
					                "Content-Type": "application/json"
					           },
					           body: JSON.stringify(requestBody)
					        })
					        .then(response => {
					            if(!response.ok) throw new Error("서버 오류");
					            return response.json();
					        })
					        .then(data => {
					            alert("가입 성공: "+JSON.stringify(data));
					        })
					        .catch(error => {
					            console.error("에러 발생:",error);
					            alert("가입 실패");
					        });
					    }
					</script>

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../foot.jsp"/>