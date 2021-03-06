<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지사항 안내</h3>
<table>
<tr><th class='wpx160'>제목</th>
	<td colspan='5' class='left'>${vo.title}</td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${vo.name}</td>
	<th class='wpx120'>작성일자</th>
	<td class='wpx120'>${vo.writedate}</td>
	<th class='wpx60'>조회수</th>
	<td class='wpx60'>${vo.readcnt}</td>
</tr>
<tr><th>내용</th>
	<td colspan='5' class='left'>${fn: replace(vo.content, crlf, '<br>') }</td>
</tr>
<tr><th>첨부파일</th>
	<td colspan='5' class='left'><span>${vo.filename}</span>
		<c:if test="${!empty vo.filename}">
		<a id='download' href='download.no?id=${vo.id}' style='cursor:pointer; padding-left:15px'><i class="fas fa-download"></i></a>
		</c:if>
	</td>
</tr>
</table>
<div class='btnSet'>
	<a class='btn-fill' href='list.no?curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'>목록으로</a>
	<!-- 관리자로 로그인된 경우만 수정/삭제 가능 -->
	<c:if test="${loginInfo.admin eq 'Y' and loginInfo.id eq vo.writer}">
	<a class='btn-fill' href='modify.no?id=${vo.id}'>수정</a>
	<a class='btn-fill' 
	onclick="if( confirm('정말 삭제?') ){ href='delete.no?id=${vo.id}' }">삭제</a>
	</c:if>
	<!-- 로그인된 경우는 답글쓰기 가능 -->
	<c:if test="${!empty loginInfo}">
		<a class='btn-fill' href='reply.no?id=${vo.id}'>답글쓰기</a>
	</c:if>
</div>

<script type="text/javascript">
// 	if( ${!empty vo.filename} ){
// 		$('#download').css('display', 'inline');
// 	}
// if( ${!empty vo.filename} ){
// 	var tag = "<a href='' style='cursor:pointer; padding-left:15px'><i class='fas fa-download'></i></a>";
// 	$('table span').after( tag );
// }
</script>


</body>
</html>