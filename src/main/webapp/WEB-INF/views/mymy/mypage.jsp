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
</style>
</head>


<body>

	<!--==============Logo & Menu Bar=================-->
	<%@ include file="/WEB-INF/views/menu/_navbar.jsp"%>


	<!--==============Content Area=================-->
	<div class="container">


		<!--============== Other Features ==============-->

		<div class="row PageHead">

			<div class="col-md-12">
				<h1>${login.memberName},&nbsp&nbsp과제 좀 내라</h1>
				<h3>알마인드, 사설, 만보 내라</h3>

				<h4>${homeworkVO.submitDate} &nbsp과제제출</h4>
				<br>
				<c:url var="actionURL" value='/mypage/upload' />
				<form action="${actionURL}" method="post"
					enctype="multipart/form-data">

					<h4>알마인드 제출</h4>
					<!--  <table class="table table-bordered table-expanded" style="table-layout:auto">
						<tr>
							<th>알마인드 제출</th>
						</tr>
						<tr>-->
							<!--  이부분은 제출시 조건문 사용하여  이날짜에 낸 파일이 있다면 수정으로 버튼이 생기면서 바뀌어야 한다 -->
							<table class="table table-bordered table-expanded" style="table-layout: auto">
							<td><input type="file" name="file"></td>
							<input type="hidden" value="${homeworkVO.submitDate}"
								name="submitDate">
							<input type="hidden" value="알마인드" name="directoryName">

					<c:choose>
								<c:when test="${al.fileId!=0}">

									<td><input type="submit" value="수정"></td>
									<input type="hidden" value="update" name="command">
									<input type="hidden" value="${al.fileId}" name="deleteFileId">
									<!-- 이경우엔 수정을 누르면 command 값을 가지고 들어감 -->
	
								</c:when>
		
								<c:when test="${al.fileId==0}">
									<!-- 탈출하지 않고 만약 끝까지 돌았다면 없다는 소리니까 제출버튼이보임-->
									<td><input type="submit" value="제출"></td>

								</c:when>
							</c:choose>
				</table>
				</form>

<br>

				<c:url var="actionURL" value='/mypage/upload' />
				<form action="${actionURL}" method="post"
					enctype="multipart/form-data">
					<h4>사설 제출</h4>
					<!--  <table class="table table-bordered table-expanded" style="table-layout:auto">
						<tr>

							<th>사설 제출</th>
						</tr>
						<tr>-->
							<!--  이부분은 제출시 조건문 사용하여  이날짜에 낸 파일이 있다면 수정으로 버튼이 바뀌어야 한다 -->
							<table class="table table-bordered table-expanded" style="table-layout: auto" width="400">
							<td><input type="file" name="file"></td>
							<input type="hidden" value="${homeworkVO.submitDate}"
								name="submitDate">
								
							<input type="hidden" value="사설" name="directoryName">

							<!-- 여기부터 자료여부에 따라 바뀌는 부분 -->
				
				
				<c:choose>
								<c:when test="${news.fileId!=0}">

									<td><input type="submit" value="수정"></td>
									<input type="hidden" value="update" name="command">
									<input type="hidden" value="${al.fileId}" name="deleteFileId">
									<!-- 이경우엔 수정을 누르면 command 값을 가지고 들어감 -->

								</c:when>

								<c:when test="${news.fileId==0}">
									<!-- 탈출하지 않고 만약 끝까지 돌았다면 없다는 소리니까 제출버튼이보임-->
									<td><input type="submit" value="제출"></td>
			
								</c:when>
							</c:choose>
				</table>
				</form>

<br>

				<c:url var="actionURL" value='/mypage/upload' />
				<form action="${actionURL}" method="post"
					enctype="multipart/form-data">
					<h4>만보 제출</h4>
					<!--  <table class="table table-bordered table-expanded" style="table-layout:auto">
						<tr>
							<th>만보 제출</th>
						</tr>
						<tr>-->
							<!--  이부분은 제출시 조건문 사용하여  이날짜에 낸 파일이 있다면 수정으로 버튼이 바뀌어야 한다 -->
							<table class="table table-bordered table-expanded" style="table-layout: auto" width="400">
							<td><input type="file" name="file"></td>
							<input type="hidden" value="${homeworkVO.submitDate}"
								name="submitDate">
							<input type="hidden" value="만보" name="directoryName">


					
					<c:choose>
								<c:when test="${walk.fileId!=0}">

									<td><input type="submit" value="수정"></td>
									<input type="hidden" value="update" name="command">
									<input type="hidden" value="${al.fileId}" name="deleteFileId">
									<!-- 이경우엔 수정을 누르면 command 값을 가지고 들어감 -->
									
								</c:when>
								<c:when test="${walk.fileId==0}">
									<!-- 탈출하지 않고 만약 끝까지 돌았다면 없다는 소리니까 제출버튼이보임-->

									<td><input type="submit" value="제출"></td>
	
								</c:when>
							</c:choose>
				</form>
</table>
			<!-- 여기서부턴 자신의 제출 리스트 테이블 -->
			<br><br><br><br>
			<c:url var="actionURL" value='/upload/updateDir' />
			<form action="${actionURL}" method="post"
				enctype="multipart/form-data" class="form-horizontal">
				<table class="table table-bordered table-expanded" style="table-layout: auto" width="400">
					<tr>
						<th>날짜</th>
						<th>제목</th>
						<td>삭제</td>
					</tr>
					<c:choose>
					<c:when test="${al.fileId!=0}">
						<tr>
							<td>${al.submitDate}</td>
							<td><a href='<c:url value="/pds/${al.fileId}" />'>
									${al.homeworkTitle} </a><br></td>
							<td><a
								href='<c:url value="/mypage/delete/${al.fileId}?submitDate=${homeworkVO.submitDate}" />'
								class="delete">삭제</a></td>
						</tr>
					</c:when>
					<c:when test="${al.fileId==0}">
					<tr>
						<td>${homeworkVO.submitDate}</td>
							<td colspan="2" align=center>알마인드 제출해라</td>
							
						</tr>
						</c:when>
						</c:choose>
						
					<c:choose>
					<c:when test="${news.fileId!=0}">	
						<tr>
							<td>${news.submitDate}</td>
							<td><a href='<c:url value="/pds/${news.fileId}" />'>
									${news.homeworkTitle} </a><br></td>
							<td><a
								href='<c:url value="/mypage/delete/${news.fileId}" />'
								class="delete">삭제</a></td>
						</tr>
						</c:when>
						<c:when test="${news.fileId==0}">
						<tr>
						<td>${homeworkVO.submitDate}</td>
							<td colspan="2" align=center>사설 제출해라</td>
							
						</tr>
						</c:when>
						</c:choose>
						
						<c:choose>
						<c:when test="${walk.fileId!=0}">
						<tr>
							<td>${walk.submitDate}</td>
							<td><a href='<c:url value="/pds/${walk.fileId}" />'>
									${walk.homeworkTitle} </a><br></td>
							<td><a
								href='<c:url value="/mypage/delete/${walk.fileId}" />'
								class="delete">삭제</a></td>
						</tr>
						</c:when>
						<c:when test="${walk.fileId==0}">
						<tr>
						<td>${homeworkVO.submitDate}</td>
							<td colspan="2" align=center>만보 제출해라</td>
							
						</tr>
						</c:when>
						</c:choose>
				</table>


		</form>
				</div>
			</div>
		</div>


<!--============== Footer ==============-->
<%@ include file="/WEB-INF/views/menu/_footer.jsp"%>

<!--==============BOOTSTRAP JS=================-->

</body>
</html>