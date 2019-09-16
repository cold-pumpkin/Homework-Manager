<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NtoS Error Page</title>
</head>
<body>
	<h1>에러!</h1>
	<p>애플리케이션 오류 발생!</p>
	Failed URL : ${url}	<br>
	Exception  : ${exception.message}
	<c:forEach items="${exception.stackTrace}" var="ste"> ${ste}
	</c:forEach>
</body>
</html>