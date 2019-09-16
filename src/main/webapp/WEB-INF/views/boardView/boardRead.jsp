<%@page import="com.NtoS.myapp.model.HomeworkVO"%>
<%@page import="java.util.List"%>
<%@page import="com.NtoS.myapp.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>
<div class="container">
<div class="row PageHead">
		<table class="table table-striped" align="center" style="table-layout: auto;">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td> 
					<td><c:out value="${boardInfo.brdwriter}"/></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><c:out value="${boardInfo.brdtitle}"/></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><c:out value="${boardInfo.brdmemo}"/></td> 
				</tr>
			</tbody>
		</table>    
		<a href="#" onclick="history.back(-1)"><button type="button" class="btn btn-success"><strong>돌아가기</strong></button></a>
		<a href="/communityBoardDelete?brdno=<c:out value="${boardInfo.brdno}"/>"><button type="button" class="btn btn-success"><strong>삭제</strong></button></a>
		<a href="/communityBoardUpdate?brdno=<c:out value="${boardInfo.brdno}"/>"><button type="button" class="btn btn-success"><strong>수정</strong></button></a>
</div>
</div>
<%@ include file="/WEB-INF/views/menu/_footer.jsp"%>
</body>

</html>
