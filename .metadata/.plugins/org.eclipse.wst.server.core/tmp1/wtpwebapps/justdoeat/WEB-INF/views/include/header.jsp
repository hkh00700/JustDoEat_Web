<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<header style='text-align:left; padding:15px 0; border-bottom:1px solid #ccc;'>
	<div class='category' style='margin-left:100px'>
	<ul>
		<li><a href='<c:url value="/"/>'><img src='imgs/whichfood.logo.png' alt='홈으로'/></a></li>
		<li><a href='list.cu' class='${category eq "cu" ? "active" : ""}'>음식추천</a></li> 
		<li><a href='list.no' class='${category eq "no" ? "active" : ""}'>공지사항</a></li> 
		<li><a href='list.bo' class='${category eq "bo" ? "active" : ""}'>밥친구들의 대화</a></li> 
		<li><a href='list.da' class='${category eq "da" ? "active" : ""}'>찾아가는길</a></li> 
	</ul>
	</div>
	<div style='margin-right:100px; position:absolute; right:0; top:25px;'>
	<ul>
		<c:if test="${empty loginInfo}">
		<li><a class='btn-fill' href='login'>로그인</a></li>
		<li><a class='btn-fill' href='member'>회원가입</a></li>
		</c:if>
		<c:if test="${!empty loginInfo}">
		<li style='padding-right:10px'><strong>${loginInfo.m_nikname}</strong> 님</li>
		<li><a class='btn-fill' href='logout'>로그아웃</a></li>
		</c:if>
	</ul>
	</div>
</header> 
<style>
header ul, header ul li { margin:0; padding:0; display:inline; }
header .category { font-size:18px; }
header .category li:not(:first-child) { padding-left:30px }
header .category li a:hover, header .category li a.active 
{ font-weight:bold; color:#0000cd; }
</style>   


