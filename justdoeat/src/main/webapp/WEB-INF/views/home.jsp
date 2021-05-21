<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<style type="text/css">
.content {
height: 700px;
}

h1{
height: 230px;
line-height: 230px;
color: navy;
}
.content a:first-of-type{
width: 650px;
height: 120px;
margin: 40px 23px 42px 30px; 
padding: 15px 150px 15px 150px;
border-radius: 60px;
box-shadow: 5px 20px 15px 0 rgba(0, 0, 0, 0.38);
border: solid 3px #00458a;
text-align: center;
font-size: 45px;
position: relative;
left: 140px;
color: #ef5b5b;
}
.select{
 width: 100px;
  height: 100px;
  margin: 40px 157px 42px 23px;
  padding: 41px 35px 44px;
  box-shadow: 5px 20px 15px 0 rgba(0, 0, 0, 0.16);
  background-color: #ef5b5b;
  border-radius: 50%;
  font-size: 30px;
  color: white;
}
.content img{
position: relative;
top:5px;

}

</style>
</head>
<body>
	<div class="content">
		<h1>오늘의 메뉴</h1>
		<a>'추천메뉴'</a><img src='imgs/reset.png' alt="다시추천"/><a class='select'>선택</a>
		<br/><br/><br/><br/>
		선택 버튼을 누르시면 자세한 오늘의 메뉴 정보를 확인하실 수 있습니다.<br/>
		<다시추천> 을 누르시면 자세한 오늘의 메뉴를 다시 추천 받으실 수 있습니다.
		
	</div>
</body>
</html>

