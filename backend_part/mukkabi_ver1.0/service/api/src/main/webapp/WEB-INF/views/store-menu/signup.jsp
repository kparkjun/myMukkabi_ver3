<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />
<script type="text/javascript">


</script>


<div>
	<h1 class="text-center">가게메뉴등록</h1>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<form>
						
						<div class="form-group">
                        							<div class="col-sm-2">
                        								<label for="store_id" class="control-label">가게아이디</label>
                        							</div>
                        							<div class="col-sm-10">
                        								<input type="text" class="form-control"
                        								name="store_id" id="store_id" placeholder="가게아이디입력">
                        							</div>
                        						</div>

						<div class="form-group">
							<div class="col-sm-2">
								<label for="name" class="control-label">가게이름</label>
							</div>
							<div class="col-sm-10">
								<input type="name" class="form-control"
								 name="name" id="name" placeholder="가게이름입력">
							</div>
						</div>



						<div class="form-group">
							<div class="col-sm-2">
								<label for="amount" class="control-label">가격</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								name="amount" id="amount"
									placeholder="가격입력">
							</div>
						</div>

						<div class="form-group">
                        							<div class="col-sm-2">
                        								<label for="thumbnail_url" class="control-label">상품이미지</label>
                        							</div>
                        							<div class="col-sm-10">
                        								<input type="text" class="form-control"
                        								name="thumbnail_url" id="thumbnail_url"
                        									placeholder="상품이미지업로드">
                        							</div>
                        						</div>

						<div class="form-group text-center">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" onclick="submitForm()"
								 class="btn btn-success">메뉴등록하기</button>
							</div>
						</div>
					</form>

					<script>
					    function submitForm(){
					        const store_id = Number(document.getElementById("store_id").value);
					        const name=document.getElementById("name").value;
					        const amount = Number(document.getElementById('amount').value);
					        const thumbnail_url=document.getElementById("thumbnail_url").value;

					        const requestBody={
                                body:{
					                store_id: store_id,
					                name: name,
					                amount: amount,
					                thumbnail_url: thumbnail_url
                                }
					        };

					        fetch("/open-api/store-menu/register",{
					            method: "POST",
					            headers: {
					                "Authorization-Token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImV4cCI6MTc0MzI2NTEyMX0.WNnd_LROwQSO_-lY_e-HiyJEyaFa5VKKO38jpGv0UEk",
					                "Content-Type": "application/json"
					           },
					           body: JSON.stringify(requestBody)
					        })
					        .then(response => {
					            if(!response.ok) throw new Error("서버 오류");
					            return response.json();
					        })
					        .then(data => {
					            alert("메뉴 등록 성공: "+JSON.stringify(data));
					        })
					        .catch(error => {
					            console.error("에러 발생:",error);
					            alert("메뉴 등록 실패");
					        });
					    }
					</script>

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../foot.jsp"/>