<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="variable.jsp" %>
<%-- <% int btnCnt = 1; %> --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지출 보기</title>
<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="./resources/bootstrap/js/jquery.number.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script type="text/javascript">
	var itemcnt = 0, tradecnt = 0, assetcnt = 0, cardcnt = 0;
	var itemCode = new Array();
	var itemName = new Array();
	var itemLevel = new Array();
	var tradeCode = new Array();
	var tradeName = new Array();
	var assetCode = new Array();
	var assetName = new Array();
	var cardCode = new Array();
	var cardName = new Array();
</script>
<c:forEach items="${ itemList }" var="iList">
	<script type="text/javascript">
		itemCode[itemcnt] = '${ iList.item_code }';
		itemName[itemcnt] = '${ iList.item_name }';
		itemLevel[itemcnt] = '${ iList.item_level }';
		itemcnt++;
	</script>
</c:forEach>
<c:forEach items="${ assetList }" var="asset">
	<script type="text/javascript">
		assetCode[assetcnt] = '${ asset.asset_code }';
		assetName[assetcnt] = '${ asset.asset_name }';
		assetcnt++;
	</script>
</c:forEach>
<c:forEach items="${ tradeList }" var="trade">
	<script type="text/javascript">
		tradeName[tradecnt] = '${ trade.trade_name }';
		tradeCode[tradecnt] = '${ trade.trade_code }';
		tradecnt++;
	</script>
</c:forEach>
<c:forEach items="${ cardList }" var="card">
	<script type="text/javascript">
		cardCode[cardcnt] = '${ card.card_code}';
		cardName[cardcnt] = '${ card.card_name}';
		cardcnt++;
	</script>
</c:forEach>
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
	margin: 170px auto 0 auto;
}

.frame_1080 {
	width: 1080px;
	margin: 170px auto 0 auto;
}

.frame_1200 {
	width: 1200px;
	margin: 170px auto 0 auto;
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
	text-align: right;
}

button {
	height:30px;
	width:50px;
	padding: 0;
	margin:5px 1px;
}

