<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberVo authUser = (MemberVo)session.getAttribute("authUser");	
%>
<div id="navigation">
	<ul>
		<li><a href="">안대혁</a></li>
		<li><a href="/mysite/guest">방명록</a></li>
		
		<li><a href="/mysite/board">게시판</a></li>
		
	</ul>
</div>