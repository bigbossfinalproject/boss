<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ������</title>

<style type="text/css">

	#section {
		margin: 0 auto; 
		width: 1280px; height: 800px;
		position: relative;
		/* background-color:green;  */
		/* �θ�Ϳ� ���踦 �����ֱ����� ��� */
	} 
	
	#aside {
		margin: 0 auto;
		width: 1280px; height: 800px;
		background-color:#B3D7E3;
		position: absolute;
		float:left;

	}
	
  	#article {
		width: 80%; height: 100%;
		background-color:white;
		margin-left: 256px;
		position:absolute;   /* �θ� ���� ���밪 related �ڽ� ���κп��� ���� */ 
		float:right;
	}  
	
		
</style>

</head>
<body>
	
		<header>
		<div>
			<jsp:include page=/resources/include/header.jsp></jsp:include>
		</div>
	</header>	

<div id="section">
		
			<div id="aside">
				<p><h1>���� �м�</h1></p>
				<form action="" method="get">
					<table>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_age.do">1. ���ɺ� �м�</a></td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_sex.do">2. ���� �м�</td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_job.do">3. ������ �м�</td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_job_level.do">4. ������ �м�</td>
						</tr>
					</table>
				</form>
				
			</div>
		<div id="article">
			asdf
		</div>
	</div>
		
	<footer>	
		<div>
			<jsp:include page=/resources/include/footer.jsp></jsp:include>
		</div>
	</footer>	
	
</body>
</html>