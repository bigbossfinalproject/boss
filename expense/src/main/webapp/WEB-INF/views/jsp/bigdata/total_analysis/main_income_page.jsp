<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 소득 페이지</title>

<style type="text/css">

	#section {
		margin: 0 auto; 
		width: 1280px; height: 800px;
		position: relative;
		/* background-color:green;  */
		/* 부모와에 관계를 맞춰주기위해 사용 */
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
		position:absolute;   /* 부모 시작 절대값 related 자식 끝부분에서 시작 */ 
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
				<p><h1>소득 분석</h1></p>
				<form action="" method="get">
					<table>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_age.do">1. 연령별 분석</a></td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_sex.do">2. 성별 분석</td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_job.do">3. 직종별 분석</td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath() %>/income_job_level.do">4. 업종별 분석</td>
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