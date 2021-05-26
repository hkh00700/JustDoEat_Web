<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#search_box ul li {
		float: left;
	}
	
	#search_box ul li a {
		cursor: pointer;
	}
</style>
</head>
<body>
<h3>알러지</h3>
<form action="a_search" method="get">
	<div id="search_box">
		<ul>
			<li>
				<select name='search'>
					<option value="a_category"  ${search.search eq 'a_category' ? 'selected' : ''}>분류</option>
					<option value="a_material"  ${search.search eq 'a_material' ? 'selected' : ''}>음식</option>
				</select>
			</li>
			<li><input type="text" name="keyword" value='${search.keyword }'/></li>
			<li><a class='btn-fill'onclick="$('form').submit()">검색</a></li>
		</ul>
	</div>
</form>
<table border="1" style="width:800px; margin: 0 auto; margin-top: 30px; margin-bottom: 20px;">
	<tr>
		<th width="400px">음식</th>
		<th width="200px">분류</th>
		<th width="100px"></th>
	</tr>
	<tr style="background: yellow;">
		<th><input style="width: 380px; background: yellow;" type="text" id="material" name="material" placeholder="음식이름"/></th>
		<th><select style="width: 180px; background: yellow;" name="category">
			<option value="갑각류" selected>갑각류</option>
			<option value="견과류">견과류</option>
			<option value="계란">계란</option>
			<option value="밀류" >밀류(글루텐)</option>
			<option value="우유">우유</option>
			<option value="조개류">조개류</option>
			<option value="콩류">콩류</option>
			<option value="육류">육류</option>
			<option value="과일">과일</option>
			<option value="기타">기타</option>
		</select></th>
		<th><a onclick="allergyadd()">추가</a></th>
	</tr>
	
	<c:forEach var="i" items="${vo }">
		<tr>
		<th style="width: 380px;">${i. a_material}</th>
		<input type="hidden" name="a_material" value="${i. a_material }"/>
		<th><select style="width: 180px;" name="a_category">
			<option value="갑각류" ${i. a_category eq '갑각류' ? 'selected' : ''}>갑각류</option>
			<option value="견과류" ${i. a_category eq '견과류' ? 'selected' : ''}>견과류</option>
			<option value="계란" ${i. a_category eq '계란' ? 'selected' : ''}>계란</option>
			<option value="밀류" ${i. a_category eq '밀류' ? 'selected' : ''}>밀류(글루텐)</option>
			<option value="우유" ${i. a_category eq '우유' ? 'selected' : ''}>우유</option>
			<option value="조개류" ${i. a_category eq '조개류' ? 'selected' : ''}>조개류</option>
			<option value="콩류" ${i. a_category eq '콩류' ? 'selected' : ''}>콩류</option>
			<option value="육류" ${i. a_category eq '육류' ? 'selected' : ''}>육류</option>
			<option value="과일" ${i. a_category eq '과일' ? 'selected' : ''}>과일</option>
			<option value="기타" ${i. a_category eq '기타' ? 'selected' : ''}>기타</option>
		</select>
		
		</th>
		<th><a onclick="if(confirm('삭제하시겠습니까?')){location.href='allergydelete.ad?a_material=${i.a_material}'}">삭제</a></th>
	</tr>
	</c:forEach>
</table>
</body>

<script type="text/javascript">
function allergyadd() {
	var material = $('[name=material]').val();
	var category = $('[name=category]').val();
	if(confirm('알레르기를 등록하시겠습니까?')){
	location.href= 'allergyadd.ad?material=' + material + '&category=' + category;
	} 
	
	return false;
	
};

function allergyupdate() {
	var material = $('[name=a_material]').val();
	var category = $('[name=a_category]').val();
	if(confirm('알레르기를 수정하시겠습니까?')){
		location.href = 'allergyinsert.ad?a_material=' + material + '&a_category=' + category;
	}
	return false;
	
}

</script>
</html>