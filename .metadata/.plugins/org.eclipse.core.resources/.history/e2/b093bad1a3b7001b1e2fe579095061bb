<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul.grid li div:nth-child(1) {
	overflow:hidden; display:-wibkit-box;
	-wibkit-line-clamp:3; 
	-wibkit-box-orient: vertical;
	word-wrap:break-word; 
}
table { table-layout:fixed; }
table td { overflow:hidden; 
text-overflow:ellipsis; white-space:nowrap; }
</style>

</head>
<body>
<h3>방명록 목록</h3>
<div id='list-top'>
<form method="post" action="list.bo">
	<input type='hidden' name='curPage' value='1'/>
	<input type='hidden' name='id' />
	<div>
		<ul>
			<li><select name='search' class='wpx80'>
				<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
				<option value='title' ${page.search eq 'title' ? 'selected' : ''}>제목</option>
				<option value='content' ${page.search eq 'content' ? 'selected' : ''}>내용</option>
				<option value='writer' ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
				</select>
			</li>
			<li><input type='text' value='${page.keyword}' name='keyword' class='wpx300' /></li>
			<li><a class='btn-fill' onclick='$("form").submit()'>검색</a></li>
		</ul>
		<ul>
			<li><select name='pageList' class='wpx80'
					onchange="$('form').submit()" >
				<option value='10' ${page.pageList eq 10 ? 'selected': ''}>10개씩</option>
				<option value='15' ${page.pageList eq 15 ? 'selected': ''}>15개씩</option>
				<option value='20' ${page.pageList eq 20 ? 'selected': ''}>20개씩</option>
				<option value='25' ${page.pageList eq 25 ? 'selected': ''}>25개씩</option>
				<option value='30' ${page.pageList eq 30 ? 'selected': ''}>30개씩</option>
				</select>
			</li>
			<li><select name='viewType' class='wpx100' 
							onchange="$('form').submit()">
				<option value='list' ${page.viewType eq 'list' ? 'selected' : ''}>리스트형태</option>
				<option value='grid' ${page.viewType eq 'grid' ? 'selected' : ''}>바둑판형태</option>
				</select>
			</li>
			<!-- 로그인된 경우 글쓰기 가능 -->
			<c:if test="${!empty loginInfo}">
			<li><a class='btn-fill' href='new.bo'>글쓰기</a></li>
			</c:if>
		</ul>
	</div>
</form>	
</div>

<div id='data-list' style='margin:0 auto'>
<c:if test="${page.viewType eq 'grid'}"> <!-- 바둑판형태 -->
<ul class='grid'>
	<c:forEach items="${page.list}" var="vo">
	<li><div><a onclick="go_detail(${vo.id})">${vo.title}</a></div>
		<div>${vo.name}</div>
		<div>${vo.writedate}<span style="float:right;">
			${empty vo.filename ? '' 
			: '<img src="imgs/attach.png" class="file-img"/>'}</span></div>
	</li>
	</c:forEach>
</ul>
</c:if>
<c:if test="${page.viewType eq 'list'}"> <!-- 목록형태 -->
<table>
<tr><th class='wpx60'>번호</th>
	<th>제목</th>
	<th class='wpx100'>작성자</th>
	<th class='wpx120'>작성일자</th>
	<th class='wpx60'>첨부파일</th>
</tr>
<c:forEach items="${page.list}" var="vo">
<tr><td>${vo.no}</td>
	<td class='left'><a onclick="go_detail(${vo.id})">${vo.title}</a></td>
	<td>${vo.name}</td>
	<td>${vo.writedate}</td>
	<td>${empty vo.filename ? '' : '<img class="file-img" src="imgs/attach.png" />'}</td>
</tr>
</c:forEach>
</table>
</c:if>

</div>

<div class='btnSet'>
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>

<script type="text/javascript">
$(function(){
	var li = $('ul.grid li').length;
	var height = Math.ceil(li / 5); 
	$('ul.grid').css('height'
			, height * $('ul.grid li').outerHeight(true) - 20 );
});

function go_detail(id){
	$('[name=id]').val(id);
	$('form').attr('action', 'detail.bo');
	$('form').submit();
}
</script>
</body>
</html>