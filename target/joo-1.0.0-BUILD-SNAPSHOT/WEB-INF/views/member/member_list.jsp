<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모든 회원 정보</title>
</head>
<body>
<p align="right"><a href="#" onclick="history.go(-1)">뒤로가기</a></p>
<c:forEach var="member" items="${list}">
	<table border="3" align="center">
	<h3 align="center">${member.id }님의 회원정보</h3>
		<tr>
			<td>아이디 : </td><td width="100px">${member.id}</td>
		</tr>
		<tr>
			<td>비밀번호 : </td><td>${member.pw}</td>
		</tr>
		<tr>
			<td>이메일 : </td><td>${member.email}</td>
		</tr>
		<tr>
			<td>이름 : </td><td>${member.name}</td>
		</tr>
		<tr>
			<td>자기소개 : </td><td>${member.introduce}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="delete/${member.id }">삭제하기</a>
	</table>
</c:forEach>

</body>
</html>