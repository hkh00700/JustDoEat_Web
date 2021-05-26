<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<header style='text-align:left; padding:15px 0; height:204px; border-bottom:1px solid #ccc; align-self: center;'>
	
	<div class='log' style='margin-right:100px; position:absolute; left:50%; top:25px; width: 1200px; transform:translateX(-50%);'>
		<ul>
			<c:if test="${empty loginInfo}">
			<li><a href='login'>로그인</a></li>
			<li><a href='memberjoin'>회원가입</a></li>
			</c:if>
			<c:if test="${!empty loginInfo}">
			<li style='padding-right:10px'><strong>${loginInfo.m_nickname}</strong> 님</li>
			<li><a class='btn-fill' href='logout'>로그아웃</a></li>
			</c:if>
		</ul>
	</div>

	<div class='category' style='width:1200px; position: absolute;left: 50%; transform:translateX(-50%);'>
		<ul>
			<li><a href='<c:url value="/"/>' id='job'><img src='imgs/bi.png' alt='홈으로'/></a></li>
			<li><a href='<c:url value="/"/>' class='${category eq "cu" ? "active" : ""}'>홈</a></li> 
			<li><a href='list.ga' class='${category eq "ga" ? "active" : ""}'>게임</a></li>

			<li><a href='map' class='${category eq "ma" ? "active" : ""}'>지도</a></li>
			<c:set var="admin" value="${loginInfo.admin }"/>
			<c:choose>
				<c:when test="${admin eq 'Y' }">
					<li><a href='list.ad'>관리자페이지</a></li>
				</c:when>
				<c:otherwise>
					<c:if test="${empty loginInfo}">
						<li><a href='login'>마이페이지</a></li>
					</c:if>
					<c:if test="${!empty loginInfo }">
						<li><a href='mypage'
							class='${category eq "my" ? "active" : ""}'>마이페이지</a></li>
					</c:if>
				</c:otherwise>
			</c:choose>

			<li><a href='list.bo' class='${category eq "bo" ? "active" : ""}'>게시판</a></li> 

						
		</ul>
	</div>
</header> 
<style>
.log{
width: 90%;
background-color: navy;
height: 40px;
color: white;

}
.log ul li a{
margin: 10px 50px 50px 10px;
float:right;
color: white;
}

.category{
width:90%;
margin-top:50px;
float: left;
right:150px;
height: 160px;
line-height: 160px;
}


header ul, header ul li { margin:0; padding:0; display:inline; }
header .category { font-size:18px; }
header .category ul li:first-child{ margin-right: 470px }
header .category li:not(:first-child) { padding-left:30px }
header .category li a {
height: 50px;
font-size: 20px;
border-radius: 25px;
padding: 10px;
}

header .category li a:hover, header .category li a.active
{ font-weight:bold; color: #ffffff; background-color: #ef5b5b;}
#job:hover {
background-color: #ffffff;
}

</style>   



