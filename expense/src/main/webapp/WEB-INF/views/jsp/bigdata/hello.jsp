<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	인사말: <strong>${greeting}</strong>
	
	<hr>
	<a href="<%=request.getContextPath()%>/index.jsp">index.jsp</a>
</body>
</html>