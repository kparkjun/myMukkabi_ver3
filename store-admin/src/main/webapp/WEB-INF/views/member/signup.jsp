<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />
<script type="text/javascript">

</script>

<div>
	<h1 class="text-center">가맹점등록</h1>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<form onsubmit="event.preventDefault(); submitForm();">


                        <div class="form-group">
                                             		<div class="col-sm-2">
                                             			<label for="storeId" class="control-label">storeId</label>
                                             				</div>
                                             				<div class="col-sm-10">
                                             				<input type="text" class="form-control"
                                             				name="storeId" id="storeId" placeholder="가게번호">
                                                		</div>
                                                		</div>

						<div class="form-group">
                     		<div class="col-sm-2">
                     			<label for="storeName" class="control-label">가게이름</label>
                     				</div>
                     				<div class="col-sm-10">
                     				<input type="text" class="form-control"
                     				name="storeName" id="storeName" placeholder="가게이름">
                        		</div>
                        		</div>



                    <div class="form-group">
							<div class="col-sm-2">
								<label for="email" class="control-label">email</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								name="email" id="email"
									placeholder="email ">
							</div>
						</div>

                           <div class="form-group">
                    							<div class="col-sm-2">
                    								<label for="password" class="control-label">password</label>
                    							</div>
                    							<div class="col-sm-10">
                    								<input type="text" class="form-control"
                    								name="password" id="password"
                    									placeholder="password ">
                    							</div>
                    						</div>

                    <div class="form-group">
    							<div class="col-sm-2">
    								<label for="role" class="control-label">role</label>
    							</div>
    							<div class="col-sm-10">
    								<input type="text" class="form-control"
    								name="role" id="role"
    									placeholder="role ">
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
					          const storeId=document.getElementById("storeId").value;
					        const storeName=document.getElementById("storeName").value;
					        const email=document.getElementById("email").value;
					        const password=document.getElementById("password").value;
					        const role=document.getElementById("role").value;


					        const requestBody={
					                storeId: storeId,
					                storeName: storeName,
					                email: email,
					                password: password,
					                role: role
					        };

					        fetch("/open-api/store-user/register",{
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
					            console.error("++++++에러 발생+++++++++:",error);

					            error.printStackTrace();
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