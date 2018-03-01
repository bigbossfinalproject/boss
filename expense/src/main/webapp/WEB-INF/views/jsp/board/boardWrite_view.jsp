<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		<jsp:include page="/resources/include/header.jsp"></jsp:include>
	</div>
<div style="margin:0 auto;margin-top: 5%;margin-bottom: 5%;width: 1280px;height:500px;">
<form action="boardWrite.bo" method="post" id="write" name="write">
	<table align="center" cellpadding="3" cellspacing="3">
		<tr>
			<td>작성자 ID</td>
			<td><input type="text" name="root_Id" size="10" value="${root_Id }" readonly="readonly"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="bTitle" size="10"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="bContent" cols="30"></textarea></td>
		</tr>				
		<tr>
			<td align="center" colspan="2"><input type="submit" value="등록"></td>
			<td align="center" colspan="2"><a href="boardList.bo	" style="text-decoration: none">목록보기</a> </td>
		</tr>
	</table>
	</form>
</div>
	<div>
		<jsp:include page="/resources/include/footer.jsp"></jsp:include>
	</div>

</body>
</html>