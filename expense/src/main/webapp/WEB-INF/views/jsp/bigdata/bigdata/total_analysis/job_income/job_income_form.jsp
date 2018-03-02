<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소득 직업별 분석</title>

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
			<jsp:include page="/resources/include/header.jsp"></jsp:include>
		</div>
	</header>	

	<div id="section">
		
		<div id="aside">
			<jsp:include page="../aside.jsp"></jsp:include>		
		</div>
		<div id="article">
			<div id="article_top">
				기본 이미지 삽입하자
			</div>
			
			<div id="article_bottom" >
				<div class="container">
					<jsp:include page="./job_bottom.jsp"></jsp:include>
				</div>
			</div>
		</div>
	

	</div>
	
	
		
	<footer>	
		<div>
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>
	</footer>	

</body>
</html>