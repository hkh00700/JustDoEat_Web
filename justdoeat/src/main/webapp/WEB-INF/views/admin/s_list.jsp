<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	
	String tm = format.format(time);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#search_box ul li {
		float: left;
	}
	
	#search_box ul li a {
		cursor: pointer;
	}
</style>
</head>
<body>
<h3>전체 가게목록</h3>
<form action="r_search" method="get">
	<div id='search_box'>
		<ul>
			<li>
				<select name="search">
					<option value='all' ${search.search eq 'all' ? 'selected' : ''}>전체</option>
					<option value="restaurant" ${search.search eq 'restaurant' ? 'selected' : ''}>가게이름</option>
					<option value="r_address" ${search.search eq 'r_address' ? 'selected' : ''}>가게주소</option>
					<option value="r_menu" ${search.search eq 'r_menu' ? 'selected' : ''}>가게메뉴</option>
				</select>
			</li>
			<li><input type="text" name="keyword" value='${search.keyword }'/></li>
			<li><a class='btn-fill'onclick="$('form').submit()">검색</a></li>
		</ul>
	</div>
</form>

<table>
	<tr>
		<th><%=tm %></th>
		<th><h4 >전체 가게 수 : ${all }</h4></th>
		<th><h4 style=" margin-left:20px; background: yellow;">오늘 등록한 가게 수 : ${toady_r } </h4></th>
	</tr>
</table>
<table border="1" class="center">
	<tr>
		<th class='wpx100'>가게이름</th>
		<th class='wpx400'>가게주소</th>
		<th class='wpx100'>전화번호</th>
		<th class='wpx400'>가게메뉴</th>
		<th class='wpx100'>등록일자</th>
	</tr>
	<c:forEach var="i" items="${vo }">
		<tr>
			<td><a href="s_detail.ad?r_uq=${i.r_uq }">${i. restaurant}</a></td>		
			<td>${i. r_address}</td>		
			<td>${i. r_tel}</td>		
			<td>${i. r_menu}</td>		
			<td>${i. hire_data}</td>		
		</tr>
	</c:forEach>	
	
	

</table>
</body>
</html>