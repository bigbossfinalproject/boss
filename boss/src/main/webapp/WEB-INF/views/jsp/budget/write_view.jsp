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
	

		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<form action="budget_insert" method="get">
			
			<tr>
					<td>아이디 </td>
					<td> <input type="text" name="root_idn" size = "50"></td>
				</tr>
				<tr>
					<td>예산금액 </td>
					<td> <input type="text" name="budget_amount" size = "50"></td>
				</tr>
			<tr>
					<td> 아이템코드</td>
					<td> <input type="text" name="item_code" size = "50"></td>
				</tr>
			
				<tr>
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="budget_insert"></a>
				</tr>
			</form>
		</table>

	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>