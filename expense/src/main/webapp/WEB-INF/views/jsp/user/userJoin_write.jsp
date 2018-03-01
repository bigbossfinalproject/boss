<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>

<script>
	
	
/* function fsubmit(join) {
		
   if(document.join.name.value == "" || document.join.id.value == ""
            || document.join.password.value == ""|| document.join.email.value == "") {
        alert("아이디, 패스워드, 이름, 이메일은 필수 항목입니다.");
        return false;     
    }
    else {
        return true;          
    }   
    
} */

function check(){	
	
	var okChk = join.bigdata;	
	
	if(okChk.checked){
		document.getElementById("spec").style.display="block";
		
	}
	if(!okChk.checked){
		document.getElementById("spec").style.display="none";
		
	}
}

</script>

<body>
	<div style="margin-top: 15%">
		<form name="join" id="join" method="post" action="userJoin.uo">
			<table name="normal" width="400px" height="300px" align="center" style="text-align: center;">
				<tr><th colspan="3" align="center">회원 가입</td></tr>
				<tr>		
					<td style="font-size:12px;">아이디</td>
					<td colspan="2"><input type="text" name="root_Id" maxlength="20" id="root_Id"></td>
					<td>
					<a href="#" style="text-decoration: none; font-size: 12px;">중복확인</a>
					
					</td>
					
				</tr>
				<tr>		
					<td style="font-size:12px;">비밀번호</td>
					<td colspan="2"><input type="password" name="root_Pwd" maxlength="20" id="root_Pwd"></td>
				</tr>
				<tr>		
					<td style="font-size:12px;">비밀번호 확인</td>
					<td colspan="2"><input type="password" name="root_Pwd2" maxlength="20" id="root_Pwd2"></td>
				</tr>
				<tr>		
					<td style="font-size:12px;">이름</td>
					<td colspan="2"><input type="text" name="root_Name" maxlength="20" id="root_Name"></td>
				</tr>		
				<tr>		
					<td style="font-size:12px;">성별</td>				
					<td colspan="2">
						<div>
							<label">
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
					<td colspan="2"><input type="email" name="root_Email" maxlength="30" id="root_Email"></td>
				</tr>
				<tr><td colspan="3" style="font-size: 15px;"> 빅데이터 수집에 동의 합니다.
					<input type="checkbox" name="bigdata" onclick="javascript:check();"/>동의							
				</td>
				</tr>
				<tr>			
				<table align="center" id="spec" width="500px" style="text-align: center;display: none"> 
			
								<tr><td colspan="3" align="center">분석용 회원 가입입니다.</td></tr>			
								<tr>		
									<td style="font-size:12px;">생년월일</td>
									<td colspan="2"><input type="text" maxlength="20" name="root_Birth" id="root_Birth"></td>
								</tr>							
								<tr>		
									<td style="font-size:12px;">직업</td>
									<td colspan="2"><input type="text" maxlength="20" name="root_Job" id="root_Job"></td>
								</tr>
								<tr>		
									<td style="font-size:12px;">주소</td>
									<td colspan="2"><input type="text" maxlength="20" name="root_Address" id="root_Address"></td>
								</tr>							
							</table>	
							</tr>
			</table>
			<table align="center">				
				<tr>
					<td align="center">
						<a href="#" onclick="document.getElementById('join').submit();" style="text-decoration: none;font-size: 15px">가입</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;											
						<a href="#" onclick="history.go(-1);" style="text-decoration: none;font-size: 15px">취소</a>
					</td>
				</tr>
			</table>
		</form>
		</div>
	
</body>
</html>