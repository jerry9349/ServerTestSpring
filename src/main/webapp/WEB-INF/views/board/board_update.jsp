<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ page import="com.you.joo.model.dto.*"%>
<%@ include file="../include/menu.jsp"%>
<html>
<head>
<title>스프링 게시판</title>
<script language="javascript">
	function updateboard() {
		/* boardform.action("board/insert.do"); */
		boardform.submit();
	}
</script>
</head>
<body>
	<!-- 게시판 등록 -->
	<form action="../boardUpdate/${dto.BOARD_NUM}" method="post" name="boardform">
		<table cellpadding="0" cellspacing="0">
			<tr align="center" valign="middle">
				<td colspan="5">MVC 게시판</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td><input name="BOARD_NAME" type="text" size="10"
					maxlength="10" value="${sessionScope.name}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">비밀번호</div>
				</td>
				<td><input name="BOARD_PASS" type="password" size="10"
					maxlength="10" value="${dto.BOARD_PASS}" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				<td><input name="BOARD_SUBJECT" type="text" size="50"
					maxlength="100" value="${dto.BOARD_SUBJECT}" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="BOARD_CONTENT" cols="67" rows="15" >${dto.BOARD_CONTENT}</textarea></td>
			</tr>
			<!-- <tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">파일 첨부</div>
				</td>
				<td><input name="BOARD_FILE" type="file" /></td>
			</tr> -->
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<!-- 게시판 등록 -->
			
			<tr align="center" valign="middle">
				<td colspan="5"><font size=2> 
				<c:choose>
					<c:when test="${sessionScope.name=='Ad min'}">
						<%-- <a href="../boardUpdate/${dto.BOARD_NUM}">[수정]</a>&nbsp;&nbsp; --%>
						<a href="javascript:updateboard()">[수정]</a>&nbsp;&nbsp;
	 				</c:when>

					<c:when test="${sessionScope.name==dto.BOARD_NAME}">
						<%-- <a href="../boardUpdate/${dto.BOARD_NUM }">[수정]</a>&nbsp;&nbsp; --%>
						<a href="javascript:updateboard()">[수정]</a>&nbsp;&nbsp;
	 				</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose> 
						<a href="#" onclick="history.go(-1)">[뒤로가기]</a>
				</font>
				</td>
			</tr>
		</table>
	</form>
	<!-- 게시판 수정 -->
</body>
</html>