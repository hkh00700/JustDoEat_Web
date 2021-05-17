<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>방명록 수정</h3>
<form method="post" enctype="multipart/form-data" action="update.bo" >
<table>
<tr><th class='wpx160'>제목</th>
	<td><input type='text' name='title' value='${vo.title}' class='need' title='제목' /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${vo.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea name='content' class='need' title='내용' >${vo.content}</textarea>
	</td>
</tr>
<tr><th>파일첨부</th>
	<td class='left'>
		<label>
			<input type='file' name='file' id='attach-file' />
			<img src='imgs/select.png' class='file-img' />	
		</label>
		<span id='file-name'>${vo.filename}</span>
		<span id='preview'></span>
		<span id='delete-file' style='color:red'><i class='fas fa-times'></i></span>
		</td>
</tr>
</table>
<input type='hidden' name='id' value='${vo.id}' />
<input type='hidden' name='attach'/>
</form>

<div class='btnSet'>
	<a class='btn-fill' 
		onclick="if( necessary() ) { $('[name=attach]').val( $('#file-name').text() );  $('form').submit() }">저장</a>
	<a class='btn-empty' 
	onclick='$("form").attr("action","detail.bo"); $("form").submit()'>취소</a>
</div>

<script type="text/javascript" src="js/empty_check.js"></script>
<script type="text/javascript" 
		src="js/file_attach.js?v=<%=new java.util.Date().getTime()%>"></script>

<script type="text/javascript">
if(${!empty vo.filename} ){
	$('#delete-file').css('display', 'inline');
	if( isImage('${vo.filename}') ){
		var img = "<img class='file-img' src='${vo.filepath}' />";
		$('#preview').html(img);
	}
}
</script>
</body>
</html>







