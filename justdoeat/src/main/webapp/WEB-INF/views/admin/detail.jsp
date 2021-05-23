<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_detail</title>
</head>
<body>
<h3>${vo. m_nikname }님의 정보</h3>
<form action="update.ad" method="post" onsubmit="result fnSubmit()" class="center" style="text-align: center;" >
<input type="hidden" name="m_email" value="${vo. m_email}">
<input type="hidden" name="m_uq" value="${vo. m_uq}">
<input type="hidden" name="m_nikname" value="${vo. m_nikname }"/>
<input type="hidden" name="m_name" value="${vo. m_name }"/>
<table class="center" border="1" >
	<tr><th>*닉네임</th>
		<td style='background="yellow"'>${vo. m_nikname }</td>
	</tr>
	<tr><th>*이름</th>
		<td style='background="yellow"'>${vo. m_name }</td>
	</tr>
	<tr><th>*이메일</th>
		<td>${vo. m_email }</td>
	</tr>
	<tr><th>*아이디</th>
		<td><input type="text"  name="m_id" value="${vo. m_id}" required="required"/></td>
	</tr>
	<tr><th>*비밀번호</th>
		<td><input type="text" name="m_pw" value="${vo. m_pw }" required="required"/></td>
	</tr>
	<tr><th>휴대전화</th>
		<td><input type="text" name="m_phone" value="${vo. m_phone }" /></td>
	</tr>
	<tr><th>*성별</th>
		<td>
			<c:set var="gender" value="${vo. m_gender}"/>
			<c:choose>
				<c:when test="${gender eq 'F'}">
					<input type="radio" name="m_gender" value="여" checked="checked" />여								
					<input type="radio" name="m_gender" value="남"  />남								
				</c:when>
			
				<c:when test="${gender eq 'FEMALE' }">
					<input type="radio" name="m_gender" value="여" checked="checked" />여								
					<input type="radio" name="m_gender" value="남"  />남								
				</c:when>
			
				<c:when test="${gender eq '여성' }">
					<input type="radio" name="m_gender" value="여" checked="checked" />여								
					<input type="radio" name="m_gender" value="남"  />남								
				</c:when>
				<c:otherwise>
					<input type="radio" name="m_gender" value="여" />여								
					<input type="radio" name="m_gender" value="남" checked="checked"/>남
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr><th>주소1</th>
		<td><input type="text" name="m_addr1" value="${vo. m_addr1}"/></td>
	</tr>
	<tr><th>주소2</th>
		<td><input type="text" name="m_addr2" value="${vo. m_addr2}"/></td>
	</tr>
	<tr><th>알러지</th>
		<td><input type="text" name="m_allergy" value="${vo. m_allergy}"/></td>
	</tr>
	<tr><th>*관리자 권환</th>
		<td>		
		<c:choose>
			<c:when test="${vo.admin eq 'Y'}">
			<input type="radio" name="admin" value="Y" checked="checked"/>관리자
			<input type="radio" id="nomal_chk" name="admin" value="N"/>일반
			</c:when>
			<c:when test="${vo.admin eq 'N'}">
			<input type="radio" id="admin_chk" name="admin" value="Y"/>관리자
			<input type="radio" name="admin" value="N" checked="checked"/>일반
			</c:when>
		</c:choose>
		</td>
	</tr>
</table>
</form>
<div class='adBtn'>
	<a class='adbtn-fill' onclick="if(confirm('수정하시겠습니까?')){$('form').submit()}">수정</a>
	<a class='adbtn-fill' onclick="if(confirm('삭제하시겠습니까?')){
		location.href='delete.ad?m_uq=${vo.m_uq}'}" >삭제</a>
	<a class='adbtn-fill' href="member.ad">취소</a>
</div>
<script type="text/javascript">
	$("#nomal_chk").click(function(){
		if(confirm("일반회원으로 전환 시키시겠습니까?")){
			$(this).siblings(input).prop('checked', true);
			$(this).prop('checked', false);
		} 
		return false;
	});
	$("#admin_chk").click(function(){
		if(confirm("관리자로 전환 시키시겠습니까?")){
			$(this).siblings(input).prop('checked', true);
			$(this).prop('checked', false);
		}
		
		return false;
	});
</script>
</body>
</html>