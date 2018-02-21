<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<ItemBean> highList = (List<ItemBean>) request.getAttribute("highList");
	List<ItemBean> midList = (List<ItemBean>) request.getAttribute("midList");
	List<ItemBean> lowList = (List<ItemBean>) request.getAttribute("lowList");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분류항목 입력 화면</title>
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
	
	<form action="item_write_ok.do" method="post">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>대분류 항목</th>
				<td>
					<select name="high_item">
						<% for(ItemBean i : highList) { %>
							<option value="<%= i.getItem_code() %>"><%= i.getItem_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>중분류 항목</th>
				<td>
					<select name="mid_item">
						<% for(ItemBean i : midList) { %>
							<option value="<%= i.getItem_code() %>"><%= i.getItem_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>상세 항목</th>
				<td>
						<%
						int nl = 0;
						for(ItemBean i : lowList) { %>
							<label><%= i.getItem_name() %></label>&nbsp;&nbsp;&nbsp;
						<%
							nl++;
							if(nl % 5 == 0) {
								%>
								<br>
								<%
							}
						} %>
						<br>
						<input type="text" name = "low_name">
				</td>
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