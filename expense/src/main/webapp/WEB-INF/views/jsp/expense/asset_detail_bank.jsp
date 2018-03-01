<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%
	List<BankCorpBean> bankList = (List<BankCorpBean>) request.getAttribute("bankList");
	String bankCode = (String)request.getAttribute("bank_code");
	int dtlCnt = 1;
%>
<!-- 지출 세부항목 select 태그 -->
<select style="width: 130px; height: 50px;" id="bank_code_<%= dtlCnt++ %>" class="bank_code" name="bank_code" style="width: 120px; height: 50px;">
	<%
		for(BankCorpBean bank : bankList) {
			
			if(bank.getBank_code().equals(bankCode)) {
				System.out.println(bank.getBank_code()+" \t "+bank.getBank_name());
	%>
		<option value="<%= bank.getBank_code() %>" selected="selected">
			<%= bank.getBank_name() %>
		</option>
	<%
			} else {
	%>
		<option value="<%= bank.getBank_code() %>">
			<%= bank.getBank_name() %>
		</option>
	<%	
			}
		}
	%>
</select>