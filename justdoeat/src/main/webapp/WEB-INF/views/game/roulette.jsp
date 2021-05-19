<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
int i = 1;
int max = 360;
String result= null;
int random =(int)(Math.random()*max);
float fromAngle = random+2160;
request.setAttribute("random", random);
request.setAttribute("fromAngle", fromAngle);


%>


<!--  
float angle = 0.0f;
int i = 1;
int max = 360;
int random =(int)(Math.random()*max);
float fromAngle = random+2160+angle;
request.setAttribute("random", random);
request.setAttribute("fromAngle", fromAngle);
 --> 


<%-- 	     <%=fromAngle%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





<style type="text/css">
	@keyframes rotation {
/* 		int random = getRandom(360); */
/* 		float fromAngle = random+720+angle; */
	    
	   from {
	     transform: rotate(0deg);
	   }
	   to {
	     transform: rotate(${fromAngle}deg);

	   }
	 }

  
.roulette.loop {
  animation: rotation 5s ease-in-out forwards;
}

.content{
position:relative;
height: 720px;
text-align: center;
font-size: 20px;
}
h3{
position:absolute;
margin-top:-350px;
margin-left: 600px;
right: 600px;

}
.num{
position:absolute;
margin-left: 1080px;
margin-top:-300px;

}
.menu{
position:absolute;
margin-left: 1043px;
margin-top:-323px;
}

.content img{

 width: 425.8px;
  height: 425.8px;
  position:relative;
  top:70px;
  left: -600px;
  
}

#pin{
z-index:1;
position:relative;
left:-157px;
top:74px;
margin-top:100px;
width: 35px;
height: 36px;
margin: 0 194.9px 409.2px 195.9px;
padding: 9px 8px 8px;
}
h2{
margin-left:550px;
margin-top:-30px;
color: blue;

}
.content2 a:first-of-type{
width: 580px;
height: 100px;
margin: 40px 23px 38px 30px; 
padding: 5px 95px 5px 95px;
border-radius: 60px;
box-shadow: 5px 20px 15px 0 rgba(0, 0, 0, 0.38);
border: solid 3px #00458a;
text-align: center;
font-size: 45px;
position: relative;
left: 290px;
color: orange;
}

.content2 img{
position: absolute;
top:-100px;
}
.roulette{
	 transform: rotate(0deg);
	 animation: rotation 4s ease-in-out forwards;
}

</style>
</head>
<body>
<div class="content">
<img src='imgs/pin.png'alt="룰렛" id="pin"/>
<img src='imgs/roulette.png' alt="룰렛" id="roulette" style="top: 80px; left: -592px;"/>
	<h3>직접 메뉴 등록</h3>
	<div class="menu">
	<table>
	 <c:forEach items="${edtos }" var="vo">
		 <tr>
		 	<td class="left" style="border-bottom: 1px solid #000; width: 400px; height: 50px; vertical-align : bottom;">0<%=i %>. ${vo.food }</td></tr>
		 	 
		 	<%i++; %>  
	</c:forEach> 
	</table>
	</div>
	<div class="content2">
	<h2>오늘의 메뉴</h2>
	<a id="trigger" onclick="random()">▶ START</a><a><img class='restart' alt="다시추천"/></a>
	<br/><br/><br/><h4>ⓘ START버튼을 누르시면 게임이 시작됩니다.</h4>
	</div>
</div>
<script type="text/javascript">
$(function(){


	
})
element = document.getElementById("trigger");
element_roulette = document.getElementById("roulette");
function random( data ) {

	  element_roulette.classList.remove("roulette");
	  element_roulette.classList.add("roulette"); 
	  $('#trigger').text("추천음식");
	  setTimeout(() => {
		  if((${fromAngle}>=2486 && ${fromAngle}<=2520) || (${fromAngle}>=2160 && ${fromAngle}<=2196)){
				 //Thread.sleep(4000);
				$('#trigger').text(data);
			 }else if(${fromAngle}>=2414 && ${fromAngle}<=2485){
				// Thread.sleep(4000);
				 $('#trigger').text(data); 
			 }else if(${fromAngle}>=2342 && ${fromAngle}<=2413){
				// Thread.sleep(4000);
				 $('#trigger').text(data); 
			 }else if(${fromAngle}>=2270 && ${fromAngle}<=2341){
				// Thread.sleep(4000);
				 $('#trigger').text(data); 
			 }else if(${fromAngle}>=2197 && ${fromAngle}<=2269){
				 //Thread.sleep(4000);
				 $('#trigger').text(data); 
			 }	
	}, 4000);
}


//public static void delay() { int delay = 1000; try { Thread.sleep(delay); } catch (InterruptedException e) { throw new RuntimeException(e); } }

	









// @keyframes rotation {
// 	/* 		int random = getRandom(360); */
// 	/* 		float fromAngle = random+720+angle; */
		    
// 		   from {
// 		     transform: rotate(0deg);
// 		   }
// 		   to {
// 		     transform: rotate(3250deg);
// 		   }
// 		 }
// const roulette = document.querySelector(".roulette");
// const trigger = document.querySelector(".trigger");
// trigger.addEventListener("click", onClickTrigger);

// function onClickTrigger(e) {
//   roulette.classList.add("loop");
// }

// float rnd = Random.Range(0.0f, 0.5f);

// this.transform.rotation = Quaternion.Euler(and, 0.0f, 0.0f);

// Math.floor(Math.rand()*100)


// $('.trigger').click function {
// 	@keyframes rotation {
// 		int random = getRandom(360);
// 		float fromAngle = random+720+angle;

// 	   from {
// 	     transform: rotate(0deg);
// 	   }
// 	   to {
// 	     transform: rotate(720 deg);
// 	   }
// 	 }
// 	});
</script>	
</body>
</html>