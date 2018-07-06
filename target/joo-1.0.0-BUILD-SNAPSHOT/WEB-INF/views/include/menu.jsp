<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>	<!-- 코어태그 -->

<script src = "http://code.jquery.com/jquery-3.2.1.min.js"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<a href="${path }/member/join.do">회원가입</a>
<c:choose>
	<c:when test="${sessionScope.name == 'Ad min'}">
	<!-- 모든회원 -->
		<a href="${path }/member/member_list.do">모든 회원 정보보기</a>	
		<a href="${path }/member/logout.do">로그아웃</a>
	</c:when>
	
	<c:when test="${sessionScope.name == null }">
		<a href="${path }/member/login.do">로그인</a>
	</c:when>
	
	<%-- <c:when test="${sessionScope.name != 'Ad min'}"> --%>
	<c:otherwise>
		<a href="${path }/member/myinfo/${sessionScope.name}">내 정보보기</a>
		<a href="${path }/member/logout.do">로그아웃</a>
	</c:otherwise>
<%-- 	</c:when> --%>
</c:choose>

<c:if test="${sessionScope.name != null }">
	<p align="left"><a href="${path }/board/boardlist.do">게시판</a></p>
</c:if>

<!-- <p align="right"><a href="#" onclick="history.go(-1)">뒤로가기</a></p> -->