<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: #BBBCBD;
}

tr:NTH-OF-TYPE(2n+1) {
	background-color: #E8E8E8;
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
<body>
	<header><jsp:include page="/resources/include/header.jsp" /></header>
	아이디 : <c:out value="${ user.root_id }" /> / 이름 : <c:out value="${ user.root_name }" />회원님 반갑습니다.<br>
	고유번호 : <c:out value="${ user.root_idn }" /> / 이메일 : <c:out value="${ user.root_email }" />입니다.<br>
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
	<form action="asset_write_ok.do" method="post" class="assetform" name="assetform">
		<div class="frame_1200">

			<table class="table table-bordered text-center">
				<ul id="top" style="padding: 0; border: 0; margin: 0;">
					<li id="subject" style="line-height: 30px;">
						<b>자산관리하기</b>
					</li>
					<li id="add">
						<b><input type="button" class="white_btn" id="add_row" value="항목추가" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
					<li id="rollback">
						<b><input type="button" class="white_btn" id="asset_cancel" value="취소" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
					<li id="save">
						<b><input type="submit" class="white_btn" id="asset_submit" value="저장" style="padding: 0; width:100px; height: 30px;"></b>
					</li>
				</ul>
				<colgroup>
					<col width="200px" />
					<col width="200px" />
					<col width="80px" />
					<col width="100px" />
					<col width="120px" />
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th style="line-height: 40px;">계좌명</th>
						<th style="line-height: 40px;">용도</th>
						<th style="line-height: 40px;">자산유형</th>
						<th style="line-height: 40px;">시작일자</th>
						<th style="line-height: 40px;">거래은행</th>
						<th style="line-height: 40px;">초기 금액</th>
						<th style="line-height: 40px;">현재 잔액</th>
						<th style="line-height: 40px;">사용함</th>
						<th style="line-height: 40px;">삭제</th>
					</tr>
				</thead>
				<tbody id="asset_table">
					<c:forEach items="${ assetList }" var="asset">
						
						<tr class="asset_list">
							<input type="hidden" name="root_idn" id="root_idn_<%= btnCnt %>" value="${ user.root_idn }">
							<input type="hidden" name="root_id" id="root_id_<%= btnCnt %>" value="${ user.root_id }">
							<input type="hidden" id="asset_code" id="asset_code_<%= btnCnt %>" name="asset_code" value="${ asset.asset_code }">
							<td class="text" style="padding: 0;">
								<input type="text" id="asset_name_<%= btnCnt %>" class="modify asset_name" name="asset_name" value="${ asset.asset_name }" style="line-height: 40px; width: 200px;">
							</td>
							
							<td class="text" style="padding: 0;">
								<input type="text" id="asset_purpose_<%= btnCnt %>" class="modify asset_purpose" name="asset_purpose" value="${ asset.asset_purpose }" style="line-height: 40px; width: 200px;">
							</td>
							
							<td class="text" style="padding: 0;">
								<select id="trade_code_<%= btnCnt %>" class="trade_code" name="trade_code" style="width: 70px; height: 50px;">
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
							
							<td class="date" style="padding: 0;">
								<input type="date" id="asset_date_<%= btnCnt %>" class="asset_date" name="asset_date" value="${ asset.asset_date }" size="20" style="line-height: 40px;">
							</td>
							
							<td class="text" style="padding: 0;">
								<select id="bank_code_<%= btnCnt %>" class="bank_code" name="bank_code" style="width: 120px; height: 50px;">
									<c:forEach items="${ bank }" var="bank">
										<c:choose>
											<c:when test="${ bank.bank_name == asset.bank_name }">
												<option value="${ bank.bank_code }" selected="selected">
													<c:out value="${ bank.bank_name }" />
												</option>
											</c:when>
											<c:when test="${ bank.bank_name != asset.bank_name }">
												<option value="${ bank.bank_code }">
													<c:out value="${ bank.bank_name }" />
												</option>
											</c:when>
										</c:choose>
									</c:forEach>
								</select>
							</td>
							
							<td class="amount" style="padding: 0;">
								<b>
									<input type="text" class="modify basic_amount" id="basic_amount_<%= btnCnt %>" name="basic_amount" numberOnly value="${ asset.basic_amount }" style="text-align: right; padding-right: 5px; line-height: 40px; width: 100px;">
								</b>
							</td>
							
							<td class="amount" style="padding: 0;">
								<label class="amount" style="line-height: 45px;">
									<fmt:formatNumber value="${ asset.now_amount }" groupingUsed="true" />
								</label>
							</td>
							
							<td class="text" style="line-height: 45px; padding: 0;">
								<input id="asset_use_<%= btnCnt %>" type="checkbox" name="checked" class="asset_use" checked="checked">사용중
								<input type="hidden" id="check_result_<%= btnCnt %>" class="check_result" name="asset_use">
							</td>
							
							<td class="text" style="line-height: 45px; padding: 0;">
								<input id="row_remove" type="button" class="white_btn asset_remove" name="asset_remove" value="삭제" size="50">
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
		
		// 자산 목록 행 추가하는 함수
		$('#add_row').click(function() {
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
			rowItem += '<input type="hidden" name="root_idn" id="root_idn_'+btnCnt+'" value="${ user.root_idn }">';
			rowItem += '<input type="hidden" name="root_id" id="root_id_'+btnCnt+'" value="${ user.root_id }">';
			rowItem += '<input type="hidden" id="asset_code" id="asset_code_'+btnCnt+'" name="asset_code" value="new_code">';
			rowItem += '<td class="text" style="padding:0;"><input type="text" id="asset_name_'+btnCnt+'" class="modify" name="asset_name" size="20" style="line-height: 40px; width:200px;"></td>';
			rowItem += '<td class="text" style="padding:0;"><input type="text" id="asset_purpose_'+btnCnt+'" class="modify" name="asset_purpose" size="20" style="line-height: 40px; width:200px;"></td>';
			rowItem += '<td class="text" style="padding:0;"><select id="trade_code_'+btnCnt+'" name="trade_code" style="width:70px; height:50px;">';
			for(var i = 0; i < tcodeList.length; i++) {
				if(tcodeList[i] == 'cash') {
					rowItem +='<option value="'+tcodeList[i]+'" selected="selected">'+tradeList[i]+'</option>';
				} else {
					rowItem +='<option value="'+tcodeList[i]+'">'+tradeList[i]+'</option>';
				}
			}
			rowItem += '</select></td>';
			rowItem += '<td class="date" style="padding:0;"><input type="date" id="asset_date_'+btnCnt+'" class="modify" name="asset_date" size="20" value="'+result+'"style="line-height: 40px;"></td>';
			rowItem += '<td class="text" style="padding:0;"><select id="bank_code_'+btnCnt+'" name="bank_code" style="width:120px; height:50px;">'
				for(var i = 0; i < bcodeList.length; i++) {
					if(bcodeList[i] == 'money') {
						rowItem +='<option value="'+bcodeList[i]+'" selected="selected">'+bankList[i]+'</option>';
					} else {
						rowItem +='<option value="'+bcodeList[i]+'">'+bankList[i]+'</option>';
					}
					
				}
			rowItem += '</select></td>';
			rowItem += '<td class="text" style="padding:0;"><b><input type="text" id="basic_amount_'+btnCnt+'" class="modify" value="0" name="basic_amount" numberOnly id="basic_amount" style="text-align: right; padding-right: 5px; line-height: 40px; width: 100px;"></b></td>';
			rowItem += '<td class="text" style="padding:0;"></td>';
			rowItem += '<td class="text" style="line-height: 45px; padding:0;"><input type="checkbox" id="asset_use_'+btnCnt+'" class="modify" name="checked" checked="checked">사용중<input type="hidden" id="check_result_'+btnCnt+'" class="check_result" name="asset_use"></td>';
			rowItem += '<td class="text" style="line-height: 45px; padding:0;"><input type="button" class="white_btn modify row_remove" id="row_remove" value="삭제" size="50"></td>';
			rowItem += "</tr>"
			btnCnt++;
			$('#asset_table').append(rowItem).trigger('create');
			
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
		
		// td영역을 클릭하면 해당 정보를 보여주는 함수
		$(document).on('click', 'td', function() {
			var txt = $(this).children().val();
			console.log(txt);
		});
	
		$(document).on("click", "#row_remove", function() {
			var cmd = 'remove';
			cmd += $(this).parent().parent().children('input:nth-child(3)').val();
			console.log("remove_click : "+cmd);
			var rowRemove = '<input type="hidden" name="asset_remove" value="'+cmd+'">';
			console.log(rowRemove);
			$('#asset_table').append(rowRemove).trigger('create');
			$(this).parent().parent().remove();
			
		});
		
		$(document).on('focus', '.modify', function() {
			$(this).addClass('input-control');
			var txt = $(this).children().children().text();
			console.log(txt);
		})
		
		$(document).on('blur', '.modify', function() {
			$(this).removeClass('input-control');
			var txt = $(this).children().children().text();
			console.log(txt);
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
