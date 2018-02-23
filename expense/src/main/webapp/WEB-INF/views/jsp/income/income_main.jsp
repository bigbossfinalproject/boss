<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>


<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="./resources/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script src="./resources/js/incomeBoard.js"></script>
</head>
<body>
	<header><jsp:include page="/resources/include/header.jsp" /></header>
	<h2 class="text-center">소득 내역</h2>

	<div class="container" id="table">
		<table class="table table-bordered text-center" id=incomeTable>
			<colgroup>
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="25%" />
				<col width="30%" />
			</colgroup>

			<thead>
				<tr>
					<th class="text-center">거래날짜</th>
					<th class="text-center">소득구분</th>
					<th class="text-center">거래구분</th>
					<th class="text-center">거래은행</th>
					<th class="text-center">금액</th>
					<th class="text-center">비고</th>
				</tr>
			</thead>
			<tbody id=ajaxTable>
			</tbody>
		</table>
	</div>



	<hr />
	<input type="button" value="행 생성" id="add_row" />

	<footer><jsp:include page="/resources/include/footer.jsp" /></footer>
</body>


</html>