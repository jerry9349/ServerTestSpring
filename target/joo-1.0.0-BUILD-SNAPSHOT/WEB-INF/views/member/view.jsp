<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>	<!-- 코어태그 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보보기</title>
<script src = "http://code.jquery.com/jquery-3.2.1.min.js"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<script>

$(function(){
	$("#btnUpdate").click(function(){
		document.info.action="${path}/member/update/${dto.name}";
		document.info.submit();
	});
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		document.info.action="${path}/member/delete/${dto.name}";
		document.info.submit();
		}
	});
});
</script>
</head>
<body>
	<h2>내 정보</h2>
	<form name="info" method="post">
		<table border="3">
			<tr>
				<td>아이디</td>
				<td><input name="id" value="${ dto.id}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" value="${dto.pw }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" value="${dto.email }"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" value="${dto.name }" readonly></td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td><input name="introduce" value="${dto.introduce }"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" id="btnUpdate" value="정보수정"> 
					<input type="button" id="btnDelete" value="삭제"> 
				<a href="#"	onclick="history.back()">뒤로가기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>