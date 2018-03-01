<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%
	List<AssetBean> assetList = (List<AssetBean>) request.getAttribute("expenseAssetDetailList");
	String asset_code = (String) request.getAttribute("asset_code");
	int dtlCnt = 1;
%>
<!-- 지출 세부항목 select 태그 -->
<select style="width: 130px; height: 50px;" id="asset_code_<%= dtlCnt++ %>" name="asset_code">
	<%
		for(AssetBean asset : assetList) {
			if(asset.getAsset_code().equals(asset_code)) {
				//System.out.println(asset.getAsset_code()+" \t "+asset.getAsset_name()+" \t "+asset.getTrade_code());
	%>
		<option value="<%= asset.getAsset_code() %>" selected="selected">
			<%= asset.getAsset_name() %>
		</option>		
	<%
			} else {
	%>
		<option value="<%= asset.getAsset_code() %>">
			<%= asset.getAsset_name() %>
		</option>	
	<%
			}
		}
	%>
</select>