<%@page import="game.RandomDTO"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<% pageContext.setAttribute("\r\n", "<br>"); %>
<%
int i = 1;
String resultA = "null";
String resultB = "null";
String resultC = "null";
String resultD = "null";
String resultE = "null";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  
.content{
margin: 0 auto;
position:relative;
width:1200px;
height: 710px;
text-align: center;
font-size: 20px;
}
h3{
position:absolute;
margin-top:100px;
margin-left: 50px;

}

.menu{
width:800px;
height: 200px;

}

.content img{

 width: 425.8px;
  height: 425.8px;
  position:relative;
  top:27px;
  margin-left: -200px;
   
}
 

h2{
width:307px;
height:40px;
margin-left:760px;
margin-top:30px;
color: navy;
}
 .content2{
margin-top: -436px;
} 

.content2 a:first-of-type{
width: 314px;
height: 100px;
margin: 40px 23px 38px 30px; 
padding: 5px 95px 5px 95px; 
border-radius: 60px;
box-shadow: 5px 20px 15px 0 rgba(0, 0, 0, 0.38);
text-align: center;
font-size: 30px;
position: relative;
left: 220px;
color: white;
background-color: #ef5b5b;
line-height: 80px;
cursor: pointer;
}

.content2 img{
 position: absolute; 
 
}

.content2with{

position: relative;
margin-left: 160px;

} 
#restart img{
cursor:pointer;
width: 65px;
height: 65px;
display:none;
 margin-left: 120px;
 margin-top: -10px;


}
.notice{ 
 display:inline-block;
 white-space : pre-line; 
 margin-top: 210px;
 }
 
.content ul{
margin-left:-250px;
position:relative;
overflow: hidden;
width: 1100px;
height: 300px;

}

.content li{
 position:absolute;
	list-style: none;
	display: inline-block;
	float: left;
 }
 
.content li:first-of-type {
margin-top: 100px;
margin-left: 30px;
color: #E91E63;

}
.content li:nth-of-type(2){
margin-top: 60px;
margin-left: 100px;
color: #9C27B0;
}
.content li:nth-of-type(3){
margin-top: 120px;
margin-left: 180px;
color: #FF6600;
}
.content li:nth-of-type(4){
margin-top: 30px;
margin-left: 230px;
color: #4CAF50;
}
.content li:nth-of-type(5){
margin-top: 80px;
margin-left: 320px;
color: #3F51B5;
}


</style>
</head>
<body>
<div class="content">

<img style="position:absolute; top: 50px; margin-left:-165px; width: 60px; height: 60px; z-index: 1;" class="f" src='imgs/fruit1.png' alt="f1" id="f1" />
<img style="position:absolute; top: 50px; margin-left:-90px; width: 60px; height: 60px; z-index: 1;" class="f" src='imgs/fruit2.png' alt="f2" id="f2"/>
<img style="position:absolute; top: 50px; margin-left:-15px; width: 60px; height: 60px; z-index: 1;" class="f" src='imgs/fruit3.png' alt="f3" id="f3"/>
<img style="position:absolute; top: 50px; margin-left:60px; width: 60px; height: 60px; z-index: 1;" class="f" src='imgs/fruit4.png' alt="f4" id="f4"/>
<img style="position:absolute; top: 50px; margin-left:135px; width: 60px; height: 60px; z-index: 1;" class="f" src='imgs/fruit5.png' alt="f5" id="f5"/>
<img style="top: 80px; " class="ladder" src='imgs/ladder.png' alt="사다리" id="ladder"/>
<h5 style="position:absolute; margin-top: -365px; margin-left: 1000px;"><a href="./list.ga">룰렛 게임하기</a></h5>
   <h3>추천 메뉴 리스트</h3>
   <div class="menu">
   <table>
     <ul style="">
    	<c:forEach items="${edtos }" var="vo">
          <li class="left" style="width: 500px; height: 50px; vertical-align : bottom;">0<%=i %>. ${vo.food }</li>
          <%if(i==1){%>
          <input id="resultA" type="hidden" value="${vo.food }" />
          <%}else if(i==2){%>
          <input id="resultB" type="hidden" value="${vo.food }" />          
          <%}else if(i==3){%>
          <input id="resultC" type="hidden" value="${vo.food }" />          
         <% }else if(i==4){%>
          <input id="resultD" type="hidden" value="${vo.food }" />          
          <%}else if(i==5){%>
          <input id="resultE" type="hidden" value="${vo.food }" />          
          <%}%>
          <%i++;%>       
   		</c:forEach>
   	</ul> 
   </table>
   
   </div>
   <div class="content2">
	 <h2>오늘의 메뉴</h2>
	  <div class="content2with">
	    <a id="trigger" onclick="random()" >▶ START<a id="restart" class="restart" onclick="random()"><img alt="재시작" src="imgs/reset.png"></a></a>
	  </div>  
	    <br/><br/><h4 class='notice'>ⓘ START버튼을 누르시면 게임이 시작됩니다.</h4>
   </div>
