<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 홈</title>
<style>
 
.header {
	width:1280px;
	margin: 0 auto;
}

div.img {
	width:1000px;
	height:700px;
	margin: 120px auto 0;;	
	
}
div.img img {
	margin-top: 15%;
	width:100%;
	text-align: center;
	
}

 </style>
 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script type="text/javascript">
 window.onload = function() {
		headerFunction();
	}

 </script>
</head>
<body>
	<header><jsp:include page="/resources/include/header.jsp"/></header>
  <div class="inner_frame"><jsp:include page="/resources/include/info_header.jsp"/></div> 
 
 
 <div class="container">

		


	 
	 <div class="img">
	 		<img src="boss2.jpg">
	 </div>
	 <div>
	 	<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
	 </div>	
 </div>
</body>
</html>