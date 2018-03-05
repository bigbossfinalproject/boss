<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 
.container {
	margin: 0 auto;
	width:1280;
}

.header {
	width:1280;
	margin: 0 auto;
}

 div:NTH-OF-TYPE(2) {
	width:1000px;
	height:800px;
	margin-left: auto;
	margin-right: auto;	
	
}
div:NTH-OF-TYPE(2) img{
	margin-top: 15%;
	width:100%;
	text-align: center;
	
}

 
 </style>
</head>
<body>
 
 
 <div class="container">
	 <div class="header">
	 	<jsp:include page="/resources/include/header.jsp"></jsp:include>	 
	 </div>
	 <div>
	 				<img src="boss2.jpg">
	 </div>
	 <div>
	 	<jsp:include page="../../../resources/include/footer.jsp"></jsp:include>
	 </div>	
 </div>
</body>
</html>