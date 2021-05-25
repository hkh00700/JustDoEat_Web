<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' type='text/css' 
	href='css/member.css?v=<%=new java.util.Date().getTime()%>'>
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<div class="content">
<h3>회원정보 수정</h3>
<form method="post" action="mypage_modify">
<input type="hidden" name="m_email" value="${mypage.m_email }"/>
<table class='wpct40 centertable'>

	<tr><th class='wpx120'>성명</th>
		<td class='left'><input type='text' name='m_name' value="${mypage.m_name }" /></td>
	</tr>
	<tr><th>아이디</th>
		<td class='left'><input type='text' name='m_id' class='chk chked' value="${mypage.m_id}" /><a class='btn-fill-s' id='btn-id' style="display: none">중복확인</a><br>
		<div class='valid'>아이디를 변경하세요(영문소문자,숫자만 입력가능)</div>
		</td>
	</tr>
	<tr><th>비밀번호</th>
		<td class='left'><input type='password' name='m_pw' class='chk' value="${mypage.m_pw}" /><br>
		<div class='valid'></div>
		</td>
	</tr>
	<tr><th>비밀번호확인</th>
		<td class='left'><input type='password' name='pw_check' class='chk' /><br>
		<div class='valid'></div>
		</td>
	</tr>
	<tr><th>닉네임</th>
		<td class='left'><input type='text' name='m_nickname' class='chk chked' value="${mypage.m_nickname}"/><a class='btn-fill-s' id='btn-nik' style="display: none">중복확인</a><br>
		<div class='valid'>닉네임을 입력하세요</div>
		</td>
	</tr>
	<tr><th>성별</th>
		<td class='left'>
 		<label><input type="radio" name="m_gender" value="남" ${mypage.m_gender eq '남' ? 'checked' : ''}/>남</label>
		<label><input type="radio" name="m_gender" value="여" ${mypage.m_gender eq '여' ? 'checked' : ''}/>여</label>
	</td>
	</tr>
	<tr><th>전화번호</th>
		<td class='left'><input class='wpx40' type='text' name='m_tel' maxlength="3"  value="${mypage.m_tel[0]}" />
			- <input class='wpx40' type='text' name='m_tel' maxlength="4" value="${mypage.m_tel[1]}" />
			- <input class='wpx40' type='text' name='m_tel' maxlength="4" value="${mypage.m_tel[2]}" />
		</td>
	</tr>
	<tr><th>주소</th>
		<td class='left'><a class='btn-fill-s' onclick='daum_post()'>우편번호찾기</a>
			<input type='text' name='m_post' value="${mypage.m_post}" class='wpx60' readonly /><br>
			<input type='text' name='m_addr1' value="${mypage.m_addr1}" />
			<input type='text' name='m_addr2' value="${mypage.m_addr2}" />
		</td>
	</tr>
</table>
</form>
<div class='btnSet'>
<a class='btn-fill' onclick='go_modify()'>수정</a>
<a class='btn-empty' onclick='cancel()'>취소</a>
</div>
</div>

<script type="text/javascript" 
	src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function cancel() {
	if(confirm("정말 취소하겠습니까?")){
		location.href='<c:url value="/"/>';
		alert("취소되었습니다!")
    }else {
        return false;
    }
}

var fm_id = "${mypage.m_id}";
var fm_nik = "${mypage.m_nickname}";

function go_modify(){
	if( $('[name=m_name]').val()=='' ){
		alert('성명을 입력하세요!');
		$('[name=m_name]').focus();
		return;	
	}
	
	//아이디는 중복확인을 한 경우 이미 사용중이라면 회원가입불가
	if( $('[name=m_id]').hasClass('chked') ){
		if( $('[name=m_id]').siblings('div').hasClass('invalid') ){
			alert('수정불가!\n' + join.m_id.unUsable.desc );
			$('[name=m_id]').focus();
			return;
		}
	}else{
	//아이디는 중복확인을 하지 않은 경우
		if( ! item_check( $('[name=m_id]') ) ) return; 	
		else{
			alert('수정불가\n'+ join.m_id.valid.desc );
			$('[name=m_id]').focus();
			return;
		}
	}
	
	//닉네임 중복확인을 한 경우 이미 사용중이라면 회원가입불가
	if( $('[name=m_nickname]').hasClass('chked') ){
		if( $('[name=m_nickname]').siblings('div').hasClass('invalid') ){
			alert('수정불가!\n' + join.m_nickname.unUsable.desc );
			$('[name=m_nickname]').focus();
			return;
		}
	}else{
	//아이디는 중복확인을 하지 않은 경우
		if( ! item_check( $('[name=m_nickname]') ) ) return; 	
		else{
			alert('수정불가\n'+ join.m_nickname.valid.desc );
			$('[name=m_nickname]').focus();
			return;
		}
	}
	
	
	if( ! item_check( $('[name=m_pw]') ) ) return; 
	if( ! item_check( $('[name=pw_check]') ) ) return; 

	$('form').submit();
}

