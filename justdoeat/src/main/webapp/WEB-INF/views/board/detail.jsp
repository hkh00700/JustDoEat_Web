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


<div style="text-align: left; margin-left:365px; margin-top: 50px; margin-bottom: 15px;">
조회수
<span style="color: #ef5b5b">${vo.readcnt}</span>
</div>
<table style="margin: 0 auto; width: 1200px; border-top: 2px solid black;">
<tr style="background-color: #ef5b5b;"> 
	<th class='wpx160' style="color: #ffffff">목록</th>
	<td style="color: #ffffff">내용</td>
</tr>
<tr><th class='wpx160'>제목</th>
	<td class='left'>${vo.s_title}</td>
</tr>
<tr><th class='wpx160'>작성자</th>
	<td class='left'>${vo.m_nikname}</td>
</tr>
<tr><th class='wpx160'>내용</th>
	<td class='left'>${fn: replace(vo.s_content, crlf, '<br>') }</td>
</tr>
<tr><th class='wpx160'>첨부파일</th>
	<td class='left'><span>${vo.s_photo}</span>
		<c:if test="${!empty vo.s_photo}">
		<span id='preview'></span>
<%-- 		<a id='download' href='download.bo?id=${vo.no}' style='cursor:pointer; padding-left:15px'><i class="fas fa-download"></i></a> --%>
		</c:if>
	</td>
</tr>
</table>
<div class='btnSet'>
	<!-- <a class='btn-fill' onclick='$("form").submit()'>목록으로</a>
	로그인한 사용자가 작성한 글인 경우만 수정/삭제 가능 -->
	<c:if test="${loginInfo.m_id eq vo.writer}">
	<a class='btn-so' style="border-radius: 15px 0 0 15px;"
		onclick="$('form').attr('action', 'modify.bo');  $('form').submit()">수정</a>
		
	<a class='btn-so' style="border-radius: 0 15px 15px 0;"
		onclick="if( confirm('정말 삭제?') ) { $('form').attr('action', 'delete.bo');  $('form').submit() }">삭제</a>
	</c:if>
</div>
<div id='popup-background' 
	onclick="$('#popup, #popup-background').css('display', 'none')"></div>
<div id='popup'></div>
<form method="post" action='list.bo'>
	<input type='hidden' name='no' value='${vo.no}' /> 
	<input type='hidden' name='curPage' value='${page.curPage}' />
	<input type='hidden' name='search' value='${page.search}' />
	<input type='hidden' name='keyword' value='${page.keyword}' />
	<input type='hidden' name='pageList' value='${page.pageList}' />
	<input type='hidden' name='viewType' value='${page.viewType}' />
</form>


<script type="text/javascript" 
		src="js/file_attach.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript">
// comment_list();

// function comment_regist(){
// 	//로그인 되어 있는지 확인
// 	if( ${empty loginInfo} ){
// 		alert('댓글을 등록하려면 로그인하세요!');
// 		return;
// 	}else if ( $.trim($('#comment').val())=='' ){
// 		alert('댓글을 입력하세요!');
// 		$('#comment').val('');
// 		$('#comment').focus();
// 		return;
// 	}
	

if( ${!empty vo.s_photo} ){
	//첨부된 파일이 있고 이미지파일인 경우 미리보기
	if( isImage('${vo.s_photo}') ){
		var img = "<img id='preview-img' class='file-img' src='${vo.s_photo_path}' />";
		$('#preview').html(img);
	}
}

$('#preview-img').click(function(){
	$('#popup, #popup-background').css('display', 'block');
	var img = "<img class='popup' src='${vo.s_photo_path}' />";
	$('#popup').html(img);
	
});
</script>
</body>
</html>






