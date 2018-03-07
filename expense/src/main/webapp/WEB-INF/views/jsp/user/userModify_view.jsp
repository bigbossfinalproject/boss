<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>

<style rel="stylesheet">
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.header{
width:1280px;
margin: 0 auto;

}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;  
}

body .container {
  position: relative;
  overflow: hidden;  
  width: 1000px;  
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  
  
  width: 100%;
  padding: 58px 40px 0;
}

body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}

/* 로그인 폼 사이즈 */
body .container .content form {
  position: relative;
  height: 600px;
}

body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
  
body .container .content label:not([for='agree']) {
  display: none;
}

/* 회원 정보수정 */
body .container .content input.inpt1 {
  font-size: 14px;
  display: block;
  width: 20%;
  font-family: 'Lato', sans-serif;
  height: 30px;
  margin-bottom: 3px;
  padding: 16px 13px;
  color: black;
  border: 1px solid #ffffff;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float: left;
  text-align: center;
  
}
body .container .content input.inpt2 {
  font-size: 14px;
  display: block;
  width: 60%;
  height: 30px;
  margin-bottom: 3px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float: left;
}

body .container .content input.inpt3 {
  font-size: 14px;
  display: block;
  width: 20%;
  height: 30px;
  margin-bottom: 3px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #ffffff;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  text-align: center;
}

body .container .content input.inpt4 {
  font-size: 14px;
  display: block;
  width: 60%;
  height: 30px;
  margin-bottom: 3px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #ffffff;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  float: left;
  text-align: center;
  
}

/*수정쪽  왼쪽 옵션 */
body .container .content .inpt2 {

  text-align:center;
  
  font-size: 14px;
  display: block;  
  height: 30px;
  color: #999999;
  background: transparent;
  
}


body .container .content input.submit {
 
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}

body .container .content .submit-wrap {
  
  position: absolute;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}

/* 커뮤티니게시판 추가 폼  */
body .container .content .signup-cont {
  display: none;
}
/*회원가입폼 추가 폼  */
body .container .content .join-cont {
  display: none;
  }

/*빅데이터 추가 폼  */
body .container .content .join-cont2 {
  display: none;  
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}



</style>

<%


%>

 <body>
 
 
 
 
 <c:if test="${root_Id !=null }">
 <div class="header">
 	<jsp:include page="../../../../resources/include/header.jsp"></jsp:include>	
  </div>
 </c:if>
 
 

