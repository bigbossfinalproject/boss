<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="boss.cashbook.model.*" %>
<%@ page import="java.util.List" %>

<%
	int rootIdn = ((Integer) session.getAttribute("root_Idn")).intValue();
	String rootId = (String) session.getAttribute("root_Id");
	List<ItemBean> iList = (List<ItemBean>) request.getAttribute("itemList");
	int btnCnt = 1;
	String root_idn = rootIdn+"";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분류항목 목록 화면</title>
    <script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
	<style type="text/css">
		body {
			width: 1280px;
			margin: 0 auto;
		}
		
		table, tr, td, th {
			padding: 0;
			border: 0;
		}
		
		.frame_1000 {
			width: 1000px;
			margin: 150px auto 0 auto;
		}
		
		.frame_1080 {
			width: 1080px;
			margin: 150px auto 0 auto;
		}
		
		.frame_1200 {
			width: 1200px;
			margin: 150px auto 0 auto;
		}
		
		a {
			text-decoration: none;
		}
		
		tr {
			height: 40px;
		}
		
		td {
			line-height: 40px;
		}
		
		th {
			text-align: center; /* 제목은 모두 중앙 정렬 */
			line-height: 40px;
			background-color: #87cefa;
		}
		
		.new_line {
			margin:0;
			height:10px;
		}
		
		tr:NTH-OF-TYPE(2n+1) {
			background-color: #b0c4de;
		}
		
		.no, .text, .date {
			text-align: center; /* 번호, 문자, 날짜는 중앙 정렬 */
		}
		
		.amount {
			text-align: right; /* 금액은 우측 정렬 */
			padding-right: 5px; /* 금액의 우측 간격 */
		}
		
		#top {
			overflow: hidden;
			list-style: none;
			padding: 0;
		}
		
		#subject {
			float: left;
			width: 100px;
		}
		
		#add, #save, #rollback {
			float: right;
			width: 100px;
			text-align: right;
		}
		
		.white_btn {
			background: transparent;
			border-color: transparent;
		}
		
		.input-control {
			padding: 5px 0;
			line-height: 36px;
			background-color: #fff;
			border: 1px solid #ccc;
			border-radius: 4px;
		}
		
		input, select, option {
			margin: 0;
			border: 0;
			padding: 5px 0;
			line-height: 36px;
			text-align: center;
			border-color: transparent;
			background-color: transparent;
		}
	</style>
</head>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
    <div class="inner_frame"><jsp:include page="/resources/include/info_header.jsp"/></div>
	<div class="frame_1080">
		<div class="new_line"></div>
		<table class="table table-bordered text-center" id="item_table">
			<colgroup>
				<col width="120px">
				<col width="160px">
				<col width="600px">
				<col width="200px">
			</colgroup>
			<tr>
				<th>대분류 항목</th>
				<th>중분류 항목</th>
				<th>세부 항목</th>
				<th>항목 추가</th>
			</tr>
				<%
					int row = 0;
					int dtlCnt = 0;
					String item_class = null;
					for(ItemBean i : iList) {
						if(i.getItem_level() == 1) { row++; }
					}
					for(int cnt = 0; cnt < row ; cnt++) {
						if(cnt == 0) item_class = root_idn+"a";
						else if(cnt == 1) item_class = root_idn+"l";
						else if(cnt == 2) item_class = root_idn+"i";
						else if(cnt == 3) item_class = root_idn+"e";
				%>
				<tr>
					<td class="text" id="high_item_<%= btnCnt %>" style="padding: 0; height:50px; vertical-align: middle;">
						<% for(ItemBean i : iList){
							if(i.getItem_level() == 1 && i.getItem_code().substring(0, root_idn.length()+1).equals(item_class)) { %>
								<input type="hidden" id="high_code_<%= i.getItem_code() %>" name="high_code">
								<label style="line-height: 50px; padding:0; margin:0;"><%= i.getItem_name() %></label>
						<% }} %>
					</td>
					<td class="text" id="mid_item_<%= btnCnt %>" style="padding: 0; height:50px; vertical-align: middle;">
						<select style="width: 115px; height: 50px;" id="mid_code_<%= btnCnt %>" name="mid_code">
							<% for(ItemBean i : iList){
								if(i.getItem_level() == 2 && i.getItem_code().substring(0, root_idn.length()+1).equals(item_class)) { %>
								<option value="<%= i.getItem_code() %>"><%= i.getItem_name() %></option>
							<% }} %>
						</select>
					</td>
					<td class="text" id="detail_item_<%= btnCnt %>" style="padding: 0; line-height: 50px; text-align: center; padding-left: 5px;">
					</td>
					<td class="text" style="padding: 0; height: 50px; line-height: 50px; vertical-align: middle;">
						<input type="text" class="item_add" name="item_add" style="width:100px; height:40px; line-height: 40px; background-color:#fff; border: 1px solid #ccc; border-radius: 4px;">
						<input type="button" id="item_add_<%= btnCnt %>" class="white_btn item_add" value="추가" style="width:50px; height:40px; font-weight: bold;">
					</td>
				</tr>
			<% 
					btnCnt++;
				}
			%>
		</table>
	</div>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>

