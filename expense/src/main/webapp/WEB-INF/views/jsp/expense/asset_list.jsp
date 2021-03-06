<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
int btnCnt = 1;
%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자산 내역 보기</title>
<script type="text/javascript" src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="./resources/bootstrap/js/jquery.number.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script type="text/javascript">
	var tradecnt = 0, tcodecnt = 0, bankcnt = 0, bcodecnt = 0;
	var tradeList = new Array();
	var tcodeList = new Array();
	var bankList = new Array();
	var bcodeList = new Array();
</script>
<c:forEach items="${ trade }" var="trade">
	<script type="text/javascript">
		tradeList[tradecnt++] = "${ trade.trade_name }";
		tcodeList[tcodecnt++] = "${ trade.trade_code }";
	</script>
</c:forEach>
<c:forEach items="${ bank }" var="bank">
	<script type="text/javascript">
		bankList[bankcnt++] = "${ bank.bank_name }";
		bcodeList[bcodecnt++] = "${ bank.bank_code }";
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

tr:NTH-OF-TYPE(2n) {
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
	<header><jsp:include page="/resources/include/header.jsp" /></header>
	<div class="inner_frame"><jsp:include page="/resources/include/info_header.jsp"/></div>
	<form action="asset_write_ok.do" method="post" class="assetform" name="assetform">
		<div class="frame_1000">
			<table class="table table-bordered text-center" style="margin-bottom: 0;">
				<ul id="top" style="padding: 0; border: 0; margin: 0;">
					<li id="rollback">
						<button type="reset" id="asset_cancel">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</li>
					<li id="save">
						<button type="submit" id="asset_submit">
							<span class="glyphicon glyphicon-save"></span>
						</button>
					</li>
					<li id="add">
						<button type="button" id="add_row">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</li>
				</ul>
				<colgroup>
					<col width="180px" />
					<col width="180px" />
					<col width="130px" />
					<col width="80px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="60px" />
				</colgroup>
				<thead>
					<tr>
						<th style="line-height: 40px;">계좌명</th>
						<th style="line-height: 40px;">용도</th>
						<th style="line-height: 40px;">시작일자</th>
						<th style="line-height: 40px;">자산유형</th>
						<th style="line-height: 40px;">거래은행</th>
						<th style="line-height: 40px;">초기 금액</th>
						<th style="line-height: 40px;">현재 잔액</th>
						<th style="line-height: 40px;">사용함</th>
						<th style="line-height: 40px;">삭제</th>
					</tr>
				</thead>
			</table>
			<table id="asset_add" class="table table-bordered text-center" style="margin-top: 0;">
				<colgroup>
					<col width="180px" />
					<col width="180px" />
					<col width="130px" />
					<col width="80px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="60px" />
				</colgroup>
				<tbody id="asset_table">
					<c:forEach items="${ assetList }" var="asset">
						
						<tr id="asset_list_<%= btnCnt %>">
							<input type="hidden" name="root_idn" id="root_idn_<%= btnCnt %>" value="${ root_Idn }">
							<input type="hidden" name="root_id" id="root_id_<%= btnCnt %>" value="${ root_Id }">
							<input type="hidden" name="asset_code" id="asset_code_<%= btnCnt %>" value="${ asset.asset_code }">
							<td class="text" style="padding: 0;">
								<input type="text" id="asset_name_<%= btnCnt %>" class="modify asset_name" name="asset_name" value="${ asset.asset_name }" style="line-height: 40px; width: 179px;">
							</td>
							
							<td class="text" style="padding: 0;">
								<input type="text" id="asset_purpose_<%= btnCnt %>" class="modify asset_purpose" name="asset_purpose" value="${ asset.asset_purpose }" style="line-height: 40px; width: 179px;">
							</td>
							
							<td class="date" style="padding: 0;">
								<input type="date" id="asset_date_<%= btnCnt %>" class="asset_date" name="asset_date" value="${ asset.asset_date }" size="20" style="line-height: 40px; width: 129px;">
							</td>
							
							<td class="text" id="trade_frame_<%= btnCnt %>" style="padding: 0;">
								<select id="trade_code_<%= btnCnt %>" class="trade_code" name="trade_code" style="width: 79px; height: 50px;">
									<c:forEach items="${ trade }" var="trade">
										<c:choose>
											<c:when test="${ trade.trade_name == asset.trade_name }">
												<option value="${ trade.trade_code }" selected="selected">
													<c:out value="${ trade.trade_name }" />
												</option>
											</c:when>
											<c:when test="${ trade.trade_name != asset.trade_name }">
												<option value="${ trade.trade_code }">
													<c:out value="${ trade.trade_name }" />
												</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							
							<%-- 거래 계좌 목록을 보여주는 영역으로 ajax로 사용 --%>
							<td class="text" id="bank_frame_<%= btnCnt %>" style="padding: 0;">
								<input type="hidden" id="bank_code_<%= btnCnt %>" name="bank_code" value="${ asset.bank_code }">
							</td>
							
							<td class="amount" id="basic_frame_<%= btnCnt %>"style="padding: 0;">
								<b>
									<input type="text" class="modify basic_amount" id="basic_amount_<%= btnCnt %>" name="basic_amount" numberOnly value="${ asset.basic_amount }" style="text-align: right; padding-right: 5px; line-height: 40px; width: 89px;">
								</b>
							</td>
							
							<td class="amount" style="padding: 0;">
								<label class="amount" style="line-height: 45px; width:89px;">
									<fmt:formatNumber value="${ asset.now_amount }" groupingUsed="true" />
								</label>
							</td>
							
							<td class="text" id="use_frame_<%= btnCnt %>" style="line-height: 45px; padding: 0; width: 89px;">
								<c:choose>
									<c:when test="${ asset.asset_use == 'Y' }">
										<input id="asset_use_<%= btnCnt %>" type="checkbox" name="checked" class="asset_use" checked="checked">사용중
										<input type="hidden" id="check_result_<%= btnCnt %>" class="check_result" name="asset_use" value="Y">
									</c:when>
									<c:when test="${ asset.asset_use == 'N' }">
										<input id="asset_use_<%= btnCnt %>" type="checkbox" name="checked" class="asset_use">사용중
										<input type="hidden" id="check_result_<%= btnCnt %>" class="check_result" name="asset_use">
									</c:when>
								</c:choose>
								
							</td>
							
							<td class="text" style="line-height: 45px; padding: 0;">
								<button type="button" id="row_remove_<%= btnCnt %>" class="white_btn asset_remove" name="asset_remove" style="width:59px; height:40px;">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
							</td>
						</tr>
						<% btnCnt++; %>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</form>
	<footer>
		<jsp:include page="/resources/include/footer.jsp" />
	</footer>
</body>

<script type="text/javascript">
	$(function() {
		
		// 버튼 번호 선언 변수
		var btnCnt = <%= btnCnt %>;
		
		// ajax로 사용할 id값, value값, code값을 변수 선언
		var assetTagId = new Array();
		var assetCodeVal = new Array();
		var bankTagId = new Array();
		var bankCodeVal = new Array();
		var useTagId = new Array();
		var useCodeVal = new Array();
		
		headerFunction();
		
		for(var i = 1; i < btnCnt; i++) {
			assetTagId[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(7)').attr('id');
			assetCodeVal[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(7)').children().val();
			bankTagId[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(8)').attr('id');
			bankCodeVal[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(8)').children('input:first-child').val();
			useTagId[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(11)').attr('id');
			useCodeVal[(i-1)] = $('tr[id^="asset_list_'+i+'"]').children('td:nth-child(11)').children().val();
		}
		
		for(var i = 0; i < assetTagId.length; i++) {
			//console.log('assetTagId : '+assetTagId[i]+' / assetCodeVal : '+assetCodeVal[i]+' / bankTagId : '+bankTagId[i]+' / bankCodeVal : '+bankCodeVal[i]);
			//console.log('useTagId : '+useTagId[i]+' / useCodeVal : '+useCodeVal[i]);
			defaultBankLoad(bankTagId[i], assetCodeVal[i], bankCodeVal[i]);
		}
		
		 // 항목추가 버튼 클릭시 아래로 행 추가 이벤트
		$(document).on('click', '#add_row', function(){
			row_add();
		});
		
		$(document).on('change', 'select[name="trade_code"]', function(){
			changeAssetBank(this);
		})
		
		// 사용함에서 
		function defaultBankLoad(bankId, tradeCode, bankCode) {
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'asset_detail_bank.do',
				dataType:'text',
				success:function(msg){
					var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+bankId+'"]').html(msg);
				}
			});
			//console.log("bankId : "+bankId+"  tradeCode : "+tradeCode+"   bankCode : "+bankCode);
			//var trade_code = trdCode;				// 거래 유형 코드 값
			//var asset_code = asstCode;				// 자산 코드 값
			//var parnet_code = parent_code.substr(0, (idn.length+4));
			var sendData = 'trade_code='+tradeCode+'&bank_code='+bankCode;
			//console.log('parent_code ; '+parent_code);
			
			$.ajax({
				data:sendData
			})
		}
		
		
		// 태그가 생성되고 거래은행 정보가 자산유형에 따라 정보가 변경되는 함수
		function defaultBankLoad(bankId, tradeCode, bankCode) {
			// item_modify ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'asset_detail_bank.do',
				dataType:'text',
				success:function(msg){
					var ssg = msg+'';
					//console.log("ajax 성공 메세지 : "+ssg);
					$('td[id="'+bankId+'"]').html(msg);
				}
			});
			//console.log("bankId : "+bankId+"  tradeCode : "+tradeCode+"   bankCode : "+bankCode);
			//var trade_code = trdCode;				// 거래 유형 코드 값
			//var asset_code = asstCode;				// 자산 코드 값
			//var parnet_code = parent_code.substr(0, (idn.length+4));
			var sendData = 'trade_code='+tradeCode+'&bank_code='+bankCode;
			//console.log('parent_code ; '+parent_code);
			
			$.ajax({
				data:sendData
			})
		}
		
		// 
		
		
		// 자산 목록 행 추가하는 함수
		function row_add(){
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
			
			var rowItem = "<tr>"
			rowItem += '<input type="hidden" name="root_idn" id="root_idn_'+btnCnt+'" value="${ root_Idn }">';
			rowItem += '<input type="hidden" name="root_id" id="root_id_'+btnCnt+'" value="${ root_Id }">';
			rowItem += '<input type="hidden" id="asset_code" id="asset_code_'+btnCnt+'" name="asset_code" value="new_code">';
			rowItem += '<td class="text" style="padding:0;">';
			rowItem += '<input type="text" id="asset_name_'+btnCnt+'" class="modify" name="asset_name" size="20" ';
			rowItem += 'style="line-height: 40px; width:179px;" placeholder="계좌 이름 기입"></td>';
			rowItem += '<td class="text" style="padding:0;">';
			rowItem += '<input type="text" id="asset_purpose_'+btnCnt+'" class="modify" name="asset_purpose" size="20" ';
			rowItem += 'style="line-height: 40px; width:179px;" placeholder="계좌 용도 기입"></td>';
			rowItem += '<td class="date" style="padding:0;">';
			rowItem += '<input type="date" id="asset_date_'+btnCnt+'" class="modify" name="asset_date" size="20" ';
			rowItem += 'value="'+result+'"style="line-height: 40px; width: 129px;"></td>';
			rowItem += '<td class="text" id="trade_frame_'+btnCnt+'" style="padding: 0;">';
			rowItem += '<select id="trade_code_'+btnCnt+'" name="trade_code" style="width:79px; height:50px;">';
			for(var i = 0; i < tcodeList.length; i++) {
				if(tcodeList[i] == 'cash') {
					rowItem +='<option value="'+tcodeList[i]+'" selected="selected">'+tradeList[i]+'</option>';
				} else {
					rowItem +='<option value="'+tcodeList[i]+'">'+tradeList[i]+'</option>';
				}
			}
			rowItem += '</select></td>';
			rowItem += '<td class="text" id="bank_frame_'+btnCnt+'" style="padding: 0;"></td>';
			rowItem += '<td class="amount" id="basic_frame_'+btnCnt+'"style="padding: 0;">';
			rowItem += '<b><input type="text" id="basic_amount_'+btnCnt+'" class="modify" value="0" name="basic_amount" ';
			rowItem += 'numberOnly id="basic_amount" style="text-align: right; padding-right: 5px; line-height: 40px; width: 89px;"></b></td>';
			rowItem += '<td class="text" style="padding:0;"></td>';
			rowItem += '<td class="text" id="use_frame_'+btnCnt+'" style="line-height: 45px; padding: 0; width:89px;">';
			rowItem += '<input type="checkbox" id="asset_use_'+btnCnt+'" class="modify" name="checked" checked="checked">';
			rowItem += '사용중<input type="hidden" id="check_result_'+btnCnt+'" class="check_result" name="asset_use" value="Y"></td>';
			rowItem += '<td class="text" style="line-height: 45px; padding: 0; width: 59px;">';
			rowItem += '<button type="button" id="row_remove_'+btnCnt+'" class="white_btn asset_remove" name="asset_remove" ';
			rowItem += 'style="width:39px; height:40px;"><span class="glyphicon glyphicon-remove"></span></button></td></tr>'
			rowItem += "</tr>"
			
			$('#asset_add').prepend(rowItem);
			
			defaultBankLoad(('bank_frame_'+btnCnt), 'cash', 'money');
			
			btnCnt++;
		 }
		
		// 세분류 항목이 ajax에 적용될 수 있도록 함수 선언
		function changeAssetBank(data) {
			
			var sel_val = $(data).val();																				// select에 적용되어 있는 value값 변수에 저장
			var det_id = $(data).parent().parent().children('td:nth-child(8)').attr('id');				// ajax파일을 삽입할 td 태그 이름 
			
			//console.log("분류 select id : "+sel_id+"   분류 select value : "+sel_val+"   상위 td태그 id : "+hi_sel_id+"  세분류 select id : "+det_id);
			// ajaxSetup 선언
			$.ajaxSetup({
				type:'post',
				url:'asset_detail_bank.do',
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
		 
		// 체크박스 체크여부에 따른 값 설정 함수
		$(document).on("change", 'input', function(){
			var cname =$(this).attr('id');
			var cnum = cname.substr(10);
			//console.log("클래스번호 : "+cnum);
			if($("#asset_use_"+cnum).is(":checked")) {
				$('#check_result_'+cnum).val('Y');
				//console.log("체크했음");
			} else {
				$('#check_result_'+cnum).val('N');
				//console.log("체크해제");
			}
			//console.log("체크박스 값 : "+$('#check_result_'+cnum).val());
		})
		
		// 체크박스 체크여부에 따른 값 설정 함수
		function checkResult(){
			 var cname =$(this).attr('id');
				var cnum = cname.substr(10);
				//console.log("클래스번호 : "+cnum);
				if($("#asset_use_"+cnum).is(":checked")) {
					$('#check_result_'+cnum).val('Y');
					//console.log("체크했음");
				} else {
					$('#check_result_'+cnum).val('N');
					//console.log("체크해제");
				}
				//console.log("체크박스 값 : "+$('#check_result_'+cnum).val());
		 }
		
		// td영역을 클릭하면 해당 정보를 보여주는 함수
		$(document).on('click', 'td', function() {
			var txt = $(this).children().val();
			//console.log(txt);
		});
	
		$(document).on("click", 'button[id^="row_remove_"]', function() {
			var cmd = 'remove';
			cmd += $(this).parent().parent().children('input:nth-child(3)').val();
			//console.log("remove_click : "+cmd);
			var rowRemove = '<input type="hidden" name="asset_remove" value="'+cmd+'">';
			//console.log(rowRemove);
			$('#asset_table').append(rowRemove).trigger('create');
			$(this).parent().parent().remove();
			
		});
		
		$(document).on('focus', '.modify', function() {
			$(this).addClass('input-control');
			var txt = $(this).children().children().text();
			//console.log(txt);
		})
		
		$(document).on('blur', '.modify', function() {
			$(this).removeClass('input-control');
			var txt = $(this).children().children().text();
			//console.log(txt);
		})
		
		$(document).on('click', '#rollback', function(){
			// 이전화면이 아닌 자산 목록으로 가기 위한 코딩 필요
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

		// rollback 버튼을 클릭하면 아무런 정보 없이 지출 목록을 불러오기
		$(document).on('click', '#asset_cancel', function(){
			/* var form = document.createElement("form");     
			form.setAttribute("method", "post");                    
			form.setAttribute("action", "asset_list.do");        
			document.body.appendChild(form);
			
			form.submit(); */
			location.href="asset_list.do";
		})
		
	})

</script>

</html>
