<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	position:absolute; left:50%; top:50%;
	width:400px; height:500px;
	margin-left:-200px; margin-top:-250px;
}
#login { 
	width:100%; height:calc(100% - 190px); 
	padding:50px 0;   border: none;
}
#userid, #userpw { 
	width:48%; height:25px; 
	padding:5px 10%; margin-bottom:10px; }
.btn-fill {
	display:block; margin:auto; width:63.5%; height:42px; 
	line-height:42px; box-shadow:none !important; 
}	
.social { width:70%; height:50px; padding-bottom:10px; }

input{
border:none;
border-bottom: 3px solid #eb9700;
}

#btnlogin{
 background-color: #ef5b5b;
 color: white;
}

a{
border-radius: 20px;
}

</style>
</head>
<body>
<div class='container'>
	<div style="height:80px">
		<a href='<c:url value="/"/>'><img src='imgs/logo.png'/></a>
	</div>

	<div id='login'>
		<input type='text' id='userid' placeholder="아이디" />
		<input type='password' id='userpw' placeholder="비밀번호"
		    onkeypress="if( event.keyCode==13 ){ go_login() }" />
		<a class='btn-fill' onclick="go_login()" id="btnlogin">로그인</a>
		<h4 style='width:69%; margin:25px auto;'>간편로그인</h4>
		
		<a href='kakaoLogin'><img class='social' src='imgs/kakao_login.png' /></a>
		<a href='naverLogin'><img class='social' src='imgs/naver_login.png' /></a>
		
	</div>
</div>
<script type="text/javascript">
function go_login(){
	if( $('#userid').val()=='' ){
		alert('아이디를 입력하세요!');
		$('#userid').focus();
		return;
	}else if( $('#userpw').val()=='' ){
		alert('비밀번호를 입력하세요!');
		$('#userpw').focus();
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'eatLogin',
		data: { m_id:$('#userid').val(), m_pw:$('#userpw').val() },
		success: function( response ){
			if( response ){
				//목록인 경우는 목록에 있고, 목록이 아닌 경우는 홈으로
				location.href = document.referrer.match(/list/g) 
					? document.referrer : '<c:url value="/"/>';
				
			}else{
				alert('아이디나 비밀번호가 일치하지 않습니다!');
			}
		},error: function(req, text){
			alert(text+':'+req.status);
		}
	});
}
</script>
</body>
</html>





