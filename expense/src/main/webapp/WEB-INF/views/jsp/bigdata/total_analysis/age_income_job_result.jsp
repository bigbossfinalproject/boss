<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소득 연령별 분석</title>

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
	
	#article_top{
		width: 100%; height: 80%;
		position:absolute;   

	}	
	  
  	#article_bottom {
		width: 100%; height: 20%;
		top: 80%;
		background-color:orange;
		position:absolute;   

	}	
	
	.container{
		border: 1px solid black;
		margin: 0 auto;
	}
	
	.gender{
		width: 20%;
		float:left;
	}
	.marry{
		width:20%;
		float:left;
	}
	.job{
		width:20%;
		float:left;
	}
	
	.edu{
		width:20%;
		float:left;
	}
	
	.loc{
		width:20%;
		float:left;
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
			<div id="article_top">
				<jsp:include page="/resources/bigdata_html/age_income_job.html"></jsp:include>
			</div>
			
			<div id="article_bottom" >
				<div class="container">
					<h5 align="center">분석할 항목을 눌러주세요.</h5>
					<form>
						<div class="gender">
							<div>
								<p>성별분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./age_income_gender.do'"></p>
							</div>
						</div>
						<div class="marry">
							<div>
								<p>결혼여부분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./age_income_marry.do'"></p>
							</div>
						</div>
						<div class="job">
							<div>
								<p>직업분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./age_income_job.do'"></p>
							</div>
						</div>	
						<div class="edu">
							<div>
								<p>교육수준분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./age_income_edu.do'"></p>
							</div>
						</div>	
						<div class="loc">
							<div>
								<p>지역분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./age_income_loc.do'"></p>
							</div>
						</div>		
					</form>
				</div>
			</div>
		</div>
	

	</div>
	
	
		
	<footer>	
		<div>
			<jsp:include page=/resources/include/footer.jsp></jsp:include>
		</div>
	</footer>	

</body>
</html>