<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.you.joo.model.dto.*"%>
<%@ include file="../include/menu.jsp"%>
<html>
<head>
<title>스프링 게시판</title>
</head>

<body>
	<!-- 게시판 리스트 -->
	<table width=50% border="0" cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="4">스프링 게시판</td>
		<%-- 	<td align=right><font size=2>글 개수 : ${listcount }</font></td> --%>
		</tr>

		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
				height="26">
				<div align="center">번호</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
				<div align="center">제목</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
				<div align="center">작성자</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
				<div align="center">날짜</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
				<div align="center">조회수</div>
			</td>
		</tr>



		<%-- <%
			for (int i = 0; i < boardList.size(); i++) {
				BoardDTO bl = (BoardDTO) boardList.get(i);
		%> --%>
		<c:forEach var="list" items="${boardlist}">
		<tr align="center" valign="middle" bordercolor="#333333"
			onmouseover="this.style.backgroundColor='F8F8F8'"
			onmouseout="this.style.backgroundColor=''">
			<td height="23" style="font-family: Tahoma; font-size: 10pt;">${list.BOARD_NUM}
			</td>

			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="left">
					<c:choose>
						<c:when test="${list.BOARD_RE_LEV != 0}">
							<c:forEach var="a" items="${list.BOARD_RE_LEV * 2 }">
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					
					<a href="boardview/${list.BOARD_NUM}"> ${list.BOARD_SUBJECT}</a>
				</div>
			</td>

			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center">${list.BOARD_NAME}</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center">${list.BOARD_DATE}</div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center">${list.BOARD_READCOUNT}</div>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td><a href="boardinsertpage.do">[글쓰기]</a></td>
		</tr>
		
		<%-- <%
			}
		%>
		<tr align=center height=20>
			<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
				<%
					if (nowpage <= 1) {
				%> [이전]&nbsp; <%
 	} else {
 %> <a href="./BoardList.bo?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./BoardList.bo?page=<%=a%>">[<%=a%>]
			</a>&nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./BoardList.bo?page=<%=nowpage + 1%>">[다음]</a> <%
 	}
 %>
			</td>
		</tr>

		<tr align="right">
			<td colspan="5">
				<%
					if (application.getAttribute("id") != null && application.getAttribute("id").equals("admin")) {
				%> <a href="./MemberListAction.me">[회원관리]</a> <%
 	} else {
 %> <a href="./MemberViewAction.me?id=<%=application.getAttribute("id")%>">[내정보]</a>
				<%
					}
				%> --%>
<!-- 			</td>
		</tr> -->
	</table>
</body>
</html>