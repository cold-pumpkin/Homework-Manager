<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<!--==============Logo & Menu Bar=================-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="/main"> <img src="images/flathost-logo.png" alt="logo"></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav navbar-right">
      
       
      
        <li class="active hidden-sm"><a href='<c:url value="/main"/>'>HOME</a></li>
        <li><a href='<c:url value="/member_info"/>'>ACCOUNT</a></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">BOARD <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href='<c:url value="/communityBoardList"/>'>COMMUNITY</a></li>
          </ul>
        <li><a href='<c:url value="/rss"/>'>NEWS</a></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">REFERENCE <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="http://news.naver.com/">NAVER NEWS</a></li>
            <li><a href="http://cafe.naver.com/swhrd1">SW HRD CAFE</a></li>
          </ul>
        </li>

       
        <!-- <li><a href="/" role="button" class="btn btn-success">LOG OUT</a></li> -->
        <li><input type="button" value="LOG OUT" class="btn btn-success" onClick="logout();" /></li>
       
        <script>
        function logout(){
        	 var con = confirm("접속을 종료하시겠습니까");
        	 console.log("세션 종료하자");
        	 if(con == true){
        	  location.href="/logout";
        	  //logout을 위해 세션을 제거하는 페이지 호출
        	 }else{}
        	}

        </script>
       
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
    
  </div>
</nav>
