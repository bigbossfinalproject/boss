<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
					<h5 align="center">분석할 항목을 눌러주세요.</h5>
					<form>
						<div class="gender">
							<div>
								<p>나이분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./gender_income_age.do'"></p>
							</div>
						</div>
						<div class="marry">
							<div>
								<p>결혼여부분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./gender_income_marry.do'"></p>
							</div>
						</div>
						<div class="job">
							<div>
								<p>직업분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./gender_income_job.do'"></p>
							</div>
						</div>	
						<div class="edu">
							<div>
								<p>교육수준분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./gender_income_edu.do'"></p>
							</div>
						</div>	
						<div class="loc">
							<div>
								<p>지역분석</p>
							</div>
							<div>
								<p><input type="button" value="분석하기"  onclick="location.href='./gender_income_loc.do'"></p>
							</div>
						</div>		
					</form>
</body>
</html>