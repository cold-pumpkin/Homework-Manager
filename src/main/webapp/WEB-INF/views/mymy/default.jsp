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
<script>

$(document).ready(function() {

    $('#calendar').fullCalendar({
      defaultDate: '2018-03-02',
      editable: true,
      eventLimit: false, // allow "more" link when too many events
      events: [
   		<c:forEach var="al" items="${allist}">
    	<c:if test="${al.directoryName eq '알마인드'}" >
    	{
          title: 'Almind',
          start: '${al.submitDate}'
        },
        </c:if>
        </c:forEach>
        
        <c:forEach var="news" items="${newslist}">
  	    <c:if test="${news.directoryName eq '사설'}" >
  	    {
          title: 'News',
          start: '${news.submitDate}'
        },
        </c:if>
        </c:forEach>
        
        <c:forEach var="walk" items="${walklist}">
	    <c:if test="${walk.directoryName eq '만보'}" >
	    {
          title: 'Walk',
          start: '${walk.submitDate}'
	    },
	    </c:if>
	    </c:forEach>
      
	    ]
    });

  });

</script>
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

		<!--============== Features Layout ==============-->
		<!-- 
  <div class="row FeatLayout">
    <div class="col-md-5 Featimg"> <img src="images/features_img.png" alt="feature" class="img-responsive center-block"></div>
    <div class="col-md-7">
      <h1>Features Layout</h1>
      </ul>
    </div>
  </div>
   -->
		<!--============== Other Features ==============-->

		<div class="row PageHead">
			<div class="col-md-12">
			<% 
				try{
					MemberVO member=(MemberVO)session.getAttribute("member");
				
			if(member.getEmail()==null){
				response.sendRedirect("login"); 
			}
			}catch(Exception e){}%>
			
				<h1>${login.memberName},  과제 좀 내라</h1>
				<h3>알마인드, 사설, 만보 내라</h3>

				

				



<div class="container" align="center">
<h4></h4>
				<form action="/mypage">
					<input type="date" name="submitDate" > 
					<input type="submit"
						class="btn btn-success" value="이동">
				</form>
</div>
				<div id='calendar'></div>

			</div>
		</div>
	</div>

	<!--============== Footer ==============-->
	<%@ include file="/WEB-INF/views/menu/_footer.jsp"%>


	<!--==============BOOTSTRAP JS=================-->

	<script src="/js/bootstrap.min.js"></script>
</body>
</html>