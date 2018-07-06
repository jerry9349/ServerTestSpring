<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보보기</title>
</head>
<body>
	<table border="3">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="id" value="${ mav.id}"size="20"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="pw" value="${mav.pw }"size="20"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="email" value="${mav.email }"size="20"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" id="name" value="${mav.name }"size="20"></td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td><input type="text" name="introduce" id="introduce" value="${mav.introduce }"size="20"></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="button" id="btnJoin" value="회원가입">
				<a href="#" onclick="history.back()">뒤로가기</a>
			</td>
		</tr>				 
	</table>

</body>
</html>