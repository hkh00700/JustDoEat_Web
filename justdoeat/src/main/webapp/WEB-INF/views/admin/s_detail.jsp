<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 table {
		border-collapse: collapse;
	}
</style>
</head>
<body>
<h3>가게 상세화면 </h3>
<form  style="margin: 0 auto;" method="get" action="s_modify.ad" >
<input type="hidden" name="r_uq" value="${vo. r_uq }"/>
<input type="hidden" name="restaurant" value="${vo. restaurant }"/>


<table  style="margin: 0 auto;" border="1">
	<tr><th>회원이름 </th> 
		<td class='wpx300 left' style="padding-left:10px"><a href="detail.ad?m_uq=${list.m_uq }">${list. m_name }</a></td>
	</tr>	
	<tr><th>가게이름 </th>
		<td class='wpx300 left' style="padding-left:10px">${vo. restaurant }</td>
	</tr>
	<tr><th>주소</th>
		<td class='left'><a class='btn-fill' onclick='daum_post()'>우편번호찾기</a>
			<input type='text' name='post' class='wpx60' readonly /><br/>
			<input type='text' name='r_address' class='wpx300' value="${vo.r_address }" readonly />
		</td>
		</tr>
	<tr><th>*전화번호 </th>
		<td class='wpx300'><input type="text" class='wpx300' name="r_tel" value="${vo. r_tel }"/></td>
	</tr>
	<tr><th>*메뉴 </th>
		<td ><input type="text" class='wpx300' name="r_menu" value="${vo. r_menu}" required="required"/></td>
	</tr>
	<tr><th>*등록일자 </th>
		<td style= 'padding-left: 10px;' class='wpx300 left'>${vo. hire_data }</td>
	</tr>
</table>
</form>
<div class='adBtn'>
	<a class='adbtn-fill' onclick="if(confirm('수정하시겠습니까?')){$('form').submit()}">수정</a>
	<a class='adbtn-fill' onclick="if(confirm('삭제하시겠습니까?')){
		location.href='r_delete.ad?r_uq=${vo.r_uq}'}" >삭제</a>
	<a class='adbtn-fill' href="store.ad">취소</a>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function daum_post(){
	new daum.Postcode({
		oncomplete: function( data ){
			$('[name=post]').val( data.zonecode );
			//도로명주소R/지번주소J
			var address = data.userSelectedType == 'R' 
				? data.roadAddress : data.jibunAddress;
			if( data.buildingName!='' ) address += ' ('+data.buildingName+')';
			$('[name=r_address]').eq(0).val( address );
		}
	}).open();
}
</script>
</body>
</html>