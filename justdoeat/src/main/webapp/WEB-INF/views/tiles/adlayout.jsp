<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<c:choose>
	<c:when test="${category eq 'member' }">
		<c:set var="title" value="멤버관리 "/>
	</c:when>
	<c:when test="${category eq 'store' }">
		<c:set var="title" value="가게관리 "/>
	</c:when>
	<c:when test="${category eq 'allergy' }">
		<c:set var="title" value="알레르기관리 "/>
	</c:when>
	<c:when test="${category eq 'notice' }">
		<c:set var="title" value="공지관리 "/>
	</c:when>


</c:choose>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_${title }</title>
<link rel='icon' type='image/x-icon' href='imgs/whichfood.ico'> 
<link rel='stylesheet' type='text/css' 
	href='css/common.css?v=<%=new java.util.Date().getTime()%>'>
<link rel='stylesheet' type='text/css' 
	href='css/admin.css?v=<%=new java.util.Date().getTime()%>'>
<script type="text/javascript" 
src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

</head>
<body>
<tiles:insertAttribute name="header" />

<tiles:insertAttribute name="adminbody" /> 

<div id="content" style="width:1200px; margin:0 auto; margin-top:60px;">
<tiles:insertAttribute name="content"/>
</div>
<tiles:insertAttribute name="footer" />
</body>
</html>