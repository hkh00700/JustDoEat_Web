<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert s_title here</title>
<style type="text/css">
ul.grid li div:nth-child(1) {
	overflow:hidden; display:-wibkit-box;
	-wibkit-line-clamp:3; 
	-wibkit-box-orient: vertical;
	word-wrap:break-word; 
}
table { table-layout:fixed; border-collapse: collapse; }
/* table, th, td {border: 1px solid black;} */
table td { overflow:hidden; 
text-overflow:ellipsis; white-space:nowrap; }
</style>

</head>
<body>

<div id='list-top'>
<form method="post" action="list.bo">
	<input type='hidden' name='curPage' value='1'/>
	<input type='hidden' name='no' />
	<div style="width: 1200px; margin: 0 auto;">
		<div id=ser>
		<ul >
			<li><select id = 'select'  name='search' class='wpx140'>
				<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
				<option value='s_title' ${page.search eq 's_title' ? 'selected' : ''}>제목</option>
				<option value='s_content' ${page.search eq 's_content' ? 'selected' : ''}>내용</option>
				<option value='writer' ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
				</select>
			</li>
			<li><input type='text' value='${page.keyword}' name='keyword' class='wpx180' 
				style="display: inline-block; height:38px;" placeholder="검색어를 입력하세요"/></li>
			<li><a onclick='$("form").submit()'>검색</a></li>
		</ul>
		</div>
		<div id=page>
		<ul >
			<li><select name='pageList' class='wpx80'
					onchange="$('form').submit()" >
				<option value='5' ${page.pageList eq 5 ? 'selected': ''}>5개씩</option>
				<option value='10' ${page.pageList eq 10 ? 'selected': ''}>10개씩</option>
				<option value='15' ${page.pageList eq 15 ? 'selected': ''}>15개씩</option>
				<option value='20' ${page.pageList eq 20 ? 'selected': ''}>20개씩</option>
				
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
	</div>
</form>	
</div>

<div id='data-list' style='margin:0 auto'>
<c:if test="${page.viewType eq 'grid'}"> <!-- 바둑판형태 -->
<ul class='grid'>
	<c:forEach items="${page.list}" var="vo">
	<li>
		<div><img style="width: 200px; height: 150px;" src="${vo.s_photo_path }"></div>
<!-- 		<div><img style="width: 200px; height: 150px;" src="http://192.168.0.67:8989/justdo_eat/resources/20210517_125928.jpg"></div> -->
		<div><a onclick="go_detail(${vo.no})">${vo.s_title}</a></div>
		<div>${vo.m_nickname}</div>
		<div>${vo.updatetime}</div>
	</li>
	</c:forEach>
</ul>
</c:if>
<c:if test="${page.viewType eq 'list'}"> <!-- 목록형태 -->
<table style='margin:0 auto; width: 1200px;'>
<tr style="border-top:2px solid #040c50;background-color: #ef5b5b; padding: 0 0 10px; height: 45px;"><th class='wpx100'>No.</th>
	<th class='wpx100'>사진</th>
	<th class='wpx600'>제목</th>
	<th class='wpx100'>작성자</th>
	<th class='wpx100'>작성일자</th>
<!-- 	<th class='wpx60'>첨부파일</th> -->
</tr>
<c:forEach items="${page.list}" var="vo">
<tr style="height: 91px;">
	<td>${vo.no}</td>
	
	<td><img src="${vo.s_photo_path }" width="70" height="70"/></td> 
<!-- 	<td><img src="http://192.168.0.67:8989/justdo_eat/resources/20210517_125928.jpg" width="70" height="70"/></td>  -->
	<td class='left'><a onclick="go_detail(${vo.no})">${vo.s_title}</a></td>
<%-- 	<td>${empty vo.s_photo ? '' : '<img class="file-img" src="imgs/attach.png" />'}</td> --%>
	<td>${vo.m_nickname}</td>
	<td>${vo.updatetime}</td>
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

function go_detail(no){
	$('[name=no]').val(no);
	$('form').attr('action', 'detail.bo');
	$('form').submit();
}
</script>
</body>
</html>