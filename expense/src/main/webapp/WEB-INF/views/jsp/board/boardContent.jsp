<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
	String root_Id = (String)session.getAttribute("root_Id");
	String writer = (String)request.getAttribute("writer");
%>


<body>
	<div>
		<jsp:include page="/resources/include/header.jsp"></jsp:include>
	</div>
<div style="margin:0 auto;margin-top: 5%;margin-bottom: 5%;width: 1280px;height:500px;">
<form  id="write_view" name="write_view" action="board_modify.bo">
	<table align="center" cellpadding="0" cellspacing="0" style="text-align:center; font-size: 12px;" border="1">
		
		<tr>
			<td>게시물 번호</td>
			<td><input type="text" name="bId" id="bId" value="${dto.bId}" readonly="readonly" size="100%"></td>
		</tr>		
		<tr>
			<td>작성자</td>
			<td><input type="text" name="root_Id" id="root_Id" value="${dto.root_Id}" readonly="readonly" size="100%"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="bTitle" name="bTitle" value="${dto.bTitle}" size="100%" maxlength="20"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea style="margin: 0 auto;padding: 0" cols="100%" rows="10px" id="bContent" name="bContent">${dto.bContent }</textarea></td>
		</tr>	
		<tr>
			<td>조회수</td>
			<td>${dto.bHit }</td>
		</tr>			
		<tr>			
			<td align="center" colspan="2" style="text-align: right;">					
								<a href="boardList.bo" style="text-decoration: none;font-size: 12px;">목록보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#" onclick="document.getElementById('write_view').submit();" style="text-decoration: none;font-size: 12px;">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="board_reply_view.bo?bId=${dto.bId}" style="text-decoration: none;font-size: 12px;">답변</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<%if(root_Id.equals(writer)||root_Id.equals("Admin")){
									%>
									<a href="boardDelete.bo?bId=${dto.bId }" style="text-decoration: none;">삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
									<%
								}
								%>
								
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