<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="include/menu.jsp" %>
</head>
<body>
<h2>안녕</h2>
	<c:choose>
		<c:when test="${sessionScope.name =='Ad min' }">
			<h3>어마무시한 ${sessionScope.name }님 환영합니다.</h3>
		</c:when>
		<c:when test="${sessionScope.name == null }">
		</c:when>
		<c:otherwise>
			<h3>${sessionScope.name} 님 환영합니다.</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>
