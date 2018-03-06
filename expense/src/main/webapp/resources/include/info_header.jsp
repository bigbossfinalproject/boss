<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.amount_frame {
		position:fixed;
		top:100px;
		width: 1280px;
		height: 50px;
		background: #4169e1;
		z-index: 400;
	}
	
	.info_title {
		width:100px;
		float:right;
		line-height:50px;
		color:#fff;
		text-align: center;
		font-weight:bold;
		margin: 0;
	}
	
	.info_amount {
		width:120px;
		margin: 5px;
		float:right;
		line-height:40px;
		padding-right:10px;
		color:#191970;
		text-align: right;
		background: #fff;
		font-weight:bold;
		border-radius: 5px;
	}
	
</style>

<script type="text/javascript">
function headerFunction() {
	$.ajax(
		{
			url : './header_info.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				var result=data.list;
				console.log(result);
				var row="";
				for (var i = 0; i < result.length; i++) {				
					
					row+="<div class=info_amount>"+result[i].toLocaleString()+"</div>"
					if(i==0){
						row+="<div class=info_title>자산총액</div>"
					}else if(i==1){
						row+="<div class=info_title>계좌잔액</div>"
					}else if(i==2){
						row+="<div class=info_title>현금잔액</div>"
					}
				}
				$(".amount_frame").html("");
				$('.amount_frame').append(row);
				
			},
			error : function() {
				alert('통신실패!!');
			}
		})
	
}
 
</script>
</head>
<body>
	<div class="amount_frame">
										
					<div class=info_amount>1000</div>"
					<div class=info_title>자산총액</div>"
					<div class=info_amount>1000</div>"
					<div class=info_title>계좌잔액</div>"
					<div class=info_amount>1000</div>"
					<div class=info_title>현금잔액</div>"
	
	
	</div>
</body>
</html>