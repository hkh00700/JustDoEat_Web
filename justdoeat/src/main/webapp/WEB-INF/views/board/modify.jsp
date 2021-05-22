<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#popup {
	position:absolute; 
	left:50%; top:50%; transform:translate(-50%, -50%);
	width:350px; height:350px;
	border:2px solid #666; display:none;
}
.popup { width:100%; height:100% }

table { table-layout:fixed; border-collapse: collapse; }
table, th, td {border: 1px solid #d3d8d9; border-left:none; border-right:none; padding: 10px 0;} 

table td { overflow:hidden; 
text-overflow:ellipsis; white-space:nowrap; }




div#comment_regist span { width:50%; float:left; } 


</style>
</head>
<body>


<form method="post" enctype="multipart/form-data" action="update.bo" style="margin-top: 50px;">

<table style="margin: 0 auto;  width: 1200px; border-top: 2px solid black;">
<tr style="background-color: #ef5b5b; "> 
	<th class='wpx160' style="color: #ffffff">목록</th>
	<td style="color: #ffffff">내용</td>
</tr>
<tr><th class='wpx160'>제목</th>
	<td class='left'><input type="text" value="${vo.s_title}" name="s_title"></td>
</tr>
<tr><th class='wpx160'>내용</th>
	<td class='left'><textarea name="s_content" cols='80' rows='10' style="padding:10px; font-size: 16px; ">${fn: replace(vo.s_content, crlf, '<br>') }</textarea></td>
</tr>
<tr><th>파일첨부</th>
	<td class='left'>
		<label>
			<input type='file' name='file' id='attach-file' />
			<img src='imgs/select.png' class='file-img' />	
		</label>
		<span id='file-name'>${vo.s_photo}</span>
		<span id='preview'></span>
		<span id='delete-file' style='color:red'><i class='fas fa-times'></i></span>
		</td>
</tr>
</table>
<input type='hidden' name='no' value='${vo.no}' />
<input type='hidden' name='attach'/>
</form>

<div class='btnSet'>
	<a class='btn-so' style="border-radius: 15px 0 0 15px;"
		onclick="if( necessary() ) { $('[name=attach]').val( $('#file-name').text() );  $('form').submit() }">저장</a>
	<a class='btn-so' style="border-radius: 0 15px 15px 0;"
	onclick='$("form").attr("action","detail.bo"); $("form").submit()'>취소</a>
</div>

<script type="text/javascript" 
		src="js/file_attach.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" 
		src="js/empty_check.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript">

	

if(${!empty vo.s_photo} ){
	$('#delete-file').css('display', 'inline');
	if( isImage('${vo.s_photo}') ){
		var img = "<img class='file-img' src='${vo.s_photo_path}' />";
		$('#preview').html(img);
	}
}
</script>

</body>
</html>






