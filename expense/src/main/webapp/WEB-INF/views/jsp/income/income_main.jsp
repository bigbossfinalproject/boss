<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소득 보기</title>

<script src="./resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./resources/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">

<!-- chart 용 라이브러리 -->
<script type="text/javascript" src="./resources/dist/jquery.jqplot.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.json2.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/dist/jquery.jqplot.css" />
<script type="text/javascript" src="./resources/dist/plugins/jqplot.dateAxisRenderer.js"></script>

<script src="./resources/js/incomeBoard.js?ver=1.1"></script>

<style type="text/css">
	body {
		width: 1280px;
		margin: 0 auto;
	}
</style>

</head>
<body>
	<header><jsp:include page="/resources/include/header.jsp" /></header>
	<h2 class="text-center">소득 내역</h2>

	<div id="income_chart" class = "container"></div>



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
					<th class="text-center">거래계좌</th>
					<th class="text-center">금액</th>
					<th class="text-center">비고</th>
					<th><button type="button" id="add_row">
							<span class='glyphicon glyphicon-plus'></span>
						</button></th>
				</tr>
			</thead>
			<tbody id=ajaxTable>
			</tbody>
		</table>

	</div>



	<hr />


	<footer><jsp:include page="/resources/include/footer.jsp" /></footer>
</body>


</html>