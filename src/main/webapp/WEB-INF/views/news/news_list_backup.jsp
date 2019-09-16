<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>NtoS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<h1>뉴스 리스트 : 동아일보</h1>	
	<table>
	<c:forEach var="entry" items="${mapDongA}"> 
		<tr> 
			<!-- <td><a href="/news_write/${entry.value}">${entry.key}</a></td>  -->
			<td><a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td>
			<td>${entry.value}</td> 
		</tr> 
	</c:forEach>
	</table>
	<h1>뉴스 리스트 : 중앙일보</h1>	
	<table>
	<c:forEach var="entry" items="${mapJoongAng}"> 
		<tr> 
			<td><a href='<c:url value="/rss"/>'>${entry.key}</a></td> 
			<td>${entry.value}</td> 
		</tr> 
	</c:forEach>
	</table>
	<h1>뉴스 리스트 : 조선일보</h1>	
	<table>
	<c:forEach var="entry" items="${mapChosun}"> 
		<tr> 
			<td><a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td> 
			<td>${entry.value}</td> 
		</tr> 
	</c:forEach>
	</table>
	<h1>뉴스 리스트 : 한국경제</h1>	
	<table>
	<c:forEach var="entry" items="${mapHanKyung}"> 
		<tr> 
			<td><a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td> 
			<td>${entry.value}</td> 
		</tr> 
	</c:forEach>
	</table>
	<h1>뉴스 리스트 : 전자신문</h1>	
	<table>
	<c:forEach var="entry" items="${mapEtnews}"> 
		<tr> 
			<td><a href='<c:url value="/news_write?link=${entry.value}&title=${entry.key}"/>'>${entry.key}</a></td> 
			<td>${entry.value}</td> 
		</tr> 
	</c:forEach>
	</table>


</body>
