<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="boss.cashbook.service.LoanViewBean" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<LoanViewBean> lvList = (List<LoanViewBean>) request.getAttribute("lvList");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부채 목록 화면</title>
    <script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
    
	아이디 : <%= user.getRoot_id() %> / 이름 : <%= user.getRoot_name() %>회원님 반갑습니다.<br>
	고유번호 : <%= user.getRoot_idn() %> / 이메일 : <%= user.getRoot_email() %> 입니다.<br>
	<a href="item_list.do">분류항목 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="expense_list.do">지출 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="asset_list.do">자산 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_list.do">대출 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_write.do">대출 입력</a>&nbsp;&nbsp;&nbsp;
	<a href="card_list.do">카드 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="card_write.do">카드 입력</a>
	
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>분류항목</th>
			<th>대출명</th>
			<th>대출용도</th>
			<th>대출시작일</th>
			<th>대출기간</th>
			<th>대출만료일</th>
			<th>대출금융사</th>
			<th>대출상환방법</th>
			<th>대출금액</th>
			<th>대출이율</th>
			<th>대출이자일</th>
			<th>출금계좌</th>
		</tr>
		<% for(LoanViewBean lvb : lvList) { %>
		<tr>
			<td><%= lvb.getItem_name() %></td>
			<td><%= lvb.getLoan_name() %></td>
			<td><%= lvb.getLoan_purpose() %></td>
			<td><%= lvb.getLoan_begin_date() %></td>
			<td><%= lvb.getLoan_term() %></td>
			<td><%= lvb.getLoan_end_date() %></td>
			<td><%= lvb.getCapital_name() %></td>
			<td><%= lvb.getLoan_mean() %></td>
			<td><%= lvb.getLoan_amount() %></td>
			<td><%= lvb.getLoan_rate() %></td>
			<td><%= lvb.getLoan_interest_date() %></td>
			<td><%= lvb.getAsset_name() %></td>
		</tr>
		<% } %>
	</table>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>