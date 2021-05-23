<%@page import="game.RandomDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
int i = 1;
int max = 360;
String resultA = "null";
String resultB = "null";
String resultC = "null";
String resultD = "null";
String resultE = "null";

RandomDTO randomDTO = null;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.loadingSpinner {
    width: 50px;
    height: 50px;
    border: 5px solid #3498db;
    border-top-color: rgba(0, 0, 0, 0);
    border-left-color: rgba(0, 0, 0, 0);
    border-radius: 50%;
/*     -moz-animation: loadingSpinner 5s linear; */
/*     -o-animation: loadingSpinner 5s linear; */
/*     -webkit-animation: loadingSpinner 5s linear; */
/*     animation: loadingSpinner 5s linear; */
}

@-moz-keyframes loadingSpinner {
  0%   {
      -moz-transform: rotate(0deg);

  }
  100% {
      -moz-transform: rotate(360deg);
  }
}

@-o-keyframes loadingSpinner {
  0%   {
      -o-transform: rotate(0deg);

  }
  100% {
      -o-transform: rotate(360deg);
  }
}

@-webkit-keyframes loadingSpinner {
  0%   {
      -webkit-transform: rotate(0deg);

  }
  100% {
      -webkit-transform: rotate(360deg);
  }
}

@keyframes loadingSpinner {
  0%   {
      transform: rotate(0deg);

  }
  100% {
      transform: rotate(3000deg);
  }
}

.loadingSpinner {
    width: 50px;
    height: 50px;
    border: 5px solid #3498db;
    border-top-color: rgba(0, 0, 0, 0);
    border-left-color: rgba(0, 0, 0, 0);
    border-radius: 50%;
    transform: rotate(0deg);
    transition: transform 5s;
}

.start {
    transform: rotate(170deg);
}
</style>
</head>
<body>
<div class="loadingSpinner"></div>
<img style="transition-duration: 4s; tranform: rotate(0deg)" src='imgs/roulette.png' alt="룰렛" id="roulette" style="top: 80px; left: -592px;"/>
<script type="text/javascript">
$("#roulette").css("transform", "rotate(170deg)");
$(".loadingSpinner").removeClass('loadingSpinner');
$(".loadingSpinner").addClass('start');
</script>
</body>
</html>