<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<TradeBean> tList = (List<TradeBean>) request.getAttribute("trade");
	List<BankCorpBean> bList = (List<BankCorpBean>) request.getAttribute("bank");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자산 정보 입력</title>
    <script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<script type="text/javascript">
	
</script>
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
	
	<form action="asset_write_ok.do" method="post">
		<input type="hidden" name="root_idn" value="<%= user.getRoot_idn() %>">
		<input type="hidden" name="root_id" value="<%= user.getRoot_id() %>">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>등록일자</th>
				<td><input type="date" name="asset_date" value="${ date }"></td>
			</tr>
			<tr>
				<th>거래구분</th>
				<td>
					<select name="trade_code">
						<% for(TradeBean t : tList) { %>
							<option value="<%= t.getTrade_code() %>"><%= t.getTrade_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>자산명</th>
				<td><input type="text" name="asset_name"></td>
			</tr>
			<tr>
				<th>자산목적</th>
				<td><input type="text" name="asset_purpose"></td>
			</tr>
			<tr>
				<th>은행명</th>
				<td>
					<select name="bank_code">
						<% for(BankCorpBean b : bList) { %>
							<option value="<%= b.getBank_code() %>"><%= b.getBank_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>기초금액</th>
				<td><input type="number" name="basic_amount"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="저장">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>