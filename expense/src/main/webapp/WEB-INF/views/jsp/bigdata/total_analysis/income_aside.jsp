<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

<style type="text/css">

#aside ul{
	list-style: none;
	margin: 0 auto;
	border: 0;
	vertical-align: baseline;
	padding: 0;
	margin: 0;
}

/* aside바 전체 색 결정 */
#aside ul li {

	background: transparent url(http://store.blueb.co.kr/data/201009/IJ12846667513972/arrowblue.gif) 100% 0;
	box-shadow: rgba(255,255,255,0.1) 1px 1px 0 inset;
}
#aside ul li a {
	display: block;
	height: 38px;
	line-height: 40px;
	padding-left: 10px;
	text-decoration: none;
	color: #FFFFFF; /* 글씨색 */

	border-radius: 3px;
}

/* 세컨드 메뉴바의 백그라운드 색  */
.list ul li {
	background: #1e90ff;
	box-shadow: #1e90ff 0 1px 0 inset;
}

/* 마우스 올리면 메뉴 나오게 하는 기능 */
.list ul {
   	height: 0; 
  	overflow: hidden;
  	-webkit-transition: height linear .3s;
    -moz-transition: height linear .3s;
    -o-transition: height linear .3s;
    transition: height linear .3s;
}

	.list:hover ul{
		
		height: 190px;
	}
/* 메뉴 안에 마우스 갈시 색깔 변하는 기능 */
/* #aside ul li:hover {
	background: -webkit-linear-gradient(top,  rgba(58,96,209,1) 0%,rgba(44,72,194,1) 100%); 
	background: -o-linear-gradient(top,  rgba(58,96,209,1) 0%,rgba(44,72,194,1) 100%); 
	background: -ms-linear-gradient(top,  rgba(58,96,209,1) 0%,rgba(44,72,194,1) 100%); 
	background: linear-gradient(to bottom,  rgba(58,96,209,1) 0%,rgba(44,72,194,1) 100%);
	box-shadow:#5173d5 1px 1px 0 inset;
} */

#aside ul li:hover {
background: transparent url(http://store.blueb.co.kr/data/201009/IJ12846667513972/arrowblue.gif) 100% 0;
	
}
#aside li a:hover{
	color: #000;
	background-position: 100% right;
}

</style>

</head>
<body>
	<p><h2>소득 분석</h2></p>
		<div>
			<ul>
				<li class="list"><a>1. 나이</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/age_income_gender.do"><i class="fas fa-chart-line"></i>&nbsp;나이-성별</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;나이-결혼</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;나이-직업</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_edu.do"><i class="fas fa-chart-line"></i>&nbsp;나이-교육</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;나이-지역</a></li>
					</ul>
				
				</li>
			</ul>
			<ul>
				<li class="list"><a>2. 성별</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/gender_income_age.do"><i class="fas fa-chart-line"></i>&nbsp;성별-나이</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;성별-결혼</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;성별-직업</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_edu.do"><i class="fas fa-chart-line"></i>&nbsp;성별-교육</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;성별-지역</a></li>
					</ul>
				
				</li>
			</ul>
			<ul>
				<li class="list"><a>3. 교육수준</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/edu_income_age.do"><i class="fas fa-chart-line"></i>&nbsp;교육수준-나이</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;교육수준-결혼</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;교육수준-직업</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_gender.do"><i class="fas fa-chart-line"></i>&nbsp;교육수준-성별</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;교육수준-지역</a></li>
					</ul>
				
				</li>
			</ul>
		</div>
</body>
</html>