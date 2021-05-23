<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="update.no">
<table>
<tr><th class='wpx160'>제목</th>
	<td><input type='text' class='need' title='제목' name='s_title' value='${vo.s_title}' /></td>
</tr>
<tr><th>내용</th>
	<td><textarea class='need' title='내용' name='s_content'>${vo.s_content}</textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class='left'>
		<label><input type='file' name='file' id='attach-file' />
				<img src='imgs/select.png' class='file-img'/>
		</label>
		<span id='file-name'>${vo.filename}</span>
		<span id='delete-file' 
			style='display:${empty vo.filename ? "none" : "inline"}; color:red; margin-left:15px'><i class='fas fa-times'></i></span>
	</td>
</tr>
</table>
<input type='hidden' name='no' value='${vo.no}' />
<input type='hidden' name='attach'/>
</form>
<div class='btnSet'>
	<a class='btn-fill' 
		onclick="if( necessary() ) { $('[name=attach]').val( $('#file-name').text() );   $('form').submit() }">저장</a>
	<a class='btn-empty' onclick='history.go(-1)'>취소</a>
<!-- 	<a class='btn-empty' href='javascript:history.go(-1)'>취소</a> -->
<%-- 	<a class='btn-empty' href='detail.no?id=${vo.id}'>취소</a> --%>
</div>
<script type="text/javascript" src="js/empty_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>

</body>
</html>