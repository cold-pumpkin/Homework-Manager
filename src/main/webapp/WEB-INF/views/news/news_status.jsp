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
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<!--============== ICON FONT FONT-AWESOME=================-->

<link href="css/font-awesome.css" rel="stylesheet">

<!--==============MAIN CSS FOR HOSTING PAGE=================-->

<link href="css/hosting.css" rel="stylesheet" media="all">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--==============Mordernizr =================-->

<script src="js/modernizr.js"></script>
<script src="js/jquery.min.js"></script>


<style>

.status-page {
	max-width:2000px;	
}

.no-margin-top {
	margin-top:0;	
}

.no-margin {
	margin:0;	
}

.table-expanded>tbody>tr>td, 
.table-expanded>tbody>tr>th, 
.table-expanded>tfoot>tr>td, 
.table-expanded>tfoot>tr>th, 
.table-expanded>thead>tr>td, 
.table-expanded>thead>tr>th {
padding: 20px;
}


</style>

</head>
<body>

<!--==============Logo & Menu Bar=================-->
	<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>


<!--==============Content Area=================-->

<div class="container status-page">

 
  <!--============== Status Page ==============-->
  
  <div class="row PageHead">
    <div class="col-md-12">
      <h1>오늘자 뉴우스</h1>
      <h3>여기서 보고 쓰자</h3>
    </div>
  </div>
  
  <br>
<br>

<div class="col-md-6">
	<h3>동아일보</h3> 
	<div class="table-responsive">  
	<table class="table table-bordered table-expanded">
		<c:forEach var="entry" items="${mapDongA}">
 		<tr>
		<td><span class="pull-right text-info"></span> <a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
 		</tr>
	</c:forEach>
	</table>
	</div>

	
	<h3>중앙일보</h3> 
	<div class="table-responsive">  
	<table class="table table-bordered table-expanded">
		<c:forEach var="entry" items="${mapJoongAng}">
 		<tr>
		<td><span class="pull-right text-info"></span> <a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
 		</tr>
	</c:forEach>
	</table>
	</div>
	</div>
	
	<h3>조선일보</h3> 
	<div class="table-responsive">  
	<table class="table table-bordered table-expanded">
		<c:forEach var="entry" items="${mapChosun}">
 		<tr>
		<td><span class="pull-right text-info"></span> <a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
 		</tr>
	</c:forEach>
	</table>
	</div>
	
	<h3>한국경제</h3> 
	<div class="table-responsive">  
	<table class="table table-bordered table-expanded">
		<c:forEach var="entry" items="${mapHanKyung}">
 		<tr>
		<td><span class="pull-right text-info"></span> <a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
 		</tr>
	</c:forEach>
	</table>
	</div>
	
	<h3>전자신문</h3> 
	<div class="table-responsive">  
	<table class="table table-bordered table-expanded">
		<c:forEach var="entry" items="${mapEtnews}">
 		<tr>
		<td><span class="pull-right text-info"></span> <a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
 		</tr>
	</c:forEach>
	</table>
	</div>

  <br>
<br>

</div>
<!--Container End--> 

<!--============== Footer ==============-->
	<%@ include file="/WEB-INF/views/menu/_footer.jsp"%>

<!--===Back to top======--> 
<a href="#" class="scrollup">Scroll</a> 

<!--==============QUERY LIBRARY=================--> 

<script src="js/jquery.easing.1.2.js"></script> 

<!--==============BOOTSTRAP JS=================--> 

<script src="js/bootstrap.min.js"></script> 

<!--==========ONE PAGE SCROLLING SCRIPTS STARTS===============--> 

<script>
            $(function() {
                $('.nav li a').bind('click',function(event){
                    var $anchor2 = $(this).parent();
				    var $anchor = $(this);
					$('.nav  li').removeClass('active');
                    $anchor2.addClass('active');
					
                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top - 50
                    }, 1500,'easeInOutExpo');
                    /*
                    if you don't want to use the easing effects:
                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top
                    }, 1000);
                    */
                    event.preventDefault();
                });
            });
        </script> 

<!--=============ONE PAGE SCROLLING SCRIPTS ENDS============--> 

<!--=============BACK TO TOP STARTS============--> 

<script>
    $(document).ready(function(){ 
 
        $(window).scroll(function(){
            if ($(this).scrollTop() > 800) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        }); 
 
        $('.scrollup').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 600);
            return false;
        });
 
    });
</script> 

<!--=============BACK TO TOP ENDS============-->

</body>
</html>