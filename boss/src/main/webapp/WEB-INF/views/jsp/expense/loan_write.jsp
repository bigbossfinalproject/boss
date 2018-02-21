<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<ItemBean> iList = (List<ItemBean>) request.getAttribute("iList");		// 분류 항목 목록 가져오기
	List<AssetBean> aList = (List<AssetBean>) request.getAttribute("aList");		// 자산 항목 목록 가져오기
	List<CapitalCorpBean> cList = (List<CapitalCorpBean>) request.getAttribute("cList");		// 대출금융회사 목록 가져오기
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부채 입력 화면</title>
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
	<a href="loan_list.do" style="text-decoration: none;">대출 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_write.do" style="text-decoration: none;">대출 입력</a><br>
	<a href="card_list.do" style="text-decoration: none;">카드 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="card_write.do" style="text-decoration: none;">카드 입력</a><br>
	
	<form action="loan_write_ok.do" method="post">
		<input type="hidden" name="root_idn" value="<%= user.getRoot_idn() %>">
		<input type="hidden" name="root_id" value="<%= user.getRoot_id() %>">
		<input type="hidden" name="loan_date" value="${ date }">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th>중분류 항목</th>
				<td>
					<% if(iList != null) { %>
					<select name="item_code">
						<% for(ItemBean i : iList) { %>
							<option value="<%= i.getItem_code() %>"><%= i.getItem_name() %></option>
						<% }} %>
					</select>
				</td>
			</tr>
			<tr>
				<th>대출명</th>
				<td><input type="text" name="loan_name"></td>
			</tr>
			<tr>
				<th>대출용도</th>
				<td><input type="text" name="loan_purpose"></td>
			</tr>
			<tr>
				<th>대출일</th>
				<td><input type="date" name="loan_begin_date" value="${ date }"></td>
			</tr>
			<tr>
				<th>대출기간</th>
				<td><input type="number" name="loan_term"></td>
			</tr>
			<tr>
				<th>대출금융사</th>
				<td>
					<select name="capital_level">
						<option value="1">1금융권</option>
						<option value="2">2금융권</option>
						<option value="3">3금융권</option>
						<option value="4">사금융권</option>
					</select><br>
					<select name="capital_code">
						<% for(CapitalCorpBean c : cList) {%>
							<option value="<%= c.getCapital_code() %>"><%= c.getCapital_name() %>
						<% } %>
					</select><br>
					<input type="text" name="capital_name">
				</td>
			</tr>
			<tr>
				<th>상환방법</th>
				<td>
					<select name="loan_mean_code">
						<option value="pandi">원리금균등상환</option>
						<option value="princ">원금균등상환</option>
						<option value="expir">만기일시상환</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>대출금</th>
				<td><input type="number" name="loan_amount"></td>
			</tr>
			<tr>
				<th>대출이율</th>
				<td><input type="number" name="loan_rate"></td>
			</tr>
			<tr>
				<th>이자납입일</th>
				<td>
					<select name="loan_expense_date">
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>
						<option value="8">8일</option>
						<option value="9">9일</option>
						<option value="10">10일</option>
						<option value="11">11일</option>
						<option value="12">12일</option>
						<option value="13">13일</option>
						<option value="14">14일</option>
						<option value="15">15일</option>
						<option value="16">16일</option>
						<option value="17">17일</option>
						<option value="18">18일</option>
						<option value="19">19일</option>
						<option value="20">20일</option>
						<option value="21">21일</option>
						<option value="22">22일</option>
						<option value="23">23일</option>
						<option value="24">24일</option>
						<option value="25">25일</option>
						<option value="26">26일</option>
						<option value="27">27일</option>
						<option value="28">28일</option>
						<option value="29">29일</option>
						<option value="30">30일</option>
						<option value="0">말일</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>출금계좌</th>
				<td>
					<select name="asset_code">
						<% for(AssetBean a : aList) {  %>
							<option value="<%= a.getAsset_code() %>"><%= a.getAsset_name() %></option>
						<% } %>
					</select>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<input type="submit" value="입력">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>

<!-- 
private String item_code;						// 품목분류코드		item_참조
private String asset_code;					// 자산 코드			asset_참조
private String capital_code;					// 대출금융사 코드	capitalCorp_참조
private String loan_name;						// 부채명				text
private String loan_purpose;					// 용도				text
private Date loan_begin_date;				// 대출시작일			date
private Date loan_expense_date;			// 원금/이자 납입일	date
private int loan_term;							// 대출기간			number
private int loan_amount;						// 총대출금			number

private int root_idn;								// 회원고유번호		hidden
private String root_id;							// 회원아이디			hidden

private Date loan_date;						// 입력일자			servlet에서 작업
private String loan_code;						// 부채코드			servlet에서 작업
private String principal;						// 상환원금			servlet에서 작업
private String loan_interest;					// 상환이자			servlet에서 작업
private Date loan_end_date;					// 대출만료일			servlet에서 작업 _ 자동 입력_date
 -->
 
 <!--
private String loan_mean_code;				// 상환방법코드		select value(pandi, princ, expir)
private String loan_mean;						// 상환방법			select(원리금균등상환, 원금균등상환, 만기일시상환)
 -->