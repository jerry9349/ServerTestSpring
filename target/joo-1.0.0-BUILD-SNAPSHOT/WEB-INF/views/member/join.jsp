<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>	<!-- 코어태그 -->
<!DOCTYPE html>
<html>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
    <script src = "http://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
$(function(){
	$("#btnJoin").click(function(){
		 var id=$("#id").val();	//태그의 value 속성값
		 var pw=$("#pw").val();
		 var email=$("#email").val();
		 var name=$("#name").val();
		 var introduce=$("#introduce").val();

		 if(id==""){
			 alert("아이디를 입력하세요.");
			 $("#id").focus();		//입력 포커스 이동
			 return;					//함수 종료
		 }
		 if(pw==""){
			 alert("비밀번호를 입력하세요.");
			 $("#pw").focus();
			 return;
		 }
		 if(email==""){
			 alert("이메일을 입력하세요.");
			 $("#email").focus();
			 return;
		 }
		 if(name==""){
			 alert("이름을 입력하세요.");
			 $("#name").focus();
			 return;
		 }
		 if(introduce==""){
			 alert("자기소개를 입력하세요.");
			 $("#introduce").focus();
			 return;
		 }
		 
		 //폼 데이터를 서버로 제출
		 document.join.action="${path}/member/sign_up.do";	//서버 처리할 주소 =>컨트롤러에 만들어야겠지
		 document.join.submit();
	});
});
</script>
</head>
<body>
<form name="join" method="post">
	<table border="3">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="id" size="20"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="pw" size="20"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="email" size="20"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" id="name" size="20"></td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td><input type="text" name="introduce" id="introduce" size="20"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" id="btnJoin" value="회원가입">
				<a href="#" onclick="history.back()">뒤로가기</a>
			</td>
		</tr>				 
	</table>
</form>
</body>
</html>