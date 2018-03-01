<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<a href="<%=request.getContextPath() %>/test.do">테스트1</a><br>
	<a href="<%=request.getContextPath() %>/test2.do">테스트2</a><br>
	
	<a href="<%=request.getContextPath() %>/income-analysis.do">메인화면에서 소득분석탭 메뉴</a><br>
	<a href="<%=request.getContextPath() %>/expense-analysis.do">메인화면에서 지출분석탭 메뉴</a><br>
	

	
	<div>
		<ul>
			<a href="<%=request.getContextPath() %>/data-income.do"><li>소득</li></a>
			<a href="<%=request.getContextPath() %>/data-expense.do"><li>지출</li></a>
		</ul>
	</div>


</body>
</html>