<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
	
	<table cellpadding="0" cellspacing="0" border="1" style="width: 500px;">
		
		<tr>
			<td>금액</td>
			<td>이름</td>
		</tr>
		<c:set var ="dto" value="${list}">
		
		<tr>
				<td>?${dto.budget_amount}</td>
				<td>${dto.budget_amount_spent}</td>
			</tr>
		
		</c:set>
		
	<%-- 	<item="${list}" var="dto">
			<tr>
				<td>?${dto.budget_amount}</td>
				<td>?${dto.budget_amount_spent}</td>
			</tr>
			 --%>	
	</table>
	
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>