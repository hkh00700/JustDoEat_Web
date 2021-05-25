<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>전체 가게목록</h3>
<table border="1" class="center">
	<tr>
		<th class='wpx100'>가게이름</th>
		<th class='wpx100'>가게주소</th>
		<th class='wpx100'>가게전화번호</th>
		<th class='wpx100'>가게메뉴</th>
		<th class='wpx100'>등록일자</th>
	</tr>
	<c:forEach var="i" items="${vo }">
		<tr>
			<td><a>${i. restaurant}</a></td>		
			<td>${i. r_address}</td>		
			<td>${i. r_tel}</td>		
			<td>${i. r_menu}</td>		
			<td>${i. hire_data}</td>		
		</tr>
	</c:forEach>	
	
	

</table>
</body>
</html>