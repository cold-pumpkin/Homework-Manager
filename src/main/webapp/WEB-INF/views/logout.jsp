<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<head>
	<title>NtoS</title>
	<meta charset="UTF-8">
	</head>
<body>
<h1>로그아웃</h1>
<% session.invalidate(); %>
</body>