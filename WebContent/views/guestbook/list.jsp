<%@page import="com.bit2015.mysite.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	
	List<GuestBookVo> list = (List<GuestBookVo>)request.getAttribute("list");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
	
		<c:import url="/views/include/header.jsp"/>
		
		<div id="content">
			<div id="guestbook">
				<form action="/mysite/guest" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
						<%
						int countTotal =list.size();
						int index = 0;
						for(GuestBookVo vo : list){ %>
						<table width=510 border=1>
							<tr>
								<td><%= countTotal-index++ %></td>
								<td><%= vo.getName() %></td>
								<td><%= vo.getRegDate() %></td>
								<td>
								<form action="/mysite/guest" method="post">
									<input type="hidden" name="a" value="deleteform">
									<input type="hidden" name="no" value="<%= vo.getNo() %>">
									<input type="submit" value="삭제">
								</form>
								</td>
							</tr>
							<tr>
								<td colspan=4><%= vo.getMessage().replaceAll("\n",	"<br>") %></td>
							</tr>
						</table>
						<% } %>
						<br>
					</li>
				</ul>
			</div>
		</div>
		
		<c:import url="/views/include/navigation.jsp"/>
		<c:import url="/views/include/footer.jsp"/>
		
	</div>
</body>
</html>