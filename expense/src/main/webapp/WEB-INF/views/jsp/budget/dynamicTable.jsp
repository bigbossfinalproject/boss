<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<button id='btn-add-row'>행 추가하기</button>
<button id='btn-delete-row'>행 삭제하기</button>

<hr>


<script src="//code.jquery.com/jquery.min.js"></script>
<script>
var selectRequest= new XMLHttpRequest();
var insertRequest= new XMLHttpRequest();
function selectFunction(){
	selectRequest.open("Post", "./budget_list", true);
	selectRequest.onreadystatechange = selectProcess;
	selectRequest.send(null);
}

function selectProcess(){
	var table = document.getElementById("budgetTable");
	table.innerHTML="";
	if(selectRequest.readyState==4 && selectRequest.status==200){
		var object = eval('(' +selectRequest.responseText+ ')');
		var result= object.result;
		for(var i=0; i<result.length;i++){
			var row=table.insertRow(0);
			for(var j=0; j < result[i].length;j++){
				var cell=row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
		}
	}
}

function insertFunction(){	

	insertRequest.open("Post", "./budget_insert?budget_amount=" + encodeURIComponent(document.getElementById("budget_amount").value) +
			"&item_code="+encodeURIComponent(document.getElementById("item_code").value), true);
	insertRequest.onreadystatechange = insertProcess;
	insertRequest.send(null);
	
}

function insertProcess(){
	if(insertRequest.readyState==4 && insertRequest.status==200){
		var result=insertRequest.responseText;
		if(result !=1){
			alert('등록에 실패했습니다')
			}
		}else{
			var budget_amount=document.getElementById("budget_amount");
			var item_code=document.getElementById("item_code");
			budget_amount.value="";
			item_code.value="";
			selectFunction();
		}
}

function abc(){
	alert('머냐')
}


 $('#btn-add-row').click(function() {
    $('#budget_insert > tbody:last').append('<form onsubmit="return abc()"><td><input type="text" name="budget_amount" value=""></td><td><input type="text" name="item_code" value=""></td><td><input type="submit" value="입력"></td></form>');
    }); 
  $('#btn-delete-row').click(function() {
    $('#budget_insert > tbody:last > tr:last').remove();
  }); 
 	
  window.onload=function(){
		selectFunction();
		
	}

</script>
<body style="width: 1280px; margin: 0 auto;">
	<header><jsp:include page="/resources/include/header.jsp"/></header>
    
	<table id="budgetTable" border="1" cellspacing="3">
	  <tr>
	    <th>분류</th>
	    <th>예산</th>
	    <th>지출</th>
	  </tr>
	  <tbody></tbody>
	</table>
	
	<table id="budget_insert" border="1" cellspacing="3">
	  <tr>
	    <th>분류</th>
	    <th>예산</th>
	  </tr>
	  <tbody></tbody>
	</table>

<footer><jsp:include page="/resources/include/footer.jsp"/></footer>
</body>
</html>