<script type="text/javascript">
	$(function() {
		
		// jsp에서 사용하던 변수 값을  js변수에 저장
		var idn = <%= rootIdn %>+'';
		var btnCnt = <%= btnCnt %>;
		//console.log('btnCnt에 저장된 값 : '+btnCnt);
		
		
		var td_val = new Array();			// 중분류 항목의 코드 값을 호출하여 변수에 저장
		var dt_id = new Array();				// 세부 항목의 td태그 id값을 호출하여 변수에 저장
		for(var i = 1; i < btnCnt; i++) {
			td_val[(i-1)] = $('td[id^="mid_item_'+i+'"]').children().val();
			dt_id[(i-1)] = $('td[id^="detail_item_'+i+'"]').attr('id');
		}
		
		for(var i = 1; i < btnCnt; i++) {
			dt_id[(i-1)] = $('td[id^="detail_item_'+i+'"]').attr('id');
		}
		/* console.log('td[id^="mid_item_"]로 호출 받은 개수 : '+td_val.length);
		for(var i= 0; i < td_val.length; i++) {
			console.log(i+'번째 td_id에 저장된 값 : '+td_val[i]);
		} */
		
		/* // 중분류 항목의 td태그 id값을 호출하여 변수에 저장
		var td_id = new Array();
		for(var i = 1; i < btnCnt; i++) {
			td_id[(i-1)] = $('td[id^="mid_item_'+i+'"]').attr('id');
		} */
		//console.log('td[id^="mid_item_"]로 호출 받은 개수 : '+td_id.length);
		/* for(var i= 0; i < td_id.length; i++) {
			//console.log(i+'번째 td_id에 저장된 값 : '+td_id[i]);
		} */
		
		
		//console.log('td[id^="detail_item_"]로 호출 받은 개수 : '+dt_id.length);
		/* for(var i= 0; i < dt_id.length; i++) {
			//console.log(i+'번째 dt_id에 저장된 값 : '+dt_id[i]);
		} */
		
		for(var i = 0; i < (btnCnt-1); i++) {
			itemLoad(dt_id[i], td_val[i]);			// detail_item_id, mid_item_value
		}
		
		// 항목 추가 버튼을 클릭하면 ajax 실행
		$(document).on('click', 'input[id^="item_add_"]', function(){
			//var item_add = $(this).parent().parent().
			itemAdd(this);
		});
		
		// 항목 삭제 버튼을 클릭하면 ajax 실행
		$(document).on('click', 'input[id^="item_remove_"]', function(){
			itemRemove(this);
		});
		
		$(document).on('change', 'select', function(){
			var id = $(this).parent().parent().children('td:nth-child(3)').attr('id');
			//console.log('콤보박스 변경시 호출 3번째 td id : '+id);
			var val = $(this).val();
			//console.log("콤보박스 변경시 호출 값 : "+val);
			itemLoad(id, val);
		});
		
		// 로드시 처음 실행하는 세부 항목을 보여주기 위한 함수
		function itemLoad(id, val){
			
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'item_modify.do',
				dataType:'text',
				success:function(msg){
					var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+id+'"]').html(msg);
				}
			});
			
			var parent_code = val;		// 부모 아이템 코드
			//var parnet_code = parent_code.substr(0, (idn.length+4));
			var sendData = 'parent_code='+parent_code;
			//console.log('parent_code ; '+parent_code);
			
			$.ajax({
				data:sendData
			})
			
		}
		
		// 데이터를 추가하는 함수 지정
		function itemAdd(data) {
			
			var id = $(data).parent().parent().children('td:nth-child(3)').attr('id');
			//console.log('itemAdd버튼 클릭시 가져오는 id값 : '+id);
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'item_modify.do',
				dataType:'text',
				success:function(msg){
					var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+id+'"]').html(msg);
				}
			});
			
			// 추가할 데이터 추출 및 변수에 저장
			var add_code = 'new_code';																								// 새로 추가할 아이템 코드
			var add_name = $(data).parent().children('input:first-child').val();											// 새로 추가할 아이템 이름
			var add_parent_code = $(data).parent().parent().children('td:nth-child(2)').children().val();		// 부모 아이템 코드
			var add_level = 3;																											// 레벨
			var add_seq = 0;																											// 해당 순번
			var sendData = 'item_code='+add_code+'&item_name='+add_name+'&parent_code='+add_parent_code+'&item_level='+add_level;
			//console.log('add_code : '+add_code+' / add_name :  '+add_name+' / add_parent_code :  '+add_parent_code+' / add_level : '+add_level+' / add_seq : '+add_seq);
			
			$(data).parent().children('input:first-child').val('');
			
			$.ajax({
				data:sendData
			});
		}
		
		// 데이터를 삭제하는 함수 지정
		function itemRemove(data) {
			
			// 삭제할 데이터의 div id값을 추출하여 변수에 저장
			var id = $(data).parent().parent().children('td:nth-child(3)').attr('id');
			//console.log('itemAdd버튼 클릭시 가져오는 id값 : '+id);
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'item_remove.do',
				dataType:'text',
				success:function(msg){
					//var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+id+'"]').html(msg);
				} ,
				error : function() {
					//alert('사용중인 항목이므로 삭제할 수 없습니다.')
				}
			});
			
			// 삭제할 데이터 추출 및 변수에 저장
			var id = $(data).parent().parent().attr('id');
			var remove_code = 'remove'+$(data).parent().children('input:first-child').val();
			var sendData = 'item_code='+remove_code;
			//var add_code = 'new_code';																								// 새로 추가할 아이템 코드
			//var add_name = $(data).parent().children('input:first-child').val();											// 새로 추가할 아이템 이름
			//var add_parent_code = $(data).parent().parent().children('td:nth-child(2)').children().val();		// 부모 아이템 코드
			//var add_level = 3;																											// 레벨
			//var add_seq = 0;																											// 해당 순번
			//var sendData = 'item_code='+add_code+'&item_name='+add_name+'&parent_code='+add_parent_code+'&item_level='+add_level;
			//console.log('add_code : '+add_code+' / add_name :  '+add_name+' / add_parent_code :  '+add_parent_code+' / add_level : '+add_level+' / add_seq : '+add_seq);
			
			//var reset_id = $(data).parent().children('input:first-child').attr('name');
			//console.log('reset : '+reset_id);
			//$(data).parent().children('input:first-child').val('');
			
			$.ajax({
				data:sendData
			});
		}
		
	})

</script>

</html>