<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="boss.cashbook.service.AssetViewBean" %>
<%@ page import="boss.cashbook.model.ObjectRootBean" %>
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
	
    <div class="container">
        <table border="1" style="border-collapse: collapse; align-self: center;">
            <colgroup>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="20%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <tr>
                <th>아이디</th>
                <th>순서번호</th>
                <th>자산명</th>
                <th>자산목적</th>
                <th>자산등록일자</th>
                <th>거래매체</th>
                <th>은행명</th>
                <th>초기 금액</th>
                <th>현재 금액</th>

            </tr>
            <% for(AssetViewBean av : assetList) {
                %>
                <tr>
                    <td><%= av.getRoot_id() %></td>
                    <td><%= av.getAsset_seq() %></td>
                    <td><%= av.getAsset_name() %></td>
                    <td><%= av.getAsset_purpose() %></td>
                    <td><%= av.getAsset_date() %></td>
                    <td><%= av.getTrade_name() %></td>
                    <td><%= av.getBank_name() %></td>
                    <td><%= av.getBasic_amount() %></td>
                    <td><%= av.getNow_amount() %></td>
                </tr>
            <% } %>

        </table>
    </div>
	<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>