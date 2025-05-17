<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.*" %>
<jsp:useBean id="dao" class="user.model.UserDAO" scope="session"/>
<%-- UserDAO dao=new UserDAO()와 동일함 --%>

<jsp:useBean id="user" class="user.model.UserVO" scope="page"/>
<jsp:setProperty property="*" name="user" />
<%--user.setUserid(request.getParameter("userid")); 와 동일함 --%>
<%-- >setProperty액션을 편하게 이용하려면 html의 input name Bean(VO객체)의 property(멤버변수)
	명을 일치시켜 주어야 함
	
	자바 Bean의 scope
	(1) page:페이지마다 객체를 생성함(VO)는 page scope를 줌
	(2) request : forward이동할 때 같은 request를 공유=>공유하는 페이지에 하나의 객체를 생성함
	(3) session : 브라우저에 하나의 객체를 생성함 (DAO)는 session scope를 줌
	(4) application  서버가 startup하고 shutdown할 때까지 하나의 객체를 생성함
						(커넥션 풀의 경우 application scope를 줌)
--%>

<%--UserVO user=new UserVO() 와 동일함 --%>
<%
	String userid=user.getUserid();
	String name=user.getName();
	String pwd=user.getPwd();
//1. post방식의 한글 처리
//request.setCharacterEncoding("UTF-8");

//2. 사용자가 입력한 값 받기==>useBean액션을 이용해서 받자.

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
	//UserVO user=new UserVO(0,name,userid,email,pwd,hp1,hp2,hp3,post,addr1,addr2,null,1000,0);

//5. UserDAO생성해서 insertUser()호출하기
	//UserDAO dao=new UserDAO();==>빈으로 생성함
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