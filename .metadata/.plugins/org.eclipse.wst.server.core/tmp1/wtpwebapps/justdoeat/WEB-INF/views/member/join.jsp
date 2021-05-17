<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input[name=addr] { width:calc(100% - 14px); }
	.valid, .invalid { font-size:13px; font-weight:bold; }
	.valid { color:green }
	.invalid { color:red }
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" 
src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	var today = new Date();
	var endDay = new Date( today.getFullYear()-13, today.getMonth(), today.getDate()-1 );
	
	$('[name=birth]').datepicker({
	  maxDate : endDay
	  , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	  , showMonthAfterYear: true 
	  , changeYear: true
	  , changeMonth: true
	  , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월'
		  			, '7월', '8월', '9월', '10월', '11월', '12월']
	  , dateFormat: 'yy-mm-dd'
	  //, beforeShowDay: after
	});
});
function after(date){
	if( date > new Date() ) return [false];
	else                    return [true];
}
</script>
</head>
<body>
<h3>회원가입</h3>

<p class='wpct40 right' 
style='margin:0 auto; padding-bottom:5px; font-size:13px' >*는 필수입력항목입니다</p>
<form method="post" action="join">
<table class='wpct40'>
	<tr><th class='wpx120'>* 성명</th>
		<td class='left'><input type='text' name='name' /></td>
	</tr>
	<tr><th>* 아이디</th>
		<td class='left'><input type='text' name='id' class='chk' /><a class='btn-fill-s' id='btn-id'>중복확인</a><br>
			<div class='valid'>아이디를 입력하세요(영문소문자,숫자만 입력가능)</div>
		</td>
	</tr>
	<tr><th>* 비밀번호</th>
		<td class='left'><input type='password' name='pw' class='chk' /><br>
			<div class='valid'>비밀번호를 입력하세요(영문 대/소문자,숫자를 모두 포함)</div>
		</td>
	</tr>
	<tr><th>* 비밀번호확인</th>
		<td class='left'><input type='password' name='pw_check' class='chk' /><br>
			<div class='valid'>비밀번호를 다시 입력하세요</div>
		</td>
	</tr>
	<tr><th>* 성별</th>
		<td class='left'><label><input type='radio' name='gender' value='남' />남</label>
			<label><input type='radio' name='gender' value='여' checked />여</label>
		</td>
	</tr>
	<tr><th>* 이메일</th>
		<td class='left'><input type='text' name='email' class='chk' /><br>
			<div class='valid'>이메일을 입력하세요</div>
		</td>
	</tr>
	<tr><th>생년월일</th>
		<td class='left'><input type='text' name='birth' readonly />
			<span style='color:red; position:relative; right:25px; display:none' id='delete'><i class="fas fa-times"></i></span></td>
	</tr>
	<tr><th>전화번호</th>
		<td class='left'><input class='wpx40' type='text' name='tel' maxlength="3" />
			- <input class='wpx40' type='text' name='tel' maxlength="4" />
			- <input class='wpx40' type='text' name='tel' maxlength="4" />
		</td>
	</tr>
	<tr><th>주소</th>
		<td class='left'><a class='btn-fill-s' onclick='daum_post()'>우편번호찾기</a>
			<input type='text' name='post' class='wpx60' readonly /><br>
			<input type='text' name='addr' readonly />
			<input type='text' name='addr' />
		</td>
	</tr>
	
</table>
</form>
<div class='btnSet'>
<a class='btn-fill' onclick='go_join()'>회원가입</a>
<a class='btn-empty' href='javascript:history.go(-1)'>취소</a>
<!-- <a class='btn-empty' onclick='history.go(-1)'>취소</a> -->
</div>

<script type="text/javascript" 
	src="js/join_check.js?v=<%=new java.util.Date().getTime()%>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function go_join(){
	if( $('[name=name]').val()=='' ){
		alert('성명을 입력하세요!');
		$('[name=name]').focus();
		return;	
	}
	
	//아이디는 중복확인을 한 경우 이미 사용중이라면 회원가입불가
	if( $('[name=id]').hasClass('chked') ){
		if( $('[name=id]').siblings('div').hasClass('invalid') ){
			alert('회원가입 불가!\n' + join.id.unUsable.desc );
			$('[name=id]').focus();
			return;
		}
	}else{
	//아이디는 중복확인을 하지 않은 경우
		if( ! item_check( $('[name=id]') ) ) return; 	
		else{
			alert('회원가입 불가\n'+ join.id.valid.desc );
			$('[name=id]').focus();
			return;
		}
	}
	
	
	if( ! item_check( $('[name=pw]') ) ) return; 
	if( ! item_check( $('[name=pw_check]') ) ) return; 
	if( ! item_check( $('[name=email]') ) ) return; 

	$('form').submit();
}
function item_check( tag ){
	var data = join.tag_status( tag );
	if( data.code == 'valid' ) return true;
	else {
		alert( '회원가입 불가!\n' + data.desc );
		tag.focus();
		return false;
	}
}



$('#btn-id').on('click', function(){
	id_check();
});
function id_check(){
	var $id = $('[name=id]');
	if( $id.hasClass('chked') ) return;
		
	var data = join.tag_status( $id  );
	if( data.code=='invalid' ){
		alert( '아이디 중복확인 불필요\n' +  data.desc );
		$id.focus();
		return ;
	}
	
	$.ajax({
		type: 'post',
		url: 'id_check',
		data: { id:$id.val() },
		success: function(response){
			if( response ) response = join.id.usable;
			else  response = join.id.unUsable;
			display_status( response, $id.siblings('div') );
			$id.addClass('chked');
			
		},error: function(req, text){
			alert(text+':'+req.status);
		}
	});
	
}

$('.chk').on('keyup', function(){
	if( $(this).attr('name')=='id' ){
		if( event.keyCode==13 ){
			id_check();
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

$('[name=birth]').change(function(){
	$('#delete').css('display', 'inline-block');
});
$('#delete').click(function(){
	$('[name=birth]').val('');
	$('#delete').css('display', 'none');
});

function daum_post(){
	new daum.Postcode({
		oncomplete: function( data ){
			$('[name=post]').val( data.zonecode );
			//도로명주소R/지번주소J
			var address = data.userSelectedType == 'R' 
				? data.roadAddress : data.jibunAddress;
			if( data.buildingName!='' ) address += ' ('+data.buildingName+')';
			$('[name=addr]').eq(0).val( address );
			$('[name=addr]:eq(1)').val('');
		}
	}).open();
}
</script>
</body>
</html>