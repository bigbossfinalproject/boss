<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>



<body>
	<div>
			<jsp:include page="/resources/include/header.jsp"></jsp:include>		
	</div>
	<div style="margin-top: 5%;margin-bottom: 5%;">
		
		<form name="modify" id="modify" method="post" action="userModify.uo">
			<table name="normal" width="400px" height="300px" align="center" style="text-align: center;">
				<tr><th colspan="3" align="center">회원 정보 수정</td></tr>
				<tr>		
					<td style="font-size:12px;">아이디</td>
					<td colspan="2"><input type="text" name="root_Id" maxlength="20" id="root_Id" value="${dto.root_Id }" readonly="readonly"></td>
				</tr>
				<tr>		
					<td style="font-size:12px;">비밀번호</td>
					<td colspan="2"><input type="password" name="root_Pwd" maxlength="20" id="root_Pwd" value="${dto.root_Pwd }"></td>
				</tr>				
				<tr>		
					<td style="font-size:12px;">이름</td>
					<td colspan="2"><input type="text" name="root_Name" maxlength="20" id="root_Name" value="${dto.root_Name }" readonly="readonly"></td>
				</tr>		
				<tr>		
					<td style="font-size:12px;">성별</td>				
					<td colspan="2">
						<div>
							<label>
								<input type="radio" name="root_Gender" id="root_Gender" value="남자" checked><span style="font-size: 12px;">남자</span>
							</label>
							<label>
								<input type="radio" name="root_Gender" id="root_Gender" value="여자"><span style="font-size: 12px;">여자</span>
							</label>
						</div>
					</td>				
				</tr>
				<tr>		
					<td style="font-size:12px;">이메일</td>
					<td colspan="2"><input type="email" name="root_Email" maxlength="30" id="root_Email" value="${dto.root_Email }"></td>
				</tr>
				<tr>			
					<td style="font-size:12px;">생년월일</td>
					<td colspan="2"><input type="text" maxlength="20" name="root_Birth" id="root_Birth" value="${dto.root_Birth }" readonly="readonly"></td>
			
				<tr>		
					<td style="font-size:12px;">직업</td>
					<td colspan="2"><input type="text" maxlength="20" name="root_Job" id="root_Job" value="${dto.root_Job}"></td>
				</tr>
				<tr>		
					<td style="font-size:12px;">주소</td>
					<td colspan="2"><input type="text" maxlength="20" name="root_Address" id="root_Address" value="${dto.root_Address }"></td>
				</tr>
			</table>
			<table align="center">				
				<tr>
					<td align="center">
						<%-- <a href="userModify.uo?root_Id=${dto.root_Id}&root_Pwd=${dto.root_Pwd}&root_Email=${dto.root_Email}&root_Job=${dto.root_Job}&root_Address=${dto.root_Address}">수정 완료</a> --%>
						<a href="#" onclick="document.getElementById('modify').submit()">수정 완료</a>
						<a href="#" onclick="history.go(-1)">취소</a>
					</td>
				</tr>
			</table>
		</form>
		</div>
		<div>
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		
		</div>
	
</body>
</html>