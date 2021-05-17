<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지글 목록</h3>
<div id='list-top'>
<form method="post" action='list.no'>
	<input type='hidden' name='curPage' value='1'/>
	<div>
	<ul>
		<li><select class='wpx80' name='search'>
			<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
			<option value='title' ${page.search eq 'title' ? 'selected' : ''}>제목</option>
			<option value='content' ${page.search eq 'content' ? 'selected' : ''}>내용</option>
			<option value='writer' ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
			</select>
		</li>
		<li><input type='text' value='${page.keyword}' name='keyword' class='wpx300'/></li>
		<li><a class='btn-fill' onclick="$('form').submit()">검색</a></li>
	</ul>
	<ul>
		<!-- 관리자로 로그인 된 경우만 글쓰기 가능 -->
		<c:if test="${loginInfo.admin eq 'Y'}">
		<li><a class='btn-fill' href='new.no'>글쓰기</a></li>
		</c:if>	
	</ul>
	</div>
</form>
</div>

<table>
<tr><th class='wpx60'>번호</th>
	<th>제목</th>
	<th class='wpx120'>작성자</th>
	<th class='wpx120'>작성일자</th>
	<td class='wpx80'>첨부파일</td>
</tr>
<c:forEach items="${page.list}" var="vo">
<tr><td>${vo.no}</td>
	<td class='left'>
	<c:forEach var="i" begin="1" end="${vo.indent}">
		${i eq vo.indent ? "<img src='imgs/re.gif'/>" : "&nbsp;&nbsp;"}
	</c:forEach>
		
		<a href='detail.no?id=${vo.id}'>${vo.title}</a></td>
	<td>${vo.name}</td>
	<td>${vo.writedate}</td>
	<td><c:if test="${!empty vo.filename}">
			<img class="file-img" src="imgs/attach.png"/>
		</c:if>
	</td>
<%-- 	<td>${!empty vo.filename ? '<img class="file-img" src="imgs/attach.png"/>' :''}</td> --%>
</tr>
</c:forEach>

</table>

<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>

</body>
</html>







