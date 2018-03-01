<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>

<body >
	
	<div style="margin-top: 15%;width: 30%;float: left;">
			<form id="joinGo "action="userLogin.uo" method="post">
			<table align="center" cellpadding="5" cellspacing="10" width="80%"style="text-align: center;">				
				<tr>
					<td style="font-size: 12px">ID</td>
					<td><input type="text" id="root_Id" name="root_Id"></td>
				</tr>
				<tr>
					<td style="font-size: 12px">Password</td>
					<td><input type="password" id="root_Pwd" name="root_Pwd"></td>
				</tr>			
				<tr>
					<td colspan="2" align="center">					
					 
					<input type="submit" value="Login"/></td>
				</tr>
				<tr>				
						<td style="text-align: center;"colspan="2">
						<a href="userJoin_write.uo" style="text-decoration: none;font-size: 12px;">회원 가입</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="userSearch_write.uo" style="text-decoration: none;font-size: 12px">Id / Password 찾기</a>
						</td>						
					</tr>
				
			</table>
		</form>
	</div>

</body>
</html>