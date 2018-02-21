<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
	
</body>
</html>