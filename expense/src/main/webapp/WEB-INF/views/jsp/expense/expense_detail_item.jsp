<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%@ include file="variable.jsp" %>
<%
	List<ItemBean> itemList = (List<ItemBean>) request.getAttribute("expenseItemDetailList");
	String item_code = (String) request.getAttribute("item_code");
	//int btnCnt = ((Integer) request.getAttribute("btnCnt")).intValue();
%>
<!-- 지출 세부항목 select 태그 -->
<select style="width: 113px; height: 50px;" id="item_code_<%= btnCnt++ %>" name="item_code">
	<%
		for(ItemBean item : itemList) {
			if(item.getItem_code().equals(item_code)) {
	%>
		<option value="<%= item.getItem_code() %>" selected="selected">
			<%= item.getItem_name() %>
		</option>		
	<%
			} else {
	%>
		<option value="<%= item.getItem_code() %>">
			<%= item.getItem_name() %>
		</option>	
	<%
			}
		}
	%>
</select>