<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		
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

</body>
</html>