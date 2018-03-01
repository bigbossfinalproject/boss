<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%
	List<CardBean> cardList = (List<CardBean>) request.getAttribute("expenseCardDetailList");
	String card_code = (String) request.getAttribute("card_code");
%>
<!-- 지출 세부항목 select 태그 -->
<select style="width: 130px; height: 50px;" id="item_code_" name="item_code">
	<%
		for(CardBean card : cardList) {
			if(card.getCard_code().equals(card_code)) {
				//System.out.println(card.getCard_code()+" \t "+card.getCard_name()+" \t "+card.getCard_type_code());
	%>
		<option value="<%= card.getCard_code() %>" selected="selected">
			<%= card.getCard_name() %>
		</option>		
	<%
			} else {
	%>
		<option value="<%= card.getCard_code() %>">
			<%= card.getCard_name() %>
		</option>	
	<%
			}
		}
	%>
</select>