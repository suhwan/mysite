<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="header">
			<h1>MySite</h1>
			<ul>
				<c:choose>
					<c:when test="${authUser == null}">
						<li><a href="/mysite/member?a=loginform">로그인</a><li>
						<li><a href="/mysite/member?a=joinform">회원가입</a><li>
					</c:when>
					
					<c:otherwise>
						<li><a href="">회원정보수정</a><li>
						<li><a href="/mysite/member?a=logout">로그아웃</a><li>
						<li>${authUser.name} <%-- <%= vo.getName() %> --%>님 안녕하세요 ^^;</li>
					</c:otherwise>
				</c:choose>
			</ul>
	</div>