button #rollback {
	margin: 5px 2px 5px 1px;
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
<body>
	<header><jsp:include page="/resources/include/header.jsp"/></header>
	<div class="inner_frame"><jsp:include page="/resources/include/info_header.jsp"/></div>
	<div class="frame_1000">
		<form action="expense_write_ok.do" method="post" class="expenseform" name="expenseform">
			<table class="table table-bordered text-center" id="expense_subject" style="margin-bottom: 0;">
				<ul id="top" style="padding: 0; border: 0; margin: 0;">
					<li id="rollback">
						<button type="reset" id="expense_cancel">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</li>
					<li id="save">
						<button type="submit" id="expense_submit">
							<span class="glyphicon glyphicon-save"></span>
							<!-- <span class="fas fa-database"></span> -->
						</button>
					</li>
					<li id="add">
						<button type="button" id="add_row">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</li>
				</ul>
				<colgroup>
					<col width="150px" />
					<col width="115px" />
					<col width="115px" />
					<col width="100px" />
					<col width="160px" />
					<col width="200px" />
					<col width="100px" />
					<col width="60px" />
				</colgroup>
				<tr id="expense_subject">
					<th>지출일자</th>
					<th colspan="2">분류</th>
					<th>지출유형</th>
					<th>계좌명</th>
					<th>적요</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
			</table>
			<table class="table table-bordered text-center" id="expense_table" style="margin-top: 0;">
				
				<colgroup>
					<col width="150px" />
					<col width="115px" />
					<col width="115px" />
					<col width="100px" />
					<col width="160px" />
					<col width="200px" />
					<col width="100px" />
					<col width="60px" />
				</colgroup>
				
				<c:if test="${ expenseList != null }">
					<c:forEach items="${ expenseList }" var="eList">
						<tr>
							<input type="hidden" id="root_idn_<%= btnCnt %>" name="root_idn" value="${ eList.root_idn }">
							<input type="hidden" id="root_id_<%= btnCnt %>" name="root_id" value="${ eList.root_id }">
							<input type="hidden" id="expense_id_<%= btnCnt %>" name="expense_id" value="${ eList.expense_id }">
							<!-- 지출일자 input 태그 -->
							<td class="text" id="expense_date_<%= btnCnt %>" style="padding: 0;">
								<%-- <c:out value="${ eList.root_idn }" /><c:out value="${ eList.root_id }" /><c:out value="${ eList.expense_id }" /> --%>
								<input type="date" class="modify" id="expense_date_<%= btnCnt %>" name="expense_date" value="${ eList.expense_date }" style="width:149px;">
							</td>
							<%-- 지출 중분류 항목 select 태그 --%>
							<td class="text" id="parent_item_<%= btnCnt %>" style="padding: 0;">
								<input type="hidden" id="children_code_<%= btnCnt %>" value="${ eList.item_code }">
								<select style="width: 113px; height: 50px;" id="parent_code_<%= btnCnt %>" name="parent_code">
									<c:forEach items="${ itemList }" var="item">
										<c:if test="${ item.item_level == 2 }">
											<c:choose>
												<c:when test="${ item.item_code == eList.parent_code }">
													<option id="item_value_<%=btnCnt %>" value="${ item.item_code }" selected="selected">
														<c:out value="${ item.item_name }" />
													</option>
												</c:when>
												<c:when test="${ item.item_code != eList.item_code }">
													<option value="${ item.item_code }">
														<c:out value="${ item.item_name }" />
													</option>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<%-- 지출 세부항목 select 태그 --%>
							<td class="text" id="expense_item_<%= btnCnt %>" style="padding: 0;">
							</td>
							<%-- 지출 거래유형 select 태그 --%>
							<td class="text" id="expense_trade_<%= btnCnt %>" style="padding: 0;">
								<input type="hidden" id="asset_code_<%= btnCnt %>" name="asset_code" value="${ eList.asset_code }">
								<select style="width: 99px; height: 50px;" id="trade_code_<%= btnCnt %>" name="trade_code">
									<c:forEach items="${ tradeList }" var="trade">
										<c:choose>
											<c:when test="${ eList.trade_code == trade.trade_code }">
												<option value="${ trade.trade_code }" selected="selected">
													<c:out value="${ trade.trade_name }" />
												</option>
											</c:when>
											<c:when test="${ eList.trade_code != trade.trade_code }">
												<option value="${ trade.trade_code }">
													<c:out value="${ trade.trade_name }" />
												</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							<%-- 지출 자산 또는 카드 목록 select 태그 --%>
							<td class="text" id="expense_asset_<%= btnCnt %>" style="padding: 0;">
							</td>
							<%-- 지출한 상세 내용을 기록한 input 태그 --%>
							<td class="text" id="expense_discription_<%= btnCnt %>" style="padding: 0; height: 50px;">
								<input type="text" id="expense_discription_<%= btnCnt %>" name="expense_discription" class="modify" value="${ eList.expense_discription }" style="width:199px; line-height:40px;">
							</td>
							<td class="text amount" id="expense_amount_<%= btnCnt %>" style="padding: 0; text-align: right; padding:5px; height: 50px;">
								<input type="text" id="expense_amount_<%= btnCnt %>" name="expense_amount" class="modify" value="${ eList.expense_amount }" numberOnly value="0" style="text-align: right; padding-right: 5px; line-height:35px; margin:0; border:0; width: 89px; font-weight: bold;">
							</td>
							<td class="text" id="expense_remove_<%= btnCnt %>" style="line-height: 50px; padding: 0;">
								<input id="row_remove" type="button" class="white_btn asset_remove" name="asset_remove" value="삭제" style="width:50px; line-height:45px;">
							</td>
						</tr>
						<%
							btnCnt++;
							request.setAttribute("btnCnt", btnCnt);
						%>
					</c:forEach>
				</c:if>
				 
			</table>
		</form>
	</div>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>

