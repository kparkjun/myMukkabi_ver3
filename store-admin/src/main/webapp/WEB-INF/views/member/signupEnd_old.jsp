<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.*" %>
<%
//1. post방식의 한글 처리
//request.setCharacterEncoding("UTF-8");

//2. 사용자가 입력한 값 받기
/* UserVO user=new UserVO();
String name=user.getName();
String userid=user.getUserid();
String email=user.getEmail();
String pwd=user.getPwd();
String hp1=user.getHp1();
String hp2=user.getHp2();
String hp3=user.getHp2();
String post=user.getPost();
String addr1=user.getAddr1();
String addr2=user.getAddr2(); */
String userid=request.getParameter("userid");
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String hp1=request.getParameter("hp1");
String hp2=request.getParameter("hp2");
String hp3=request.getParameter("hp3");
String post=request.getParameter("post");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");

//3. 유효성 체크
if(userid==null||name==null||pwd==null){
	response.sendRedirect("signup.jsp");
	return;
}
if(userid.trim().isEmpty()||name.trim().isEmpty()||pwd.trim().isEmpty()){
	%>
	<script>
		alert('모든 값을 입력해야 해요');
		history.back();
	</script>
	<%
	return;
}
//3. UserVO에 담아주기
	UserVO user=new UserVO(0,name,userid,email,pwd,hp1,hp2,hp3,post,addr1,addr2,null,1000,0);

//5. UserDAO생성해서 insertUser()호출하기
	UserDAO dao=new UserDAO();
//6. 처리결과 메시지 보여주고 이동경로로 이동
	int n=dao.insertUser(user);
	String msg=(n>0)?"등록 성공":"등록 실패";
	String loc=(n>0)?"memberAll.jsp":"javascript:history.back()";
	//href에 자바스크립트 함수를 적용하려면
	//앞에 javascript: 을 붙여주어야 한다.
%>
<script>
	alert('<%=msg%>');
	location.href='<%=loc%>';
</script>