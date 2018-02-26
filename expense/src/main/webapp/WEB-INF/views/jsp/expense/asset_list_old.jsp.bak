<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.List" %>
<%@ page import="boss.cashbook.service.AssetViewBean" %>
<%@ page import="boss.cashbook.model.*" %>
<%@ page session="true" %>
<%
	ObjectRootBean user = (ObjectRootBean) session.getAttribute("user");
	List<AssetViewBean> assetList = (List<AssetViewBean>) request.getAttribute("assetList");
%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자산 내역 보기</title>
    <script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
    <style type="text/css">
    	th { text-align: center;}										/* 제목은 모두 중앙 정렬 */
    	.no { text-align: center;}										/* 번호는 중앙 정렬 */
    	.text { text-align: center;}									/* 문자는 중앙 정렬 */
    	.date { text-align: center;}									/* 날짜는 중앙 정렬 */
    	.amount { text-align: right; padding-right: 5px;}		/* 금액은 우측 정렬 */
    	
    </style>
</head>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
	아이디 : <%= user.getRoot_id() %> / 이름 : <%= user.getRoot_name() %>회원님 반갑습니다.<br>
	고유번호 : <%= user.getRoot_idn() %> / 이메일 : <%= user.getRoot_email() %> 입니다.<br>
	<a href="item_list.do" style="text-decoration: none;">분류항목 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="item_write.do" style="text-decoration: none;">분류항목 입력</a><br>
	<a href="expense_all_list.do" style="text-decoration: none;">지출 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="expense_write.do" style="text-decoration: none;">지출 입력</a><br>
	<a href="asset_list.do" style="text-decoration: none;">자산 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="asset_write.do" style="text-decoration: none;">자산 입력</a><br>
	<a href="loan_list.do" style="text-decoration: none;">부채 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="loan_write.do" style="text-decoration: none;">부채 입력</a><br>
	<a href="card_list.do" style="text-decoration: none;">카드 목록 보기</a>&nbsp;&nbsp;&nbsp;
	<a href="card_write.do" style="text-decoration: none;">카드 입력</a><br>
	
    <div>
        <table border="1" style="border-collapse: collapse; align-self: center; margin: 0 auto; width: 80%;">
            <colgroup>
                <!-- <col width="5%"/> -->
                <col width="5%"/>
                <col width="17%"/>
                <col width="20%"/>
                <col width="10%"/>
                <col width="8%"/>
                <col width="14%"/>
                <col width="8%"/>
                <col width="8%"/>
            </colgroup>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>용도</th>
                <th>등록일자</th>
                <th>지불방법</th>
                <th>거래은행</th>
                <th>초기 금액</th>
                <th>현재 금액</th>

            </tr>
            <% for(AssetViewBean av : assetList) {
                %>
                <tr>
                    <td class="no"><%= av.getAsset_seq() %></td>
                    <td class="text"><%= av.getAsset_name() %></td>
                    <td class="text"><%= av.getAsset_purpose() %></td>
                    <td class="date"><%= av.getAsset_date() %></td>
                    <td class="text"><%= av.getTrade_name() %></td>
                    <td class="text"><%= av.getBank_name() %></td>
                   <td class="amount"><fmt:formatNumber value="<%= av.getBasic_amount() %>" groupingUsed="true"/></td>
                    <td class="amount"><fmt:formatNumber value="<%= av.getNow_amount() %>" groupingUsed="true"/></td>
                </tr>
            <% } %>

        </table>
    </div>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>

<script type="text/javascript">
	function AddComma(data_value) {										// 숫자에 콤마를 표시해주는 함수
		
		var txtNumber = ''+data_value;										// 입력된 값을 문자열 변수에 저장
		
		if (isNaN(txtNumber) || txtNumber == '') {							// 숫자 형태의 값이 정상적으로 입력되었는지 확인
			alert("숫자만 입력하세요");
			return;
		} else {
			var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');	// 정규식 형태 생성
			var arrNumber = txtNumber.split('.');								// 입력받은 숫자를 . 기준으로 나눔(정수부와 소수부분으로 분리)
			arrNumber[0] += '.';													// 정수부 끝에 소수점 추가
			
			do {
				arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');	// 정수부에서 rxSplit 패턴과 일치하는 부분을 찾아 replace 처리
			} while(rxSplit.test(arrNumber[0]));								// 정규식 패턴 rxSplit가 정수부 내에 있는지 확인하고 있다면 true 반환. 루프 반복.
			
			if(arrNumber.length > 1){												// txtNumber를 마침표(.)로 분리한 부분이 2개 이상이라면(즉 소수점 부분도 있다면)
				return arrNumber.join('');											// 배열을 그대로 합침. (join 함수에 인자가 있으면 인자를 구분값으로 두고 합침)
			} else {																		// 배열을 그대로 합침.(join 함수에 인자가 있으면 인자를 구분값으로 두고 합침)
				return arrNumber[0].split('.')[0];								// 위에서 정수부 끝에 붙여준 마침표(.)를 그대로 제거함.
			}
			
		}
		
	}
</script>

</html>