function item_check( tag ){
	var data = join.tag_status( tag );
	if( data.code == 'valid' ) return true;
	else {
		alert( '수정불가!\n' + data.desc );
		tag.focus();
		return false;
	}
}

$('[name=m_id]').on('keyup', function(){
	if($(this).val() == fm_id){
		$(this).addClass('chked');
		$("#btn-id").css("display", "none");
	}else {
		$(this).removeClass('chked');
		$("#btn-id").css("display", "inline-block");
	}
});

$('[name=m_nickname]').on('keyup', function(){
	if($(this).val() == fm_nik){
		$(this).addClass('chked');
		$("#btn-nik").css("display", "none");
	}else {
		$(this).removeClass('chked');
		$("#btn-nik").css("display", "inline-block");
	}
});

$('#btn-id').on('click', function(){
	id_check();
});

function id_check(){
	var $m_id = $('[name=m_id]');
	if( $m_id.hasClass('chked') ) return;
		
	var data = join.tag_status( $m_id );
	if( data.code=='invalid' ){
		alert( '아이디 중복확인 불필요\n' +  data.desc );
		$m_id.focus();
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'id_check',
		data: { m_id:$m_id.val() },
		success: function(response){
			if( response ) response = join.m_id.usable;
			else  response = join.m_id.unUsable;
			display_status( response, $m_id.siblings('div') );
			$m_id.addClass('chked');
			
		},error: function(req, text){
			alert(text+':'+req.status);
		}
	});
	
}

$('#btn-nik').on('click', function(){
	nik_check();
});

function nik_check(){
	var $m_nickname = $('[name=m_nickname]');
	if( $m_nickname.hasClass('chked') ) return;
		
	var data = join.tag_status( $m_nickname );
	if( data.code=='invalid' ){
		alert( '닉네임 중복확인 불필요\n' +  data.desc );
		$m_nickname.focus();
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'nik_check',
		data: { m_nickname:$m_nickname.val() },
		success: function(response){
			if( response ) response = join.m_nickname.usable;
			else  response = join.m_nickname.unUsable;
			display_status( response, $m_nickname.siblings('div') );
			$m_nickname.addClass('chked');
			
		},error: function(req, text){
			alert(text+':'+req.status);
		}
	});
	
}

$('.chk').on('keyup', function(){ 
	if( $(this).attr('name')=='m_id' ||  $(this).attr('name')=='m_nickname'  ){
		if( event.keyCode==13 ){
			 if( $(this).attr('name')=='m_id'  ) id_check();
			 else nik_check();
		}else{
			$(this).removeClass('chked');
			validate( $(this) );
		}
	}else
		validate( $(this) );
});

function validate( t ){
	var data = join.tag_status(t);
	
	display_status(data, t.siblings('div'));
}

function display_status( data, div ){
	div.text( data.desc );
	div.removeClass();
	div.addClass( data.code );
}


function daum_post(){
	new daum.Postcode({
		oncomplete: function( data ){
			$('[name=m_post]').val( data.zonecode );
			//도로명주소R/지번주소J
			var address = data.userSelectedType == 'R' 
				? data.roadAddress : data.jibunAddress;
			if( data.buildingName!='' ) address += ' ('+data.buildingName+')';
			$('[name=m_addr1]').val( address );
			$('[name=m_addr2]').val('');
		}
	}).open();
}
</script>
</body>
</html>