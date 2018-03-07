<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소비 분석</title>

<style type="text/css">

	.header {
		width:1280px;
		margin: 0 auto;
	}
	

	#section {
		margin: 100px auto 0; 
		width: 1280px; height: 800px;
		position: relative;
		/* background-color:green;  */
		/* 부모와에 관계를 맞춰주기위해 사용 */
	} 
	
	#aside {
		margin: 0 auto;
		width: 200px; height: 800px;
		background:#1e90ff;
		position: absolute;
		float:left;
		padding: 0;
		margin: 0;
		color: #FFFFFF;
	}
	
  	#article {
		width: 1080px; height: 100%;
		background-color:white;
		margin-left: 200px;
		position:absolute;   /* 부모 시작 절대값 related 자식 끝부분에서 시작 */ 
		float:right;
	}
	

	
		
</style>

</head>
<body style="width: 1280px; background-color:#f8f8f8; margin: 0 auto;">

	<div class="header">
			<jsp:include page="/resources/include/header.jsp"></jsp:include>
	</div>	

	<div id="section">
		
		<div id="aside">
			<jsp:include page="./expense_aside.jsp"></jsp:include>		
		</div>
		<div id="article">
			<hr/>
		</div>
		
	</div>
	
	
		
	<footer>	
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
	</footer>	

</body>
</html>