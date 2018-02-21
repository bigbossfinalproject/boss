<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.ObjectRootBean" %>
<%@ page import="boss.cashbook.service.CardViewBean" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<CardViewBean> cList = (List<CardViewBean>) request.getAttribute("cardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카드 목록 보기</title>
    <script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
    
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
			<th>카드 이름</th>
			<th>카드 타입</th>
			<th>결재일</th>
			<th>사용기간</th>
			<th>은행이름</th>
			<th>결재계좌</th>
		</tr>
		<% for(CardViewBean c : cList) { %>
			<tr>
				<td><%= c.getCard_name() %></td>
				<td><%= c.getCard_type_name() %></td>
				<td><%= c.getCard_expense_date() %></td>
				<td><%= c.getCard_use_term() %></td>
				<td><%= c.getBank_name() %></td>
				<td><%= c.getAccount_name() %></td>
			</tr>
		<% } %>
	</table>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>