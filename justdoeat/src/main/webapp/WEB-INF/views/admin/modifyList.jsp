<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지글 수정 </h3>
<!-- 파일첨부시 주의사항 
1. form 태그의 method 은 반드시 post
2. form 태그의 enctype 은 multipart/form-data 로 지정한다.
-->
<form method="post" action="noinsert.ad" >
<table style="margin: 0 auto; width: 1200px; ">
<tr style="background-color: #ef5b5b;"> 
	<td class='wpx160' style="color: #ffffff">목록</td>
	<td style="color: #ffffff">내용</td>
</tr>
<tr><th class='wpx160'>제목</th>
	<td class='left'><input type="text" name="s_title" value="${vo.s_title}"/></td>
</tr>
<tr><th class='wpx160'>내용</th>
	<td class='left'>
	<textarea rows="50" cols="50" name="s_content">
	${vo.s_content}
	</textarea>
	</td>
</tr>
</table>
<input type="hidden" value="${vo.no }" name='no'/>

</form>

<div class='btnSet'>
	<a class='btn-fill' onclick="$('form').submit()">수정</a>
	<a class='btn-empty' href='notice.ad'>취소</a>
</div>

<script type="text/javascript" src="js/empty_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>




