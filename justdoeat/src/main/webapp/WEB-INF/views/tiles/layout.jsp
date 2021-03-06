<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${category eq 'cu'}">
		<c:set var="title" value="음식추천"/></c:when>
	<c:when test="${category eq 'no'}">
		<c:set var="title" value="공지사항"/></c:when>
	<c:when test="${category eq 'bo'}">
		<c:set var="title" value="밥친구들의 대화"/></c:when>
	<c:when test="${category eq 'da'}">
		<c:set var="title" value="찾아가는길"/></c:when>
	<c:when test="${category eq 'login'}">
		<c:set var="title" value="로그인"/></c:when>
	<c:when test="${category eq 'join'}">
		<c:set var="title" value="회원가입"/></c:when>		
</c:choose>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JustDoEat ${title}</title>
<link rel='icon' type='image/x-icon' href='imgs/whichfood.ico'> 
<link rel='stylesheet' type='text/css' 
	href='css/common.css?v=<%=new java.util.Date().getTime()%>'>
<script type="text/javascript" 
src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

</head>
<body>

<tiles:insertAttribute name="header" />

<div id='content'>
<tiles:insertAttribute name="content" />
</div>
<tiles:insertAttribute name="footer" />
</body>
</html>