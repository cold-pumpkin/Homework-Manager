<%@page import="com.NtoS.myapp.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>N to S</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--==============GOOGLE FONT - OPEN SANS=================-->
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<!--============== ICON FONT FONT-AWESOME=================-->

<link href="css/font-awesome.css" rel="stylesheet">

<!--==============MAIN CSS FOR HOSTING PAGE=================-->

<link href="css/hosting.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--==============Mordernizr =================-->

<script src="js/modernizr.js"></script>

<!--=================== Jquery STARTS=======================-->

<script src="js/jquery.min1.js"></script>

<!--==============CONTACT FORM=================-->

<script src='https://www.google.com/recaptcha/api.js'></script>

<style>
	
	#message { position:absolute;  }
	#submit-button{ position:absolute;  }

</style>
</head>
<body>

<!--==============Logo & Menu Bar=================-->
<!--==============Logo & Menu Bar=================-->
	<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>


<!--============== Contact us ==============-->

<div class="content" style="width:1500px"> 
  <div class="row PageHead">
    <div class="col-md-12">
      <h1 style="margin:40px">${login.memberName},&nbsp&nbsp사설 쓰자</h1>
      <h3>복붙하지 말자</h3>
    </div>
  </div>
  
  <!-- 기사 -->

 <div class="col-md-6" style="padding:50px">
 	<h3><c:out value="${newsData[0]}"/></h3>
 	<!--
     <c:out value="${newsData[1]}"/>
     <c:out value="${newsData[2]}"/>
  -->
	<c:forEach var="news" items="${newsData}">	
		${news}<br>
	</c:forEach>
 </div>
  <div class="col-md-6">
	<form action="/write_article" method="post">
	<div class="form-group">
          <p>
          <br><br><br>
            <input class="btn btn-success btn-lg" type="submit" value="SUBMIT" id="submit-button"/>
          </p>
	</div>
	<br><br><br><br>
   
    <div class="form-group">
    	<textarea class="form-control" rows="50" name="article" placeholder="" id="message" required></textarea>
    </div> 
		
    </form>
    </div>

</div>
<!--==============BOOTSTRAP JS=================--> 

<script src="js/bootstrap.min.js"></script>
<script>

$(document).ready(function() {
	 
	var floatPosition = parseInt($("#message").css('top'));
 
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
		$("#message").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
 
});

</script>

<script>

$(document).ready(function() {

	var floatPosition = parseInt($("#submit-button").css('top')); 
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		$("#submit-button").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
});

</script>

<script>

$(document).ready(function() {


function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}   

var contact = getUrlParameter('contact');
 
 if (contact != null && contact == 'success') {
			 $('.loading').fadeIn('slow').html('<font color="green">Mail sent Successfully.</font>').delay(3000).fadeOut('slow');
 }
		
 if (contact != null && contact == 'error') {
	$('.loading').fadeIn('slow').html('<font color="red">Oops. Something went wrong.</font>').delay(3000).fadeOut('slow');
 }
 
  if (contact != null && contact == 'captcha') {
		$('.loading').fadeIn('slow').html('<font color="red">Couldn\'t validate captcha </font>').delay(3000).fadeOut('slow');
 }	
		
});

</script>


</body>
</html>