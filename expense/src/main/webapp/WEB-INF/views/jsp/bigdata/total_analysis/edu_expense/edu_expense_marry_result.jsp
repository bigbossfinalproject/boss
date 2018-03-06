<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Һ� �������� �м�</title>

<style type="text/css">



	#section {
		margin: 100px auto 0;
		width: 1280px; height: 800px;
		position: relative;
		overflow: auto;
		/* background-color:green;  */
		/* �θ�Ϳ� ���踦 �����ֱ����� ��� */
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
		overflow: auto;
	}
	
  	#article {
		width: 1080px; height: 800px;
		background-color:white;
		margin-left: 200px;
		position:absolute;   /* �θ� ���� ���밪 related �ڽ� ���κп��� ���� */ 
		float:right;
		overflow: auto;
	}
	

	
		
</style>

</head>
<body style="width: 1280px; background-color:#f8f8f8; margin: 0 auto;">

	<header>
			<jsp:include page="/resources/include/header.jsp"></jsp:include>
	</header>	

	<div id="section">
		
		<div id="aside">
			<jsp:include page="../expense_aside.jsp"></jsp:include>		
		</div>
		<div id="article">
			<hr/>
			<jsp:include page="/resources/bigdata_html/edu_expense_marry.html"></jsp:include>
		</div>
		
	</div>
	
	
		
	<footer>	
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
	</footer>	

</body>
</html>