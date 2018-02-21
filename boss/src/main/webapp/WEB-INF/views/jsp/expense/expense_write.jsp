<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="boss.cashbook.service.MemberItemViewBean" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<!DOCTYPE html >
<%
	ObjectRootBean user = (ObjectRootBean)session.getAttribute("user");
	List<MemberItemViewBean> itemList = (List<MemberItemViewBean>) request.getAttribute("memItemList");
	List<TradeBean> tradeList = (List<TradeBean>) request.getAttribute("tradeList");
	List<AssetBean> assetList = (List<AssetBean>) request.getAttribute("assetList");
	List<CardBean> cardList = (List<CardBean>) request.getAttribute("cardList");
	
	int idn = user.getRoot_idn();
	String id = user.getRoot_id();
	String name = user.getRoot_name();
	String email = user.getRoot_email();
	String tradeSelect = null;
%>
<html>
<script type="text/javascript">
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지출 입력</title>
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
    <a href="list.io" style="text-decoration: none;">소득 보기</a><br>
	
	<form action="expense_write_ok.do" method="post">
		<input type="hidden" name="root_idn" value="<%= idn %>">
		<input type="hidden" name="root_id" value="<%= id %>">
		<table border=1 style="border-collapse: collapse;">
			<tr>
				<th>지출일자</th>
				<td><input type="date" name="expense_date" value="${ date }"></td><!-- date는 sessionAttribute로 지정한 값임 -->
			</tr>
			<tr>
				<th>분류코드</th>
				<td>
					<select id="item_code" name="item_code">
						<%
							for(MemberItemViewBean item : itemList){
								if(item.getItemLevel() == 2){
						%>
							<option value="<%= item.getItemCode() %>"><%= item.getItemName() %></option>
						<%
								}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>거래분류</th>
				<td>
					<select id="trade_code" name="trade_code">
						<option>선택하세요</option>
						<%
							for(TradeBean t : tradeList) {
						%>
						<option value="<%= t.getTrade_code() %>"><%= t.getTrade_name() %></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<!-- ajax를 이용해서 거래 분류를 선택하면 호출하는 셀렉트태그가 변경되도록 적용 -->
				<th>지출코드</th>
				<td>
					<select name="expense_code" style="width: 200px;">
						<%
							for(AssetBean a : assetList){
								if(a.getTrade_code().equals("cash")) {
									// System.out.println(a.getTrade_code()+"\t"+a.getAsset_name()+"\n");
						%>
							<option class="cash" value="<%= a.getAsset_code() %>"><%= a.getAsset_name() %></option>
						<% 	}
							}
							for(AssetBean a : assetList) {
								if(!a.getTrade_code().equals("cash")) {
									// System.out.println(a.getTrade_code()+"\t"+a.getAsset_name()+"\n");
						%>
							<option class="account" value="<%= a.getAsset_code() %>"><%= a.getAsset_name() %></option>
						<% 	}
							}
							for(AssetBean a : assetList) {
								if(!a.getTrade_code().equals("transfer")) {
									// System.out.println(a.getTrade_code()+"\t"+a.getAsset_name()+"\n");
						%>
							<option class="transfer" value="<%= a.getAsset_code() %>"><%= a.getAsset_name() %></option>
						<% 	}
							}
							for(CardBean c : cardList) {
								// System.out.println(c.getCard_type_code()+"\t"+c.getCard_name());
						%>
							<option class="card" value="<%= c.getCard_code() %>"><%= c.getCard_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<th>거래 적요</th>
				<td><input type="text" name="expense_discription" placeholder="지출 사용 내용을 기입하세요"></td>
			</tr>
			<tr>
				<th>거래금액</th>
				<td><input type="number" name="expense_amount"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
    <footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>