<section class="container" id="container">
		    
		    
		    
		    <article class="half" id="half">
			       
              		<div class="tabs">
				            
				            <span class="tab info1 active"><a href="#login">basic info</a></span>
				            <c:if test="${root_Grade==1}">
				            <span class="tab info2"><a href="#join">bigdata info</a></span>
				            </c:if>
				            
				            
				            
				            <div class="content submit-wrap" >
							                    <input type="button" value="Sign up" class="submit" id="submit_button" name="submit_button" onclick="goMo()"/>
						   </div> 
			        </div>
			        
			        
			        
              		
			        <div class="content">				            
                     <form action="userModify.uo" id="modify" name="modify">		
	            				<div class="login-cont cont">
	            								<input type="hidden" id="root_Idn" name="root_Idn" value="${dto.root_Idn }">
	            								
	            								<input type="text" class="inpt1" required="required" value="Id" readonly="readonly">
							                    <input type="text" name="root_Id" id="root_Id" class="inpt4" required="required" placeholder="Your id" value="${dto.root_Id }" readonly="readonly">
							                    <label for="root_Id">id</label>
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">
							                    
							                    <input type="text" class="inpt1" required="required" value="Now Password" readonly="readonly">
	                                      		<input type="password" name="now_Pwd" id="now_Pwd" class="inpt2" required="required" placeholder="now password" value="${dto.root_Pwd }">
							                    <label for="now_Pwd">now password</label>
							                    <input type="text" class="inpt3" required="required" value="" readonly="readonly">
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="New Password" readonly="readonly">
	                                      		<input type="password" name="root_Pwd" id="root_Pwd" class="inpt2" required="required" placeholder="new password" value="${dto.root_Pwd }">
							                    <label for="root_Pwd">new password</label>
							                    <input type="text" class="inpt3" required="required" value="" readonly="readonly">
							                    
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="Name" readonly="readonly">
	                                       		<input type="text" name="root_Name" id="root_Name" class="inpt4" required="required" placeholder="Your name" value="${dto.root_Name }" readonly="readonly">
							                    <label for="root_Name">name</label>
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">                                  
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="Email" readonly="readonly">
	                    						<input type="email" name="root_Email" id="root_Email" class="inpt2" required="required" placeholder="Your email" value="${dto.root_Email }">
							                    <label for="root_Email">Your email</label>
							                    <input type="text" class="inpt3" required="required" value="" readonly="readonly">
							                      
	            				</div>
	            	 			<c:if test="${root_Grade==1 }">
	                      		<div class="join-cont cont">
	                      						<input type="text" class="inpt1" required="required" value="Address" readonly="readonly">
	        								 	<input type="text" name="root_Address" id="root_Address" class="inpt2" required="required" placeholder="Your address" value="${dto2.root_Address}">
	                						    <label for="root_Address">address</label>   
	                						    <input type="text" class="inpt3" required="required" value="" readonly="readonly">
	                						    
	                						    <input type="text" class="inpt1" required="required" value="Birth" readonly="readonly">
							                    <input type="text" name="root_Birth" id="root_Birth" class="inpt4" required="required" placeholder="Your birth" value="${dto2.root_Birth }" readonly="readonly">
							                    <label for="root_Birth">birth</label>
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="Gender" readonly="readonly">
	                                      		<input type="text" name="root_Gender" id="root_Gender" class="inpt4" required="required" placeholder="Your gender" value="${dto2.root_Gender }" readonly="readonly">
							                    <label for="root_Gender">gender</label>
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">
	                                      		
	                                      		<input type="text" class="inpt1" required="required" value="Level of education" readonly="readonly">
	                                      		<input type="text" name="root_Edu" id="root_Edu" class="inpt4" required="required" placeholder="Your level of education" value="${dto2.root_Edu }" readonly="readonly">
							                    <label for="root_Edu">education</label>
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="Marry" readonly="readonly">
	                                       		<input type="text" name="root_Marry" id="root_Marry" class="inpt4" required="required" placeholder="married ?" value="${dto2.root_Marry }" readonly="readonly">
							                    <label for="root_Marry">marry</label>                                      
							                    <input type="text" class="inpt3" required="required" value="Impossible" readonly="readonly">
	                                      
	                                      
	                                      		<input type="text" class="inpt1" required="required" value="Job" readonly="readonly">
	                    						<input type="text" name="root_Job" id="root_Job" class="inpt2" required="required" placeholder="Your Job" value="${dto2.root_Job }">
							                    <label for="root_Job">job</label>
							                    <input type="text" class="inpt3" required="required" value="" readonly="readonly">                           
									
				        		</div>
				        		
        			</c:if>		    
			         	</form>
			        </div>
		    </article>
		    
</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<!-- <script type="text/javascript">
function aa(){
	 if ($('#agree').is(":checked"))
		{
		  alert("check됨");
		  
		}else{
	 alert("check안됨");
		}
};
</script> -->
<script type="text/javascript">
function goMo(){
	document.getElementById('modify').submit();
	
};

</script>
<!--탭 선택 스크립트  -->
<script type="text/javascript">
$('.tabs .tab').click(function(){

    
    if ($(this).hasClass('info1')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.login-cont').show();
    }
    if ($(this).hasClass('info2')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.join-cont').show();
    }
});

</script>



 </body>
</html>





	

 
	
