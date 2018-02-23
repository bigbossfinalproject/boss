<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String date = (String) request.getAttribute("date");
	System.out.println("Date attribute : "+date);
%>

<tr>
	<td class="text" style="padding:0;">
		<input type="text" class="modify" name="asset_name" size="20" style="line-height: 40px;">
	</td>
	<td class="text" style="padding:0;">
		<input type="text" class="modify" name="asset_purpose" size="20" style="line-height: 40px;">
	</td>
	<td class="text" style="padding:0;">
		<select name="trade_name" style="width:70px; height:50px;">
			<c:forEach items="${ trade }" var="trade">
				<option value="${ trade.trade_code }"><c:out value="${ trade.trade_name }"/></option>
			</c:forEach>
		</select>
	</td>
	<td class="date" style="padding:0;">
		<input type="date" class="modify" name="asset_date" size="20" value="${ date }"style="line-height: 40px;">
	</td>
	<td class="text" style="padding:0;">
		<select name="trade_name" style="width:120px; height:50px;">
			<c:forEach items="${ bank }" var="bank">
				<option value="${ bank.bank_code }"><c:out value="${ bank.bank_name }"/></option>
			</c:forEach>
		</select>
	</td>
	<td class="text" style="padding:0;">
		<b><input type="text" class="modify" name="basic_amount" numberOnly id="basic_amount" size="10" style="text-align: right; padding-right: 5px;"></b>
	</td>
	<td class="text" style="padding:0;"></td>
	<td class="text" style="line-height: 45px; padding:0;">
		<input type="checkbox" class="modify" name="check" checked="checked">사용중
	</td>
	<td class="text" style="line-height: 45px; padding:0;">
		<input type="button" class="white_btn modify" id="row_remove" value="삭제" size="50">
	</td>
</tr>