<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<style>
	.category{
		width: 1200px;
		position: relative;
		left: 50%;
		transform:translateX(-50%);
	}
</style>
<header style='text-align:left; align-self: center; position: relative;'>
   <div class='category'>
	  <div class="gam"> 
	    <div class='log'>
	      <ul class="ya yb">
	         <c:if test="${empty loginInfo}">
	         <li><a href='login'>로그인</a></li>
	         <li><a href='memberjoin'>회원가입</a></li>
	         </c:if>
	         <c:if test="${!empty loginInfo}">
	         <li class="user" ><strong>${loginInfo.m_nickname}</strong> 님</li>
	         <li><a class='btn-fill' href='logout'>로그아웃</a></li>
	         </c:if>
	      </ul>
	   </div>
	  
      <ul class="ya">
         <li id="img"><a href='<c:url value="/"/>' id='job'><img src='imgs/bi.png' alt='홈으로'/></a></li>
         <li><a href='<c:url value="/"/>' class='${category eq "" ? "active" : ""}'>홈</a></li> 
         <li><a href='list.ga' class='${category eq "ga" ? "active" : ""}'>게임</a></li>
         <li><a href='map' class='${category eq "ma" ? "active" : ""}'>지도</a></li>
         <c:set var="admin" value="${loginInfo.admin }"/>
         <c:choose>
            <c:when test="${admin eq 'Y' }">
               <li><a href='list.ad' class='${category eq "ad" ? "active" : ""}'>관리자페이지</a></li>
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
   
   </div>

</header> 
<style>

*{margin: 0;}

.category{
	width:100%;
	text-align:center;
	right:150px;
}
ul{
	margin-bottom: 20px;
}
.user{
	display: inline-block;
}

.ya li{
	display: inline-block;
}
.ya li a{
	padding-left: 30px;
}

.yb{
	text-align: left;
}
.gam{
	width:1200px;
	display: inline-block;
	text-align:right;
	font-size: 18px;
	margin-top: 10px;
}


#img{
	margin-right: 600px;
}

.log{
	display: inline-block;
	font-size: 12px;
}


</style>   


