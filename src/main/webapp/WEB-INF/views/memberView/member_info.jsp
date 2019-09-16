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

<!--===================JQUERY STARTS=======================-->
<!-- 1로 수정 -->
<script src="js/jquery.min1.js"></script>

<!--===================JQUERY ENDS=======================-->


<!----------------------------------------------------------- 붙여 넣기 ------------------------------------------------>
<meta charset='utf-8' />
<link href='/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='/js/moment.min.js'></script>
<script src='/js/jquery.min.js'></script>
<script src='/js/fullcalendar.min.js'></script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>


<body>

	<!--==============Logo & Menu Bar=================-->
	<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>


	<!--==============Content Area=================-->
	<div class="container">
	<div class="row PageHead">
	<div class="card" style="width: 25rem;">
  <img class="card-img-top" src="/images/support_img.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">회원 상세 정보</h5>    
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">회원 이름: ${member1.memberName}</li>
    <li class="list-group-item" style="layout:auto">회원 이메일: ${member1.email}</li>
    <li class="list-group-item">회원 부서: ${member1.memberDepart}</li>
  </ul>
  <div class="card-body">
    <a href="/memberUpdateForm" class="card-link"><button type="button" class="btn btn-success"><strong>수정하기</strong></button></a>
    <a href="/memberDelete" class="card-link"><button type="button" class="btn btn-success"><strong>탈퇴하기</strong></button></a>
  </div>
</div>
	</div>
	</div>

	<!--============== Footer ==============-->
	<%@ include file="/WEB-INF/views/menu/_footer.jsp"%>


	<!--==============BOOTSTRAP JS=================-->

	<script src="/js/bootstrap.min.js"></script>
</body>
</html>