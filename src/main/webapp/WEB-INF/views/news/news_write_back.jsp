<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>	
<title>NtoS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<h1>뉴스쓰기</h1>

	<h1>뉴스 리스트 : </h1>
	<table>
	<c:forEach var="news" items="${newsData}">
		<tr>
			<td>${news}</td>
		</tr>
	</c:forEach>
	</table>

</body>