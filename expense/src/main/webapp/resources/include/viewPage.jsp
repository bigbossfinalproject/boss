<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<a href="<%=request.getContextPath() %>/test.do">�׽�Ʈ1</a><br>
	<a href="<%=request.getContextPath() %>/test2.do">�׽�Ʈ2</a><br>
	
	<a href="<%=request.getContextPath() %>/income-analysis.do">����ȭ�鿡�� �ҵ�м��� �޴�</a><br>
	<a href="<%=request.getContextPath() %>/expense-analysis.do">����ȭ�鿡�� ����м��� �޴�</a><br>
	

	
	<div>
		<ul>
			<a href="<%=request.getContextPath() %>/data-income.do"><li>�ҵ�</li></a>
			<a href="<%=request.getContextPath() %>/data-expense.do"><li>����</li></a>
		</ul>
	</div>


</body>
</html>