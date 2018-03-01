<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: 15%;">
<form  id="reply_view" name="reply_view" action="reply.bo">
	<table align="center" cellpadding="0" cellspacing="0" style="text-align:center; font-size: 12px;" border="1">
		
		<tr>
			<td><input type="hidden" id = "bGoup" name="bGroup "value="${list.bGroup }"></td>				
			<td><input type="hidden" id = "bStep" name="bStep" value="${list.bStep }"></td>
			<td><input type="hidden" id = "bIndent" name="bIndent" value="${list.bIndent }"></td>
		</tr>
		<tr>
			<td>그룹 번호</td>
			<td><input type="text" name="bGroup" id="bGroup" value="${list.bGroup }" readonly="readonly" size="100%"></td>
		</tr>	
		<tr>
			<td>스텝 번호</td>
			<td><input type="text" name="bStep" id="bStep" value="${list.bStep }" readonly="readonly" size="100%"></td>
		</tr>	
		<tr>
			<td>인덴트 번호</td>
			<td><input type="text" name="bIndent" id="bIndent" value="${list.bIndent }" readonly="readonly" size="100%"></td>
		</tr>
		<tr>
			<td>게시물 번호</td>
			<td><input type="text" name="bId" id="bId" value="${list.bId }" readonly="readonly" size="100%"></td>
		</tr>		
		<tr>
			<td>작성자</td>
			<td><input type="text" name="bName" id="bName" value="${list.bName }" readonly="readonly" size="100%"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="bTitle" name="bTitle" size="100%" maxlength="20"  placeholder="(답변 제목 입력)"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea style="line-height="10"; cols="100%" rows="10px" id="bContent" name="bContent" placeholder="(답변 내용 입력)"></textarea></td>
		</tr>	
		<tr>
			<td>조회수</td>
			<td><input type="text" name="bHit" id="bHit" value="${list.bHit }" readonly="readonly" size="100%"></td>
		</tr>			
		<tr>			
			<td align="center" colspan="2" style="text-align: right;">					
								<a href="userLogin.uo" style="text-decoration: none;font-size: 12px;">목록보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="document.getElementById('reply_view').submit()" style="text-decoration: none;font-size: 12px;">답변등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
			</td> 
		</tr>
	</table>
	</form>
</div>
</body>
</html>	
