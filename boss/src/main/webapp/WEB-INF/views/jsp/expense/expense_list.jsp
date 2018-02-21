<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="boss.cashbook.service.ExpenseViewBean" %>
<%@ page import="boss.cashbook.model.ObjectRootBean" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<ExpenseViewBean> expenseList = (List<ExpenseViewBean>) request.getAttribute("expenseList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지출 내역</title>
</head>
<body>
	아이디 : <%= user.getRoot_id() %> / 이름 : <%= user.getRoot_name() %>회원님 반갑습니다.<br>
	고유번호 : <%= user.getRoot_idn() %> / 이메일 : <%= user.getRoot_email() %> 입니다.<br>
	<a href="item_list.do" style="text-decoration: none;">분류항목 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="item_write.do" style="text-decoration: none;">분류항목 입력</a><br>
	<a href="expense_all_list.do" style="text-decoration: none;">지출 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="expense_write.do" style="text-decoration: none;">지출 입력</a><br>
	<a href="asset_list.do" style="text-decoration: none;">자산 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="asset_write.do" style="text-decoration: none;">자산 입력</a><br>
	<a href="loan_list.do" style="text-decoration: none;">부채 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_write.do" style="text-decoration: none;">부채 입력</a><br>
	<a href="card_list.do" style="text-decoration: none;">카드 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="card_write.do" style="text-decoration: none;">카드 입력</a><br>
	
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>번호</th>
			<th>지출일자</th>
			<th>지출항목</th>
			<th>거래방법</th>
			<th>거래계좌</th>
			<th>적요</th>
			<th>금액</th>
		</tr>
		<%
			if(expenseList != null) {
				for(ExpenseViewBean bean : expenseList) {
		%>
			<tr>
				<td><%= bean.getExpense_seq() %></td>
				<td><%= bean.getExpense_date() %></td>
				<td><%= bean.getItem_name() %></td>
				<td><%= bean.getTrade_name() %></td>
				<td><%= bean.getExpense_name() %></td>
				<td><%= bean.getExpense_discription() %></td>
				<td><%= bean.getExpense_amount() %></td>
			</tr>
		<%
				}
			}
		%>
		
		 
	</table>
</body>
</html>