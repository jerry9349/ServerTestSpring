<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<%@ include file="../include/menu.jsp" %>
<script>
$(function(){
	$("#btnLogin").click(function(){
		var id=$("#id").val();	//태그의 value 속성값
		var pw=$("#pw").val();
		if(id==""){
			alert('아이디를 입력하세요.');
			$("#id").focus();
			return;
		}
		if(pw==""){
			alert('비밀번호를 입력하세요.');
			$("#pw").focus();
			return;
		}
		//폼 데이터를 서버로 제출
		document.login_check.action = "${path}/member/login_check.do";
		document.login_check.submit();
	});
});
</script>
</head>
<body>
<form method="post" name="login_check">
			<h2>로그인</h2>
	<table border="3">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="pw"></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" id="btnLogin" value="로그인">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
