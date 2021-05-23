<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_member</title>
</head>
<body>
<h3>전체 회원목록</h3>
<div id="search_box">
<form method="post" action="search.ad">
	<ul id="searchbox">
		<li><select class='wpx80' name='search'>
			<option value='all'>전체</option>
			<option value='m_name'>이름</option>
			<option value='m_email'>이메일</option>
			<option value="m_nikname">닉네임</option>
		</select></li>
		<li><input type="text" name="keyword" class="wpx300" required="required"/></li>
		<li><a class='adbtn-fill' onclick="$('form').submit()">검색</a> </li>
	</ul>
	<ul>
		<li><a class='adbtn-fill' href="member.ad">전체 회원 목록</a></li>
	</ul>
</form>
</div>
<form action="" method="post" class="center" style="text-align: center">
<table border="1" class='center'>
	
	<tr>
		<th class='wpx100'>아이디</th>
		<th class='wpx100'>이름</th>
		<th class='wpx100'>닉네임</th>
		<th class='wpx400'>이메일</th>
		<th class='wpx300'>전화번호</th>
		<th class='wpx100'>알레르기</th>		
	</tr>
	
	<c:forEach var="i" items="${list }">
		<c:set var="ad" value="${i.admin}"/>
			<c:choose>
				<c:when test="${ad eq 'Y' }">
					<tr style="background:yellow;">						
				</c:when>
				<c:otherwise>
					<tr>
				</c:otherwise>
			</c:choose>
			<td><a href="detail.ad?m_uq=${i.m_uq }">${i. m_id}</a></td>
			<td>${i. m_name}</td>
			<td>${i. m_nikname}</td>
			<td>${i. m_email}</td>
			<td>${i. m_phone}</td>
			<td>${i. m_allergy}</td>
		</tr>
	</c:forEach>
</table>
</form>

</body>
</html>