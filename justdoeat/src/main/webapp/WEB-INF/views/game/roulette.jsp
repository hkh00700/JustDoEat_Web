<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
int i = 1;
int max = 360;
String resultA = "null";
String resultB = "null";
String resultC = "null";
String resultD = "null";
String resultE = "null";

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


<%--         <%=fromAngle%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





<style type="text/css">
   @keyframes rotation {
/*       int random = getRandom(360); */
/*       float fromAngle = random+720+angle; */
       
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
margin: 0 auto;
position:relative;
width:1200px;
height: 730px;
text-align: center;
font-size: 20px;
}
h3{
position:absolute;
margin-top:-350px;
margin-left: 751px;
}

.menu{
width:314px;
margin-left: 667px;
margin-top:-323px;
}

.content img{

 width: 425.8px;
  height: 425.8px;
  position:relative;
  top:127px;
  margin-left: 163px;
  
}
 

#pin{
z-index:1;
left:10px;
top:74px;
margin-top:100px;
margin-left:263px;
width: 35px;
height: 36px;
margin: 0 194.9px 409.2px 195.9px;
padding: 9px 8px 8px;
}
h2{
width:307px;
height:26px;
margin-left:670px;
margin-top:30px;
color: navy;
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
}

.content2 img{
position: absolute;
top:-100px;
}
.roulette{
    transform: rotate(0deg);
    animation: rotation 4s ease-in-out forwards;
}

.restart img{
position:absolute;
top:506px;
width: 65px;
height: 65px;
right: 155px;
 display:none;
}


</style>
</head>
<body>
<div class="content">
<img src='imgs/pin.png'alt="룰렛핀" id="pin"/>
<img src='imgs/roulette.png' alt="룰렛" id="roulette" style="top: 80px; left: -592px;"/>
   <h3>추천 메뉴 리스트</h3>
   <div class="menu">
   <table>
    <c:forEach items="${edtos }" var="vo">
       <tr>
          <td class="left" style="border-bottom: 1px solid #000; width: 400px; height: 50px; vertical-align : bottom;">0<%=i %>. ${vo.food }</td></tr>
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
   </table>
   </div>
   <div class="content2">
   <h2>오늘의 메뉴</h2>
   <a id="trigger" onclick="random()" >▶ START</a>
   <br/><br/><br/><h4 class='notice'>ⓘ START버튼을 누르시면 게임이 시작됩니다.</h4>
   <a class="restart" onclick="random()"><img alt="재시작" src="imgs/reset.png"></a>
   </div>
</div>
<script type="text/javascript">

/* for(var i = 0; i < result.length; i++){
    console.log(result[i]);
} */

var result= null;

element = document.getElementById("trigger");
element_roulette = document.getElementById("roulette");
function random() {
     element_roulette.classList.remove("roulette");
     element_roulette.classList.add("roulette"); 
     $('#trigger').text("추천음식");
     setTimeout(() => {
        if((${fromAngle}>=2486 && ${fromAngle}<=2520) || (${fromAngle}>=2160 && ${fromAngle}<=2196)){
            $('#trigger').text(document.getElementById("resultA").value);
            result = document.getElementById("resultA").value;
          }else if(${fromAngle}>=2414 && ${fromAngle}<=2485){
             $('#trigger').text(document.getElementById("resultB").value); 
             result =document.getElementById("resultB").value;
          }else if(${fromAngle}>=2342 && ${fromAngle}<=2413){
             $('#trigger').text(document.getElementById("resultC").value); 
             result =document.getElementById("resultC").value;
          }else if(${fromAngle}>=2270 && ${fromAngle}<=2341){
             $('#trigger').text(document.getElementById("resultD").value); 
             result =document.getElementById("resultD").value;
          }else if(${fromAngle}>=2197 && ${fromAngle}<=2269){
             $('#trigger').text(document.getElementById("resultE").value); 
             result = document.getElementById("resultE").value;
          }   
      
   }, 4000);
     
     
      
     
     $('#trigger').click(function(){
    	/*  $('.restart').css("display", "block"); */
   	  	  $('#trigger').click(function(){
   		  location.href="https://map.naver.com/v5/search/"+ result;/*  +"?c=14125237.9868284,4181827.5195079,15,0,0,0,dh" */
   	  }); 
   	  	//  int random =(int)(Math.random()*max);
   	});
}

$('#trigger').click(function(){
	$('.notice').text("ⓘ추천된 오늘의 메뉴를 누르시면 주변 음식점을 안내드립니다.");
});


/* for (int i = 0; i < 10; i++) { // i는 룰렛이 시도됐던 횟수 (처음에는 0회 시도 됐음)
    int a = random() % 10;
    // 기존에 이미 나왔으면 다시 돌림 (또는 ↓)
    // 랜덤 수가 9(유니크)지만 룰렛이 n-1회 미만 시행 됐으면 다시 돌림  
    // ex) n=9; 8회 미만 시행됐으면 다시 돌림 -> 8회 이상 시행 됐으면 현재 9회차이고 유니크 가능!
    while (idx[a] != 0 || (a == 9 && i < n - 1)) {
        a = random() % 10;
    }
    
} 
 */





//public static void delay() { int delay = 1000; try { Thread.sleep(delay); } catch (InterruptedException e) { throw new RuntimeException(e); } }

   
// @keyframes rotation {
//    /*       int random = getRandom(360); */
//    /*       float fromAngle = random+720+angle; */
          
//          from {
//            transform: rotate(0deg);
//          }
//          to {
//            transform: rotate(3250deg);
//          }
//        }
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
//    @keyframes rotation {
//       int random = getRandom(360);
//       float fromAngle = random+720+angle;

//       from {
//         transform: rotate(0deg);
//       }
//       to {
//         transform: rotate(720 deg);
//       }
//     }
//    });
</script>   
</body>
</html>