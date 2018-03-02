<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
				<p><h1>소득 분석</h1></p>
				<form action="" method="get">
					<table>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_age.do">1. 연령별 분석</a></td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/gender_income.do">2. 성별 분석</td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/job_income.do">3. 직종별 분석</td>
						</tr>
					</table>
				</form>
</body>
</html>