<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	//BoardVo bVo = (BoardVo)request.getAttribute("board");
	//MemberVo mVo = (MemberVo)session.getAttribute("authUser");
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/views/include/header.jsp"/>
		<div id="content">
			<div id="board" class="board-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td class="label">제목</td>
						<td>${board.title}</td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">${fn:replace(board.content,newLine,'<br>')}</div>
						</td>
					</tr>
				</table>
				<div class="bottom">
					<a href="/mysite/board?a=list">글목록</a>
					<c:if test="${not empty authUser && authUser.no == board.member_no}">
						<a href="/mysite/board?a=modify&bno=${board.no}">글수정</a>
					</c:if>
				</div>
			</div>
		</div>
		<c:import url="/views/include/navigation.jsp"/>
		<c:import url="/views/include/footer.jsp"/>
	</div>
</body>
</html>