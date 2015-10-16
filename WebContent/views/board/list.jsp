<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	//BoardDao dao = new BoardDao();
	//List<BoardVo> list = dao.selectBoardList();
	
	//MemberVo authUser = (MemberVo)session.getAttribute("authUser");
	
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
			<div id="board">
				<form id="search_form" action="" method="post">
					<input type="text" id="kwd" name="kwd" value="">
					<input type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>	
						
					<c:set var="boardCount" value='${fn:length(list)}'/>
					<c:forEach items="${list }" var="vo" varStatus="status">
						<tr>
							<td>${boardCount-status.index}</td>
							<td>
							<a href="/mysite/board?a=view&no=${vo.no }">${vo.title }</a>
							</td>
							<td>${vo.member_name}</td>
							<td>${vo.view_cnt}</td>
							<td>${vo.ref_date}</td>
							<td>
							
							<c:if test="${not empty authUser && authUser.no == vo.member_no }">
								<a href="/mysite/board?a=delete&bno=${vo.no}" class="del">삭제</a>
							</c:if>
							
							</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${not empty authUser }">
					<div class="bottom">
						<a href="/mysite/board?a=write" id="new-book">글쓰기</a>
					</div>	
				</c:if>
						
			</div>
		</div>
		
		<c:import url="/views/include/navigation.jsp"/>
		<c:import url="/views/include/footer.jsp"/>
	</div>
</body>
</html>