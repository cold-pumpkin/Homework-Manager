<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Download</title>
</head>
<body>
	<!-- 파일 업로드 양식 -->
	<c:url var="actionURL" value='/upload/new' />
	<form action="${actionURL}" method="post" enctype="multipart/form-data">
		<select name="dir">
			<option value="/">/
			<option value="/images">/이미지 
			<option value="/data">/자료실 
			<option value="/bigdata">/빅데이터  
			<option value="/common">/공통 
		</select>
		<input type="file" name="file">
		<input type="submit" value="SAVE">
		<input type="reset" value="CANCLE">
	</form>
</body>
</html>