</div>
<script type="text/javascript">
var result= null;
var openW = 0;
element = document.getElementById("trigger");
element_ladder = document.getElementById("ladder");

$("#restart").click(function(){
	random();
	$("#ladder").removeClass("ladder");
	$("#ladder").addClass("ladder");
	
		
		/* setTimeout(() => {
			 document.getElementById("ladder").src = "imgs/ladder.png"
			$('#trigger').text("추천음식"); 
			$('#ladder').css('filter','blur(7px)');
		}, 1000);
		setTimeout(() => {
			$('#ladder').css('filter','blur(0px)');
		}, 2000);	 */
});

/* var openNewWindow = window.open("about:blank");
_.once() = function(func){
	var flag, result;
	return function(){
  		 if(openNewWindow){ return result};
  		flag = true;
  		return result = func.apply(this. argument);
	 }
}
var ch = _.once(function(){ openNewWindow.location.href="https://map.naver.com/v5/search/광주서구 "+ result;  +"?c=14125237.9868284,4181827.5195079,15,0,0,0,dh"	})
 */

function random() {
	var rand1 = Math.round(Math.random()*5);
	console.log(rand1);

		 
	setTimeout(() => {
		$('#trigger').text("추천음식"); 
		 document.getElementById("ladder").src = "imgs/ladder.png"
		$('#ladder').css('filter','blur(7px)');
		 
	}, 0);
	setTimeout(() => {
		$('#ladder').css('filter','blur(0px)');
	}, 2000);
	
	
	
	
	setTimeout(() => {
	        if(rand1==0){
	        	document.getElementById("ladder").src = "imgs/ladder1.png"
	            $('#trigger').text(document.getElementById("resultA").value);
	            result = document.getElementById("resultA").value;
	        	$(".content li:nth-of-type(1)").css("font-size","25px");
	        	$(".content li:not(:nth-of-type(1))").css("font-size","20px");
	        	
	          }else if(rand1==1){
	        	  document.getElementById("ladder").src = "imgs/ladder2.png"
	             $('#trigger').text(document.getElementById("resultB").value); 
	             result =document.getElementById("resultB").value;
	             $(".content li:nth-of-type(2)").css("font-size","25px");
	             $(".content li:not(:nth-of-type(2))").css("font-size","20px");
	          }else if(rand1==2){
	        	  document.getElementById("ladder").src = "imgs/ladder3.png"
	             $('#trigger').text(document.getElementById("resultC").value); 
	             result =document.getElementById("resultC").value;
	             $(".content li:nth-of-type(3)").css("font-size","25px");
	             $(".content li:not(:nth-of-type(3))").css("font-size","20px");
	          }else if(rand1==3){
	        	  document.getElementById("ladder").src = "imgs/ladder4.png"
	             $('#trigger').text(document.getElementById("resultD").value); 
	             result =document.getElementById("resultD").value;
	             $(".content li:nth-of-type(4)").css("font-size","25px");
	             $(".content li:not(:nth-of-type(4))").css("font-size","20px");
	          }else if(rand1==4){
	        	  document.getElementById("ladder").src = "imgs/ladder5.png"
	             $('#trigger').text(document.getElementById("resultE").value); 
	             result = document.getElementById("resultE").value;
	             $(".content li:nth-of-type(5)").css("font-size","25px");
	             $(".content li:not(:nth-of-type(5))").css("font-size","20px");
	          }   
	   }, 2000);
}

	
     $('#trigger').click(function(){
    	 
    	/*  $('.restart').css("display", "block"); */
   	  	  $('#trigger').click(function(){
   	  	 var openNewWindow = window.open("about:blank");
		  	openNewWindow.location.href="https://map.naver.com/v5/search/광주서구 "+ result;  +"?c=14125237.9868284,4181827.5195079,15,0,0,0,dh" 
   	 	  //	ch();
   	  	  
   	  	  });
			$('.restart>img').css("display","inline-block");
			$('#trigger').text("추천음식");
		 var text = 'ⓘ 추천된 오늘의 메뉴를 누르시면 주변 음식점을 안내해 드립니다.<br/> ⓘ 재실행 버튼을 누르시면 사다리타기가 다시 진행됩니다.<br/>';
		no_result = text.replace(/(<br>|\<br\/>|<br \/>)/g, '\r\n');
		$('.notice').text(no_result);
   	});
 
     $('.f').click(function(){
 		setTimeout(() => {
 			 document.getElementById("ladder").src = "imgs/ladder.png"
 			$('#trigger').text("추천음식"); 
 			$('.restart>img').css("display","inline-block");
 			 var text = 'ⓘ 추천된 오늘의 메뉴를 누르시면 주변 음식점을 안내해 드립니다.<br/> ⓘ 재실행 버튼을 누르시면 사다리타기가 다시 진행됩니다.<br/>';
 			no_result = text.replace(/(<br>|\<br\/>|<br \/>)/g, '\r\n');
 			$('.notice').text(no_result);
 			$('#ladder').css('filter','blur(7px)');
 		}, 0);
 		setTimeout(() => {
 			$('#ladder').css('filter','blur(0px)');
 		}, 2000);
 		
 			
 		 $('#trigger').click(function(){
 	   	  	 
 			$('.restart>img').css("display","inline-block");
 			if(openW==0){
	 			 var openNewWindow = window.open("about:blank");
	 	   	  	 //새탭띄우기 중복오류 고쳐보자~~
	 			  	 openNewWindow.location.href="https://map.naver.com/v5/search/광주서구 "+ result;  +"?c=14125237.9868284,4181827.5195079,15,0,0,0,dh" 
 			}else{
 				openW++;
 			}
	 	 }); 
 			
 			//	$('#trigger').text("추천음식");
 		
 		
 		
 	});



	$('#f1').click(function(){
		random();
		 setTimeout(() => {
			  document.getElementById("ladder").src = "imgs/ladder3.png"
		      $('#trigger').text(document.getElementById("resultC").value); 
		      result =document.getElementById("resultC").value;
		      $(".content li:nth-of-type(3)").css("font-size","25px");
		      $(".content li:not(:nth-of-type(3))").css("font-size","20px");
            
  		}, 2000);

	}); 
	$('#f2').click(function(){
		random();
		 setTimeout(() => {
			  document.getElementById("ladder").src = "imgs/ladder1.png"
		      $('#trigger').text(document.getElementById("resultA").value); 
		      result =document.getElementById("resultA").value;
		      $(".content li:nth-of-type(1)").css("font-size","25px");
		      $(".content li:not(:nth-of-type(1))").css("font-size","20px");
            
  		}, 2000);

	});
	$('#f3').click(function(){
		random();
		 setTimeout(() => {
			  document.getElementById("ladder").src = "imgs/ladder2.png"
		      $('#trigger').text(document.getElementById("resultB").value); 
		      result =document.getElementById("resultB").value;
		      $(".content li:nth-of-type(2)").css("font-size","25px");
		      $(".content li:not(:nth-of-type(2))").css("font-size","20px");
            
  		}, 2000);

	}); 
	$('#f4').click(function(){
		
		setTimeout(() => {
			  document.getElementById("ladder").src = "imgs/ladder5.png"
		      $('#trigger').text(document.getElementById("resultE").value); 
		      result =document.getElementById("resultE").value;
		      $(".content li:nth-of-type(5)").css("font-size","25px");
		      $(".content li:not(:nth-of-type(5))").css("font-size","20px");
            
  		}, 2000);

	}); 
	$('#f5').click(function(){
		random();
		 setTimeout(() => {
			  document.getElementById("ladder").src = "imgs/ladder4.png"
		      $('#trigger').text(document.getElementById("resultD").value); 
		      result =document.getElementById("resultD").value;
		      $(".content li:nth-of-type(4)").css("font-size","25px");
		      $(".content li:not(:nth-of-type(4))").css("font-size","20px");
            
  		}, 2000);

	}); 
	


</script>   

</body>
</html>