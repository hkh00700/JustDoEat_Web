<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table { table-layout:fixed; border-collapse: collapse; }
table, th, td {border: 1px solid #d3d8d9; border-left:none; border-right:none; padding: 10px 0;} 

table td { overflow:hidden; 
text-overflow:ellipsis; white-space:nowrap; }



</style>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="insert.bo" style="margin-top: 50px;" >
<table style="margin: 0 auto;  width: 1200px; border-top: 2px solid black;">
<tr style="background-color: #ef5b5b; "> 
	<th class='wpx160' style="color: #ffffff">목록</th>
	<td style="color: #ffffff">내용</td>
</tr>
<tr ><th class='wpx160'>제목</th>
	<td><input type='text' name='s_title' class='need' title='제목' /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${loginInfo.m_nickname}</td>
</tr>
<tr><th>내용</th>
	<td><textarea name='s_content' class='need' title='내용' ></textarea>
	</td>
</tr>
<tr><th>파일첨부</th>
	<td class='left'>
		<label>
			<input type='file' name='file' id='attach-file' />
			<img src='imgs/select.png' class='file-img' />	
		</label>
		<span id='file-name'></span>
		<span id='preview'></span>
		<span id='delete-file' style='color:red'><i class='fas fa-times'></i></span>
		</td>
</tr>
</table>
</form>

<div class='btnSet'>
	<a class='btn-so'
		onclick="if( necessary() ) { $('form').submit() }">저장</a>
	<a class='btn-not'  href='list.bo'>취소</a>
</div>

<script type="text/javascript" src="js/empty_check.js"></script>
<script type="text/javascript" 
		src="js/file_attach.js?v=<%=new java.util.Date().getTime()%>"></script>
</body>
</html>







