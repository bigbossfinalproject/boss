<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% String root_Id = (String)session.getAttribute("root_Id"); %>
<body>
	<div>
		<jsp:include page="/resources/include/header.jsp"></jsp:include>
	</div>
	<div style="margin:0 auto;margin-top: 5%;margin-bottom: 5%;width: 1280px;height:500px;">
	<form action="boardWrite_view.bo" name="write_view" id="write_view">
		<table align="center" width="100%" cellpadding="0" cellspacing="0" border="1" style="text-align: center;font-size: 12px;"frame="void">
			<tr>
				<td width="50px">번호</td>
				<td width="150px;">작성자</td>
				<td width="600px;">제목</td>
				<td width="150px;">일자</td>
				<td width="50px;">조회수</td>				
			</tr>
			
			<c:forEach items="${list}" var="dto">
			
			
			<tr>
				<td>${dto.bId }</td>
				<td>${dto.root_Id }</td>
				<td>
				
					 <%-- <c:forEach begin="1" end="${dto.bIndent }"></c:forEach>	 --%>				
					 <c:if test="${dto.bStep == 0 }">
					 	<a href="boardContent.bo?bId=${dto.bId }">${dto.bTitle}</a>		
					</c:if>
					 <c:if test="${dto.bStep == 1 }">
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        						 
        						 (Re)<a href="boardContent.bo?bId=${dto.bId }" style="text-decoration: none;">${dto.bTitle}</a>
    				</c:if>
					<c:if test="${dto.bStep == 2 }">
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        						 (Re)(Re)<a href="boardContent.bo?bId=${dto.bId }" style="text-decoration: none;">${dto.bTitle}</a>
    				</c:if>					 		
					</td>
					<td>${dto.bDate }</td>
					<td>${dto.bHit }</td>
					</tr>		
					</c:forEach>
			
			
			
			
				<tr height="100px;">
				<td align="right" colspan="5" style="border-bottom: none;border-left: none;border-right: none;">
					<%if(root_Id.equals("Admin")){%>
					<a href="#" onclick="document.getElementById('write_view').submit();" style="text-decoration: none;font-size: 13px">공지 작성</a>
					
					<%
					}
					%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.getElementById('write_view').submit();" style="text-decoration: none;font-size: 13px">작성</a>
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