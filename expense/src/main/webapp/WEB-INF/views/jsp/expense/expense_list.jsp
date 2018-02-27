<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% int btnCnt = 1; %>

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
	margin: 0 auto;
}

.frame_1080 {
	width: 1080px;
	margin: 0 auto;
}

.frame_1200 {
	width: 1200px;
	margin: 0 auto;
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
/* .asset_list:HOVER {
			background-color: #9FA0A1;
			color: white;
		} */
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
	아이디 : ${ user.root_id } / 이름 : ${ user.root_name }회원님 반갑습니다.<br>
	고유번호 : ${ user.root_idn } / 이메일 : ${ user.root_email } 입니다.<br>
	<a href="item_list.do">분류항목 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="item_write.do">분류항목 입력</a>&nbsp;&nbsp;&nbsp;
	<a href="expense_list.do">지출 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="expense_write.do">지출 입력</a>&nbsp;&nbsp;&nbsp;
	<a href="asset_list.do">자산 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="asset_write.do">자산 입력</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_list.do">대출 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_write.do">대출 입력</a>&nbsp;&nbsp;&nbsp;
	<a href="card_list.do">카드 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="card_write.do">카드 입력</a>
	
	<form action="expense_write_ok.do" method="post" class="expenseform" name="expenseform">
		<div class="frame_1080">
			<table class="table table-bordered text-center" id="expense_table">
				<ul id="top" style="padding: 0; border: 0; margin: 0;">
					<li id="subject" style="line-height: 30px;">
						<b>지출관리하기</b>
					</li>
					<li id="add">
						<b><input type="button" class="white_btn" id="add_row" value="항목추가" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
					<li id="rollback">
						<b><input type="reset" class="white_btn" id="expense_cancel" value="취소" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
					<li id="save">
						<b><input type="submit" class="white_btn" id="expense_submit" value="저장" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
				</ul>
				<colgroup>
					<col width="150px" />
					<col width="115px" />
					<col width="135px" />
					<col width="100px" />
					<col width="160px" />
					<col width="240px" />
					<col width="100px" />
					<col width="80px" />
				</colgroup>
				<tr>
					<th>지출일자</th>
					<th colspan="2">분류</th>
					<th>지출유형</th>
					<th>계좌명</th>
					<th>적요</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
				
				<c:if test="${ expenseList != null }">
					<c:forEach items="${ expenseList }" var="eList">
						<tr>
							<input type="hidden" id="root_idn_<%= btnCnt %>" name="root_idn" value="${ eList.root_idn }">
							<input type="hidden" id="root_id_<%= btnCnt %>" name="root_id" value="${ eList.root_id }">
							<input type="hidden" id="expense_id_<%= btnCnt %>" name="expense_id" value="${ eList.expense_id }">
							<!-- 지출일자 input 태그 -->
							<td class="text" id="expense_date_<%= btnCnt %>" style="padding: 0;">
								<%-- <c:out value="${ eList.root_idn }" /><c:out value="${ eList.root_id }" /><c:out value="${ eList.expense_id }" /> --%>
								<input type="date" class="modify" id="expense_date_<%= btnCnt %>" name="expense_date" value="${ eList.expense_date }" style="width:145px;">
							</td>
							<!-- 지출 중분류 항목 select 태그 -->
							<td class="text" id="parent_item_<%= btnCnt %>" style="padding: 0;">
								<select style="width: 110px; height: 50px;" id="parent_code_<%= btnCnt %>" name="parent_code">
									<c:forEach items="${ itemList }" var="item">
										<c:if test="${ item.item_level == 2 }">
											<c:choose>
												<c:when test="${ item.item_code == eList.parent_code }">
													<option value="${ item.item_code }" selected="selected">
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
							<!-- 지출 세부항목 select 태그 -->
							<td class="text" id="expense_item_<%= btnCnt %>" style="padding: 0;">
								<select style="width: 130px; height: 50px;" id="item_code_<%= btnCnt %>" name="item_code">
									<c:forEach items="${ itemList }" var="item">
										<c:if test="${ item.item_level == 3 }">
											<c:choose>
												<c:when test="${ item.item_code == eList.item_code }">
													<option value="${ item.item_code }" selected="selected">
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
							<!-- 지출 거래유형 select 태그 -->
							<td class="text" id="expense_trade_<%= btnCnt %>" style="padding: 0;">
								<select style="width: 95px; height: 50px;" id="trade_code_<%= btnCnt %>" name="trade_code">
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
							<!-- 지출 자산 또는 카드 목록 select 태그 -->
							<td class="text" id="expense_asset_<%= btnCnt %>" style="padding: 0;">
								<select style="width: 155px; height: 50px;" id="asset_code_<%= btnCnt %>" name="asset_code">
									<c:forEach items="${ assetList }" var="asset">
										<c:choose>
											<c:when test="${ eList.asset_code == asset.asset_code }">
												<option value="${ asset.asset_code }" selected="selected">
													<c:out value="${ asset.asset_name }" />
												</option>
											</c:when>
											<c:when test="${ eList.asset_code != asset.asset_code }">
												<option value="${ asset.asset_code }">
													<c:out value="${ asset.asset_name }" />
												</option>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:forEach items="${ cardList }" var="card">
										<c:choose>
											<c:when test="${ eList.asset_code == card.card_code }">
												<option value="${ card.card_code }" selected="selected">
													<c:out value="${ card.card_name }" />
												</option>
											</c:when>
											<c:when test="${ eList.asset_code != card.card_code }">
												<option value="${ card.card_code }">
													<c:out value="${ card.card_name }" />
												</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							<!-- 지출한 상세 내용을 기록한 input 태그 -->
							<td class="text" id="expense_discription_<%= btnCnt %>" style="padding: 0; height: 50px;">
								<input type="text" id="expense_discription_<%= btnCnt %>" name="expense_discription" class="modify" value="${ eList.expense_discription }" style="width:235px; line-height:40px;">
							</td>
							<td class="text amount" id="expense_amount_<%= btnCnt %>" style="padding: 0; text-align: right; padding:5px; height: 50px;">
								<b><input type="text" id="expense_amount_<%= btnCnt %>" name="expense_amount" class="modify" value="${ eList.expense_amount }" numberOnly value="0" style="text-align: right; padding-right: 5px; line-height:35px; margin:0; border:0; width: 95px;"></b>
							</td>
							<td class="text" id="expense_remove_<%= btnCnt %>" style="line-height: 50px; padding: 0;">
								<input id="row_remove" type="button" class="white_btn asset_remove" name="asset_remove" value="삭제" style="width:75px; line-height:45px;">
							</td>
						</tr>
						<% btnCnt++; %>
					</c:forEach>
				</c:if>
				 
			</table>
		</div>
	</form>
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
		
		// 자산 목록 행 추가하는 함수
		$('#add_row').click(function() {
			
			var rowItem = "<tr>"
			rowItem += '<input type="hidden" id="root_idn_'+btnCnt+'" name="root_idn" value="${ user.root_idn }">';
			rowItem += '<input type="hidden" id="root_id_'+btnCnt+'" name="root_id" value="${ user.root_id }">';
			rowItem += '<input type="hidden" id="expense_id_'+btnCnt+'" name="expense_id" value="new_code">';
			/* 지출 일자를 입력할 input date 태그 */
			rowItem += '<td class="text" style="padding: 0;"><input type="date" class="modify" id="expense_date_'+btnCnt+'" name="expense_date" value="'+result+'" style="width:145px;"></td>';
			/* 지출 중분류 항목을 지정할 select 태그 */
			rowItem += '<td class="text" style="padding: 0;"><select style="width: 110px; height: 50px;" id="high_item_code_'+btnCnt+'" name="parent_code">';
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
			rowItem += '<td class="text" style="padding: 0;"><select style="width: 130px; height: 50px;" id="item_code_'+btnCnt+'" name="item_code">';
			for(var i = 0; i < itemCode.length; i++) {
				if(itemLevel[i] == 3) {
					if(itemCode[i] == '1e003002') {
						rowItem += '<option value="'+itemCode[i]+'" selected="selected">'+itemName[i]+'</option>';
					} else {
						rowItem += '<option value="'+itemCode[i]+'">'+itemName[i]+'</option>';
					}
				}
			}
			rowItem += '</select></td>';
			/* 지출 거래유형을 지정할 select 태그 */
			rowItem += '<td class="text" style="padding: 0;"><select style="width: 95px; height: 50px;" id="trade_code_'+btnCnt+'" name="trade_code">';
			for(var i = 0; i < tradeCode.length; i++) {
				if(tradeCode[i] == 'cash') {
					rowItem += '<option value="'+tradeCode[i]+'" selected="selected">'+tradeName[i]+'</option>';
				} else {
					rowItem += '<option value="'+tradeCode[i]+'">'+tradeName[i]+'</option>';
				}
			}
			rowItem += '</select></td>';
			/* 지출할 자산계좌/카드 목록을 보여줄 select 태그 */
			rowItem += '<td class="text" style="padding: 0;"><select style="width: 155px; height: 50px;" id="asset_code_'+btnCnt+'" name="asset_code">';
			for(var i = 0; i < assetCode.length; i++) {
				if(assetCode[i] == '1cs001') {
					rowItem += '<option value="'+assetCode[i]+'" selected="selected">'+assetName[i]+'</option>';
				} else {
					rowItem += '<option value="'+assetCode[i]+'">'+assetName[i]+'</option>';
				}
			}
			for(var i = 0; i < cardCode.length; i++) {
				if(assetCode[i] == '1cs001') {
					rowItem += '<option value="'+cardCode[i]+'" selected="selected">'+cardName[i]+'</option>';
				} else {
					rowItem += '<option value="'+cardCode[i]+'">'+assetName[i]+'</option>';
				}
			}
			rowItem += '</select></td>';
			rowItem += '<td class="text" style="padding: 0;"><input type="text" id="expense_discription_'+btnCnt+'" name="expense_discription" class="modify" style="width:235px; line-height:40px;" placeholder="상세 지출 정보 입력"></td>';
			rowItem += '<td class="text amount" style="padding: 0; text-align: right; padding:5px; "><b><input type="text" id="expense_amount'+btnCnt+'" name="expense_amount" class="modify" numberOnly value="0" style="text-align: right; padding-right: 5px; line-height:40px; margin:0; border:0; width: 95px;"></b></td>'
			rowItem += '<td class="text" id="expense_remove_'+btnCnt+'" style="line-height: 50px; padding: 0;"><input id="row_remove" type="button" class="white_btn expense_remove'+btnCnt+'" name="expense_remove" value="삭제" style="width:75px; line-height:45px;"></td>';
			
			btnCnt++;
			$('#expense_table').append(rowItem).trigger('create');
			
		});
		
		// 체크박스 체크여부에 따른 값 설정 함수
		$(document).on("change", 'input', function(){
			var cname =$(this).attr('id');
			var cnum = cname.substr(10);
			console.log("클래스번호 : "+cnum);
			if($("#asset_use_"+cnum).is(":checked")) {
				$('#check_result_'+cnum).val('Y');
				console.log("체크했음");
			} else {
				$('#check_result_'+cnum).val('N');
				console.log("체크해제");
			}
			console.log("체크박스 값 : "+$('#check_result_'+cnum).val());
		})
		
		// label에 숫자가 입력된 값을 클릭하면 input태그로 전환하는 함수
		$(document).on('click', 'label[class="input"]', function() {
			var val = $(this).text();
			var td_id = $(this).parent().attr('id');
			val = val.replace(',', '');
			var num = Number(val);
			var btnNum = td_id.substr(15);
			console.log('val자료형 : '+typeof(val)+' / label_value : '+val+' / parent_id : '+td_id);
			//var parent_id = $('td[id="'+val+'"]').attr('id');
			var parent_id = $('td[id="'+td_id+'"]').attr('id');
			console.log('parent_id : '+parent_id);
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
		
		// 
		$(document).on("click", "#row_remove", function() {
			var cmd = 'remove';
			cmd += $(this).parent().parent().children('input:nth-child(3)').val();
			console.log("remove_click : "+cmd);
			var rowRemove = '<input type="hidden" name="expense_remove" value="'+cmd+'">';
			console.log(rowRemove);
			$('#expense_table').append(rowRemove).trigger('create');
			$(this).parent().parent().remove();
			
		});
		
		$(document).on('focus', 'input', function() {
			$(this).addClass('input-control');
			var txt = $(this).text();
			console.log(txt);
		})
		
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