<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"b pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<AssetBean> aList = (List<AssetBean>) request.getAttribute("asset");
	List<CardCorpBean> cList = (List<CardCorpBean>) request.getAttribute("cardCorp");
	List<BankCorpBean> bList = (List<BankCorpBean>) request.getAttribute("bankCorp");
	String date = null;
	String t_code = null;
	String term = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카드 입력 하기</title>
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
	
	<form action="card_write_ok.do" method="post">
		<input type="hidden" name="root_idn" value="<%= user.getRoot_idn() %>">
		<input type="hidden" name="root_id" value="<%= user.getRoot_id() %>">
		<table>
			<tr>
				<th>카드명</th>
				<td><input type="text" name="card_name"></td>
			</tr>
			<tr>
				<th>카드회사</th>
				<td>
					<select name="card_corp_code">
						<% for(CardCorpBean c : cList) { %>
							<option value="<%= c.getCard_corp_code() %>"><%=c.getCard_corp_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>카드타입</th>
				<td>
					<select name="card_type_code">
						<option value="checkcard">체크카드</option>
						<option value="creditcard">신용카드</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>결재일</th>
				<td>
					<select name="card_expense_date">
						<%
						for(CardCorpBean c : cList) {
							StringTokenizer std = new StringTokenizer(c.getCard_expense_date(), "|");
							while(std.hasMoreTokens()) {
								date = std.nextToken();
							%>
								<option value="<%= date %>"><%= date %></option>
						<% }} %>
					</select>
				</td>
			</tr>
			<tr>
				<th>사용기간</th>
				<td>
					<select name="card_use_term">
					<%
					for(CardCorpBean c : cList) {
						StringTokenizer std = new StringTokenizer(c.getCard_use_term(), "|");
						while(std.hasMoreTokens()) {
							term = std.nextToken();
							t_code = term;
							term = term.replace("말", "말일");
							term = term.replace("sdm", "전전월");
							term = term.replace("edm", "전전월");
							term = term.replace("ssm", "전월");
							term = term.replace("esm", "전월");
							term = term.replace("snm", "당월");
							term = term.replace("enm", "당월");
							term = term.replace("~", "일 ~ ");
							term += "일";
						%>
						<%-- <label><input type="hidden" name="card_use_term" value="<%= t_code %>"><%= term %></label> --%>
						<option value="<%= t_code %>"><%= term %></option>
						<% }%>
						<!-- <br> -->
					<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<th>결재은행</th>
				<td>
					<select name="bank_code">
						<% for(BankCorpBean b : bList) { %>
							<option value="<%= b.getBank_code() %>"><%= b.getBank_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>결재계좌</th>
				<td>
					<select name="asset_code">
						<% for(AssetBean a : aList) { %>
							<option value="<%= a.getAsset_code() %>"><%= a.getAsset_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>
