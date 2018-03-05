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

/* aside�� ��ü �� ���� */
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
	color: #FFFFFF; /* �۾��� */

	border-radius: 3px;
}

/* ������ �޴����� ��׶��� ��  */
.list ul li {
	background: #1e90ff;
	box-shadow: #1e90ff 0 1px 0 inset;
}

/* ���콺 �ø��� �޴� ������ �ϴ� ��� */
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
/* �޴� �ȿ� ���콺 ���� ���� ���ϴ� ��� */
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
	<p><h2>�ҵ� �м�</h2></p>
		<div>
			<ul>
				<li class="list"><a>1. ����</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/age_income_gender.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;����-��ȥ</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_edu.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/age_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
					</ul>
				
				</li>
			</ul>
			<ul>
				<li class="list"><a>2. ����</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/gender_income_age.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;����-��ȥ</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_edu.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
						<li><a href="<%=request.getContextPath() %>/gender_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;����-����</a></li>
					</ul>
				
				</li>
			</ul>
			<ul>
				<li class="list"><a>3. ��������</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/edu_income_age.do"><i class="fas fa-chart-line"></i>&nbsp;��������-����</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_marry.do"><i class="fas fa-chart-line"></i>&nbsp;��������-��ȥ</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_job.do"><i class="fas fa-chart-line"></i>&nbsp;��������-����</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_gender.do"><i class="fas fa-chart-line"></i>&nbsp;��������-����</a></li>
						<li><a href="<%=request.getContextPath() %>/edu_income_loc.do"><i class="fas fa-chart-line"></i>&nbsp;��������-����</a></li>
					</ul>
				
				</li>
			</ul>
		</div>
</body>
</html>