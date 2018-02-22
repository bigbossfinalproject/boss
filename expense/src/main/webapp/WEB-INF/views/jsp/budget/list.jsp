<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:forEach items="${list}" var="dto">
		<form action="budget_modify" method="get">
			<tr>
				<td><input type="text" name="budget_amount" value="${dto.budget_amount}"></td>
				
				<td><input type="text" name="item_code" value="${dto.item_code}"></td>
				
				<td><input type="hidden" name="budget_code" value="${dto.budget_code}">
			
				<input type="submit" value="수정">
					</form>
					
				<td><a href="budget_delete?budget_code=${dto.budget_code}">삭제</a>&nbsp;&nbsp;</td>
			</tr>
		
		</c:forEach>

		
		<tr>
			<td colspan="5"><a href="write_view">글작성</a></td>
		</tr>
	


	</table>
	
<!--  	<table>
		
			<tr>
			<form action="budget_modify" method="get">
				<td><input type="text" name="budget_amount" value=""></td>
				<td><input type="text" name="item_code" value=""></td>
				<td><input type="submit" value="수정"></td>
					</form>
				</tr>	
				
</table>
	
	 -->
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>