<script type="text/javascript">
	$(function() {
		
		/* 오늘 날짜 호출 */
		var now = new Date()							// 현재 날짜
		var curr_date = now.getDate();				// 현재 날짜에서 일자를 추출
		if (curr_date < 9)
			curr_date = "0" + curr_date;				// 현재 날짜에서 일자가 1자리이면 앞에 0을 붙여줌
		var curr_month = now.getMonth() + 1;	// 현재 날짜에서 월을 추출(월은 0부터 시작해서 +1을 해줌)
		if (curr_month < 10)
			curr_month = "0" + curr_month;		// 현재 날짜에서 월이 1자리이면 앞에 0을 붙여줌
		var curr_year = now.getFullYear();			// 현재 날짜에서 년을 추출
		var result = curr_year + "-"
				+ curr_month + "-"	+ curr_date;	// yyyy-MM-dd 형식으로 변환
		
		// 버튼 번호 선언 변수
		var btnCnt = <%= btnCnt %>;
		
		// 지출 분류 항목을 사용하기 위해 선언한 변수
		var parent_sel_val = new Array();
		var children_det_id = new Array();
		var parent_td_id = new Array();
		var children_hdn_val = new Array();
		
		// 지출 유형에 따른 계좌명을 사용하기 위해 선언한 변수
		var trade_val = new Array();
		var asset_input_id = new Array();
		var trade_id = new Array();
		var asset_hdn_val = new Array();
		
		headerFunction();
		
		for(var i = 1; i < btnCnt; i++) {
			parent_sel_val[(i-1)] = $('td[id="parent_item_'+i+'"]').children('select:last-child').val();			// 지출 중분류 항목 코드값
			children_det_id[(i-1)] = $('td[id="expense_item_'+i+'"]').attr('id');											// 지출 세부항목 콤보박스를 삽입하기 위한 id값
			parent_td_id[(i-1)] = $('td[id="parent_item_'+i+'"]').children('input:first-child').attr('id');
			children_hdn_val[(i-1)] = $('td[id="parent_item_'+i+'"]').children('input:first-child').val();			// 지출 세부항목 값
			
			trade_val[(i-1)] = $('td[id="expense_trade_'+i+'"]').children('select:last-child').val();				// 지출 중분류 항목 코드값
			asset_input_id[(i-1)] = $('td[id="expense_asset_'+i+'"]').attr('id');												// 지출 세부항목 콤보박스를 삽입하기 위한 id값
			trade_id[(i-1)] = $('td[id="expense_trade_'+i+'"]').children('input:first-child').attr('id');
			asset_hdn_val[(i-1)] = $('td[id="expense_trade_'+i+'"]').children('input:first-child').val();		// 지출 세부항목 값
		}
		
		for(var i = 0; i < parent_sel_val.length; i++) {
			//console.log("중분류 항목 value : "+parent_sel_val[i]+"  세부항목 id : "+children_det_id[i]+"  자식 아이템 id : "+parent_td_id[i]+"   자식 아이템 value : "+children_hdn_val[i]);
			expenseDetailItemLoad(children_det_id[i], parent_sel_val[i], children_hdn_val[i], (i+1));
			//console.log("trade_val : "+trade_val[i]+"  asset_input_id : "+asset_input_id[i]+"  trade_id : "+trade_id[i]+"   asset_hdn_val : "+asset_hdn_val[i]);
			expenseAssetLoad(asset_input_id[i], trade_val[i], asset_hdn_val[i], (i+1));
		}
		
		//console.log('trade_val : '+trade_val.length+'   asset_input_id : '+asset_input_id.length+'   trade_id : '+trade_id.length+'   asset_hdn_val : '+asset_hdn_val.length)
		/* for(var i = 0; i < trade_val.length; i++) {
			console.log("trade_val : "+trade_val[i]+"  asset_input_id : "+asset_input_id[i]+"  trade_id : "+trade_id[i]+"   asset_hdn_val : "+asset_hdn_val[i]);
			expenseAssetLoad(asset_input_id[i], trade_val[i], asset_hdn_val[i]);
		} */
		
		// 페이지로드시 실행하기 지출 세부항목을 호출하기 위한 함수
		function expenseDetailItemLoad(id, val, chdVal, idNum){	// (삽입할 태그 id, 중분류 코드, 세부항목 코드)
			
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'exp_detail_item.do',
				dataType:'text',
				success:function(msg){
					var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+id+'"]').html(msg);
				}
			});
			//console.log("중분류 항목 value : "+val+"  세부항목 id : "+id+"   자식 아이템 value : "+chdVal);
			var parent_code = val;				// 부모 아이템 코드
			var children_code = chdVal;		// 자식 아이템 코드
			//var parnet_code = parent_code.substr(0, (idn.length+4));
			var sendData = 'parent_code='+parent_code+'&children_code='+children_code+"&id_num="+idNum;
			//console.log('parent_code ; '+parent_code);
			
			$.ajax({
				data:sendData
			})
			
		}
		
		// 페이지로드시 실행하기 지출 세부항목을 호출하기 위한 함수
		function expenseAssetLoad(id, val, chdVal, idNum){			// (삽입할 태그 id, 지출유형 코드, 자산/카드 코드)
			
			if(val == 'cash' || val =='account') {
				// item_modify ajaxSetup 선언
				$.ajaxSetup({
					type:'post',
					url:'exp_detail_asset.do',
					dataType:'text',
					success:function(msg){
						var ssg = msg+'';
						//console.log("ajax 성공 메세지 : "+ssg);
						$('td[id="'+id+'"]').html(msg);
					}
				});
				//console.log("지출유형 코드 value : "+val+"  콤보박스가 들어갈 태그 id : "+id+"   계좌명 value : "+chdVal);
				var trade_code = val;				// 지출/거래 유형 코드
				var asset_code = chdVal;			// 지출 자산 코드
				//var parnet_code = parent_code.substr(0, (idn.length+4));
				var sendData = 'trade_code='+trade_code+'&asset_code='+asset_code+"&id_num="+idNum;
				//console.log('parent_code ; '+parent_code);
				
				$.ajax({
					data:sendData
				})
			} else {
				// item_modify ajaxSetup 선언
				$.ajaxSetup({
					type:'post',
					url:'exp_detail_card.do',
					dataType:'text',
					success:function(msg){
						var ssg = msg+'';
						//console.log("ajax 성공 메세지 : "+ssg);
						$('td[id="'+id+'"]').html(msg);
					}
				});
				//console.log("중분류 항목 value : "+val+"  세부항목 id : "+id+"   자식 아이템 value : "+chdVal);
				var trade_code = val;				// 지출/거래 유형 코드
				var asset_code = chdVal;		// 지출 카드 코드
				//var parnet_code = parent_code.substr(0, (idn.length+4));
				var sendData = 'trade_code='+trade_code+'&asset_code='+asset_code+"&id_num="+idNum;
				//console.log('parent_code ; '+parent_code);
				
				$.ajax({
					data:sendData
				})
			}
		}
		
		// 중분류 콤보박스의 정보가 변경될 경우 작동되는 이벤트 함수
		$(document).on('change', 'select[name="parent_code"]', function(){
			expenseDetailItem(this);
		});
		
		// 지출유형 콤보박스의 정보가 변경될 경우 작동되는 이벤트 함수
		$(document).on('change', 'select[name="trade_code"]', function(){
			//console.log("trade_code이름의 select태그 값 변경");
			expenseDetailAsset(this);
		});
		
		// 세분류 항목이 ajax에 적용될 수 있도록 함수 선언
		function expenseDetailItem(data) {
			
			//var sel_id = $(data).attr('id');
			//var hi_sel_id = $(data).parent().attr('id');
			var sel_val = $(data).val();																				// select에 적용되어 있는 value값 변수에 저장
			var det_id = $(data).parent().parent().children('td:nth-child(6)').attr('id');				// ajax파일을 삽입할 td 태그 이름 
			
			//console.log("분류 select id : "+sel_id+"   분류 select value : "+sel_val+"   상위 td태그 id : "+hi_sel_id+"  세분류 select id : "+det_id);
			// ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'exp_detail_item.do',
				dataType:'text',
				success:function(msg){
					$('td[id="'+det_id+'"]').html(msg);
				}
			});
			
			var sendData = 'parent_code='+sel_val;
			
			$.ajax({
				data:sendData
			})
			
		}
		
		// 세분류 항목이 ajax에 적용될 수 있도록 함수 선언
		function expenseDetailAsset(data) {
			
			var sel_id = $(data).attr('id');
			var hi_sel_id = $(data).parent().attr('id');
			var sel_val = $(data).val();																				// select에 적용되어 있는 value값 변수에 저장
			var det_id = $(data).parent().parent().children('td:nth-child(8)').attr('id');				// ajax파일을 삽입할 td 태그 이름 
			
			//console.log("분류 select id : "+sel_id+"   분류 select value : "+sel_val+"   상위 td태그 id : "+hi_sel_id+"  세분류 select id : "+det_id);
			if(sel_val == 'cash' || sel_val == 'account') {
				// ajaxSetup 선언
				$.ajaxSetup({
					type:'post',
					url:'exp_detail_asset.do',
					dataType:'text',
					success:function(msg){
						$('td[id="'+det_id+'"]').html(msg);
					}
				});
				
				var sendData = 'trade_code='+sel_val;
				
				$.ajax({
					data:sendData
				})
			} else {
				// ajaxSetup 선언
				$.ajaxSetup({
					type:'post',
					url:'exp_detail_card.do',
					dataType:'text',
					success:function(msg){
						$('td[id="'+det_id+'"]').html(msg);
					}
				});
				
				var sendData = 'trade_code='+sel_val;
				
				$.ajax({
					data:sendData
				})
			}
			
		}

		$(document).on('click', '#add_row', function(){
			var value = row_add();
			expenseDetailItemLoad(value[0], value[1], value[2], value[6])		// (삽입할 태그 id, 중분류 코드, 세부항목 코드)
			expenseAssetLoad(value[3], value[4], value[5], value[6])				// (삽입할 태그 id, 지출유형 코드, 자산/카드 코드)
		});
		
		// 자산 목록 행 추가하는 함수
		function row_add(){
			var value = new Array();   // (아이템 삽입할 태그 id, 중분류 코드, 세부항목 코드, 자산 삽입할 태그 id, 지출유형 코드, 자산/카드 코드)
			value[0] = 'expense_item_'+btnCnt;		// 아이템 삽입할 태그 id
			value[1] = '1e003000';							// 초기 중분류 코드
			value[2] = '1e003002';							// 세부 항목 코드
			value[3] = 'expense_asset_'+btnCnt;		// 자산 삽입할 태그 id
			value[4] = 'cash';								// 지출 유형 코드
			value[5] = '1cs001';								// 자산/카드 코드
			value[6] = btnCnt;								// 아이디 번호
			
			var rowItem = "<tr>"
			rowItem += '<input type="hidden" id="root_idn_'+btnCnt+'" name="root_idn" value="${ root_Idn }">';
			rowItem += '<input type="hidden" id="root_id_'+btnCnt+'" name="root_id" value="${ root_Id }">';
			rowItem += '<input type="hidden" id="expense_id_'+btnCnt+'" name="expense_id" value="new_code">';
			/* 지출 일자를 입력할 input date 태그 */
			rowItem += '<td class="text" style="padding: 0;"><input type="date" class="modify" id="expense_date_'+btnCnt+'" name="expense_date" value="'+result+'" style="width:149px;"></td>';
			
			/* 지출 중분류 항목을 지정할 select 태그 */
			rowItem += '<td class="text" id="parent_item_'+btnCnt+'" style="padding: 0;"><select style="width: 113px; height: 50px;" id="high_item_code_'+btnCnt+'" name="parent_code">';
			for(var i = 0; i < itemCode.length; i++) {
				if(itemLevel[i] == 2) {	
					if(itemCode[i] == '1e003000') {
						rowItem += '<option value="'+itemCode[i]+'" selected="selected">'+itemName[i]+'</option>';
					} else {
						rowItem += '<option value="'+itemCode[i]+'">'+itemName[i]+'</option>';
					}
				}
			}
			rowItem += '</select></td>';
			
			/* 지출 세부항목을 지정할 select 태그 */
			rowItem += '<td class="text" id="expense_item_'+btnCnt+'" style="padding: 0;"></td>';
			
			/* 지출 거래유형을 지정할 select 태그 */
			rowItem += '<td class="text" id="expense_trade_'+btnCnt+'" style="padding: 0;"><select style="width: 99px; height: 50px;" id="trade_code_'+btnCnt+'" name="trade_code">';
			for(var i = 0; i < tradeCode.length; i++) {
				if(tradeCode[i] == 'cash') {
					rowItem += '<option value="'+tradeCode[i]+'" selected="selected">'+tradeName[i]+'</option>';
				} else {
					rowItem += '<option value="'+tradeCode[i]+'">'+tradeName[i]+'</option>';
				}
			}
			rowItem += '</select></td>';
			
			/* 지출할 자산계좌/카드 목록을 보여줄 select 태그 */
			rowItem += '<td class="text" id="expense_asset_'+btnCnt+'"style="padding: 0;"></td>';
			rowItem += '<td class="text" style="padding: 0;"><input type="text" id="expense_discription_'+btnCnt+'" name="expense_discription" class="modify" style="width:199px; line-height:40px;" placeholder="상세 지출 정보 입력"></td>';
			rowItem += '<td class="text amount" style="padding: 0; text-align: right; padding:5px; "><input type="text" id="expense_amount'+btnCnt+'" name="expense_amount" class="modify" numberOnly value="0" style="text-align: right; padding-right: 5px; line-height:40px; margin:0; border:0; width: 89px; font-weight:bold;"></td>'
			rowItem += '<td class="text" id="expense_remove_'+btnCnt+'" style="line-height: 50px; padding: 0;"><input id="row_remove" type="button" class="white_btn expense_remove'+btnCnt+'" name="expense_remove" value="삭제" style="width:50px; line-height:45px;"></td>';
			
			btnCnt++;
			$('#expense_table').prepend(rowItem)
			
			return value;
		}
		
		// 체크박스 체크여부에 따른 값 설정 함수
		$(document).on("change", 'input', function(){
			var cname =$(this).attr('id');
			var cnum = cname.substr(10);
			//console.log("클래스번호 : "+cnum);
			if($("#asset_use_"+cnum).is(":checked")) {
				$('#check_result_'+cnum).val('Y');
				console.log("체크했음");
			} else {
				$('#check_result_'+cnum).val('N');
				console.log("체크해제");
			}
			//console.log("체크박스 값 : "+$('#check_result_'+cnum).val());
		})
		
		// label에 숫자가 입력된 값을 클릭하면 input태그로 전환하는 함수
		$(document).on('click', 'label[class="input"]', function() {
			var val = $(this).text();
			var td_id = $(this).parent().attr('id');
			val = val.replace(',', '');
			var num = Number(val);
			var btnNum = td_id.substr(15);
			//console.log('val자료형 : '+typeof(val)+' / label_value : '+val+' / parent_id : '+td_id);
			//var parent_id = $('td[id="'+val+'"]').attr('id');
			var parent_id = $('td[id="'+td_id+'"]').attr('id');
			//console.log('parent_id : '+parent_id);
			var input = '<b><input type="text" id="expense_amount'+btnNum+'" name="expense_amount" class="modify" value="'+num+'" numberOnly value="0" style="text-align: right; padding-right: 5px; line-height:35px; margin:0; border:0; width: 95px;"></b>';
			$(this).remove();
			$('td[id="'+td_id+'"]').append(input).trigger('create');
			//$('input[id="expense_amount_'+btnNum+'"]')
			$('input[id="expense_amount_'+btnNum+'"]').trigger('focus');
			
		})
		
		// td영역을 클릭하면 해당 정보를 보여주는 함수
		$(document).on('click', 'td', function() {
			var id = $(this).children().attr('id');
			var val = $(this).children().val();
			var txt = $(this).children().text();
			console.log('id : '+id+' / text : '+ txt+ ' / value : '+val);
		});
		
		// 클릭시 td영역을 삭제하는 구문
		$(document).on("click", "#row_remove", function() {
			var cmd = 'remove';
			cmd += $(this).parent().parent().children('input:nth-child(3)').val();
			console.log("remove_click : "+cmd);
			var rowRemove = '<input type="hidden" name="expense_remove" value="'+cmd+'">';
			console.log(rowRemove);
			$('#expense_table').append(rowRemove).trigger('create');
			$(this).parent().parent().remove();
			
		});
		
		// input태그가 활성화되어 있을 경우 클래스를 추가해주는 구문
		$(document).on('focus', 'input', function() {
			$(this).addClass('input-control');
			var txt = $(this).text();
			console.log(txt);
		})
		
		// input태그가 비활성화되어 있을 경우 클래스를 삭제해주는 구문
		$(document).on('blur', 'input', function() {
			$(this).removeClass('input-control');
			var txt = $(this).text();
			console.log(txt);
		})
		
		// rollback 버튼을 클릭하면 아무런 정보 없이 지출 목록을 불러오기
		$(document).on('click', '#expense_cancel', function(){
			location.href="expense_list.do";
		});
		
		/**
		 * jquery.number.js 라이브러리 추가
		 * input 숫자와 콤마만 입력되게 하기.
		 * input 속성에 numberOnly 추가
		 * jsp : <input type="text" id="amount" name="amount" numberOnly placeholder="0" />
		 * $(this).number(true);
		 * $.number( 5020.2364 );				// Outputs 5,020
		 * $.number( 5020.2364, 2 );			// Outputs: 5,020.24
		 * $.number( 135.8729, 3, ',' );		// Outputs: 135,873
		 * $.number( 5020.2364, 1, ',', ' ' );	// Outputs: 5 020,2 
		 */
		 
		$(document).on("keyup", "input:text[numberOnly]", function() {
			$(this).number(true);
		});
		
		
	})

</script>

</html>