<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 
 .ad_category {
/*  	margin: 0 auto;
 	width: 1080px;
 */ 	
 	
 	overflow: hidden;
 	width: 1200px;
	margin:0;
	margin-right:20px;
	position: absolute;
	left: 50%; 
	transform:translateX(-50%);
 }
 
 .ad_category ul {
 	float: right;
 }
 
 .ad_category ul li {
 	display: inline-block;
 	
 }
 
 .ad_category ul li a {
 	margin-left: 20px;
 }
 
 
 .ad_category ul li a:hover {
 	color: #040c50;
 	font-weight: bold;
 }
 
 .ad_category ul li a.active {
 	color: #040c50;
 	font-weight: bold;
 } 

</style>
</head>
<body>
<div class='ad_category' >
<ul>
	<li><a href='member.ad' class='${ad_category eq "member" ? "active" : "" }'>회원정보 </a></li>
	<li><a href='store.ad' class='${ad_category eq "store" ? "active" : "" }'>가게정보 </a></li>
	<li><a href='allergy.ad' class='${ad_category eq "allergy" ? "active" : "" }'>알레르기 수정 </a></li>
	<li><a href='notice.ad' class='${ad_category eq "notice" ? "active" : ""}'>공지글</a></li>
</ul>

</div>
</body>
</html>