<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<form action="boardReply.bo" method="post" id="write" name="write">
	<table align="center" cellpadding="3" cellspacing="3">
		<tr>
			<td>
				<input type="hidden" id="bGroup" name="bGroup" value="${dto.bGroup}">
				<input type="hidden" id="bStep" name="bStep" value="${dto.bStep}">
				<input type="hidden" id="bIndent" name="bIndent" value="${dto.bIndent}">
			</td>
		</tr>
		<tr>
			<td>게시글 번호</td>
			<td><input type="text" name="bId" size="10" value="${dto.bId }" readonly="readonly"></td>
		</tr>
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
			<td align="center" colspan="2"><a href="boardList.bo" style="text-decoration: none">목록보기</a> </td>
		</tr>
	</table>
</form>
</div>

	<div>
		<jsp:include page="/resources/include/footer.jsp"></jsp:include>
	</div>

</body>
</html>