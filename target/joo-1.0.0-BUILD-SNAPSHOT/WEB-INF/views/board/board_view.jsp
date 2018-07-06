<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.you.joo.model.dto.*"%>
<%@ include file="../include/menu.jsp"%>
<!DOCTYPE html>
<%-- <%
	BoardBean board = (BoardBean) request.getAttribute("boarddata");
%> --%>
<html>
<head>
<title>스프링 게시판</title>
</head>

<body>
	<!-- 게시판 수정 -->
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">스프링 게시판</td>
		</tr>

		<tr>
			<td style="font-family: 돋음; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>

			<td style="font-family: 돋음; font-size: 12">
			${dto.BOARD_SUBJECT}
			</td>
		</tr>
		
		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">작성자</div>
			</td>
			
			<td style="font-family: 돋음; font-size: 12">
			${dto.BOARD_NAME}
			</td>
		</tr>

		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<table border=0 width=490 height=250 style="table-layout: fixed">
					<tr>
						<td valign=top style="font-family: 돋음; font-size: 12">
						${dto.BOARD_CONTENT}
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<%-- <tr>
			<td style="font-family: 돋음; font-size: 12">
				<div align="center">첨부파일</div>
			</td>
			<td style="font-family: 돋음; font-size: 12">
				<%
					if (!(board.getBOARD_FILE() == null)) {
				%> <a href="./boardupload/<%=board.getBOARD_FILE()%>"> <%=board.getBOARD_FILE()%>
			</a> <%
 	}
 %>
			</td>
		</tr> --%>

		<tr bgcolor="cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>

		<tr align="center" valign="middle">
			<td colspan="5">
			<font size=2> 
				<a href="../boardReplyPage/${dto.BOARD_NUM}">[답변]</a>&nbsp;&nbsp;
		<c:choose>
	 		<c:when test="${sessionScope.name=='Ad min'}">
	 			<a	href="../boardUpdatePage/${dto.BOARD_NUM}">[수정]</a>&nbsp;&nbsp;
	 		</c:when>
	 		
	 		<c:when test="${sessionScope.name==dto.BOARD_NAME}">
	 			<a href="../boardUpdatePage/${dto.BOARD_NUM }">[수정]</a>&nbsp;&nbsp;
	 		</c:when>
	 		
	 		<c:otherwise>
	 		</c:otherwise>
 		</c:choose>
				<a href="../boardDelete/${dto.BOARD_NUM}">[삭제]</a>&nbsp;&nbsp;
				<a href="../boardlist.do">[목록]</a>&nbsp;&nbsp;
			</font></td>
		</tr>
	</table>
	<!-- 게시판 수정 -->
</body>
</html>