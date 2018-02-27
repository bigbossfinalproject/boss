<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<ItemBean> iList = (List<ItemBean>) request.getAttribute("itemDetailList");
	int btnCnt = 1;
	
	String item_class = null;
	String root_idn = user.getRoot_idn()+"";
	int row = 0;
	int dtlCnt = 0;
	
%>
<%
	for(ItemBean i : iList){
	
%>
	<div id="detail_code_<%= dtlCnt %>" style="margin:0; padding:0; width: 147px; float: left; height: 50px; line-height: 50px; vertical-align: middle;">
		<input type="hidden" name="item_remove" value="<%= i.getItem_code() %>">
		<%= i.getItem_name() %>
		<input id="item_remove_<%= dtlCnt %>" type="button" class="white_btn item_remove" value="X" style="margin-left:10px; height:50px;">
	</div>
<%
		dtlCnt++;
	
	}
%>

<!-- <html>
<script type="text/javascript">
//항목 삭제 버튼을 클릭하면 ajax 실행
$(document).on('click', 'input[id^="item_remove_"]', function(){
	itemRemove(this);
});
		
</script>
</html> -->