<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3 id="nowstate">현재 등록된 공지글</h3>


<!-- 파일첨부시 주의사항 
1. form 태그의 method 은 반드시 post
2. form 태그의 enctype 은 multipart/form-data 로 지정한다.
-->


<form method="post" action="nomodify.ad" >

<table style="margin: 0 auto; width: 1200px; ">
<tr style="background-color: #ef5b5b;"> 
	<td class='wpx160' style="color: #ffffff">목록</td>
	<td style="color: #ffffff">내용</td>
</tr>
<tr><th class='wpx160'>제목</th>
	<td class='left'>${vo.s_title}</td>
</tr>
<tr><th class='wpx160'>내용</th>
	<td class='left'>${vo.s_content}</td>
</tr>
</table>
<input type="hidden" value="${vo.no }" name='no'/>
<input type="hidden" value="${vo.s_title }" name='s_title'/>
<input type="hidden" value="${vo.s_content }" name='s_content'/>
<input type="hidden" value="관리자" name="writer">
</form>

<div class='btnSet'>
	<a class='btn-fill' onclick="$('form').submit()">수정</a>
</div>

<script type="text/javascript" src="js/empty_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>




