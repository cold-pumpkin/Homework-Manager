<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>NtoS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- 주요기사 보여주는 페이지 -->
	<!-- ${feedList} -->
	
	<h1>뉴스 리스트 : </h1>	
	
	<c:forEach var ="feed" items="${feedList}">
		${feed.getTitle()}<br>
	</c:forEach>
</body>
