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

.header {
	width:1280px;
	margin:0 auto;
}

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}



body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;  
}

body .container {
  position: relative;
  overflow: hidden;  
  width: 1000px;  
  height: 800px;
  margin: 120px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  
  width: 100%;
  
  height: 100%;
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
  height: 400px;
  
}
/* 회원가입의 폼 사이즈 */
body .container .content .join-cont form{
  position: relative;
  height: 375px;
  
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
  
  /* 로그인폼 옵션 */
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

/* 회원가입폼 옵션 */
body .container .content input.inpt2 {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 30px;
  margin-bottom: 3px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}

/*게시판 옵션  */
body .container .content .inpt2 {
  
  margin-top:10px;
  text-align:center;
  width:15%;
  font-size: 14px;
  display: block;  
  height: 30px;
  color: #999999;
  background: transparent;
  float: left;
}



/*게시판 제목 출력란 사이즈  */
body .container .content .form div:nth-of-type(3){
  width:40%;
}
/*게시판 게시물 출력란 사이즈  */
body .container .content .list{
	border: 1px solid #d9d9d9;
	text-align:center;
	clear: both;	
}

/* 환영메시지 (현재사용 x) */
body .container .half .tabs .welcome{
	
	 font-size: 13px;
 	 font-weight: 700;
  	margin-bottom: 23px;
  	text-indent: 6px;
  	letter-spacing: 7px;
  	text-transform: uppercase;
  	color: #263238;
	float:right;	

}


body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
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
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "■";
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
/*로그인 추가 폼  */
body .container .content .login-cont {
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
String loginId = (String)request.getAttribute("loginId");
String root_Id = (String)session.getAttribute("root_Id");
String noticeSize = (String)request.getAttribute("noticeSize");
String communiteSize = (String)request.getAttribute("communiteSize");

%>

 <body>
 

<section class="container" id="container">
		    
		    
		    
		    <article class="half" id="half">
			        <h1> <img src="boss1.jpg" width="60%"></h1>
			       
			       	
              		
              		<div class="tabs">
				            <span class="tab signin active"><a href="#signin">notice</a></span>
				            <span class="tab signup"><a href="#signup">communite</a></span>
				            <span class="tab login"><a href="#login">Login</a></span>
				            <span class="tab join"><a href="#join">join</a></span>
			        </div>
			        
			        
              		
			        <div class="content">				            
                      		<div class="signin-cont cont">
                              		
					                <form action="userLogin.uo" method="post" class="form">
					                		
						                    <div class="inpt2">No</div>
						                    <div class="inpt2">Writer</div>
						                    <div class="inpt2">Title</div>
						                    <div class="inpt2">Date</div>
						                    <div class="inpt2">Hit</div>
						                   	  <%if(noticeSize.equals("0")){%>
						                    	<h1>(notice)등록된 글이 없습니다.</h1>
						                    <%} %>		
						                    
						                    <c:forEach items="${list}" var="dto">
						                    <div class="list">	
						                   			          
							                    	<div class="inpt2">${dto.bId}</div>
							                    	<div class="inpt2">${dto.root_Id }</div>
							                    	<div class="inpt2"><a href="noticeBoard_view.bo?bId=${ dto.bId}">${dto.bTitle}</a></div>
							                    	<div class="inpt2">${dto.bDate}</div>
							                    	<div class="inpt2">${dto.bHit}</div>
						                  	</div>
						                  	</c:forEach>						                  	
        					        </form>                              		
    				        </div>
    				        
                      		<div class="signup-cont cont">              				  
                              		<form  class="form" action="boardWrite_view.bo?bId=${dto2.bId }">					                		
						                     <div class="inpt2">No</div>
						                    <div class="inpt2">Writer</div>
						                    <div class="inpt2">Title</div>
						                    <div class="inpt2">Date</div>
						                    <div class="inpt2">Hit</div>
						                  
						                    <%if(communiteSize.equals("0")){%>
						                    	<h1>(communite)등록된 글이 없습니다.</h1>
						                    <%} %>
						                      
						                    <c:forEach items="${list2}" var="dto2">
						                    
						                    <div class="list">
							                    	<div class="inpt2">${dto2.bId}</div>
							                    	<div class="inpt2">${dto2.root_Id }</div>
							                    	
							                    	<div class="inpt2">
							                    		<%-- <a href="boardContent.bo?bId=${dto2.bId }">${dto2.bTitle}</a> --%>
							                    		<a href="javascript:check2(${dto2.bId});">${dto2.bTitle}</a>
							                    	</div>							                    	
							                    	<div class="inpt2">${dto2.bDate}</div>
							                    	<div class="inpt2">${dto2.bHit}</div>
						                  	</div>
						                  	</c:forEach>
        					        </form>    	
            				</div>
            				
            				
            				
            				<div class="login-cont cont">              				  
                              		<form action="userLogin.uo" method="post">
						                    <input type="text" name="loginId" id="loginId" class="inpt" required="required" placeholder="Your id">
						                    <label for="loginId">Your id</label>
						                    <input type="password" name="loginPwd" id="loginPwd" class="inpt" required="required" placeholder="Your password">
                						    <label for="loginPwd">Your password</label>
						                  
                                      		<input type="checkbox" id="remember" class="checkbox">
						                    <label for="remember">Remember me</label>						                    
                                      		
                                      		<div class="submit-wrap">
							                        <input type="submit" value="Sign in" class="submit">
							                        <a href="#" class="more">Forgot your password ?</a>
						                    </div>
        					        </form>                    
            				</div>
            				
            				
            				
            				 
                      		<div class="join-cont cont">
              				
                              		<form class="join-cont1" id ="basicJoin" name="basicJoin" action="userJoin.uo" class="join">
						                    <input type="text" name="root_Id" id="root_Id" class="inpt2" required="required" placeholder="Your id">
						                    <label for="root_Id">id</label>
                                      
                                      		<input type="password" name="root_Pwd" id="root_Pwd" class="inpt2" required="required" placeholder="Your password">
						                    <label for="root_Pwd">password</label>
                                      
                                      		<input type="password" name="root_Pwd2" id="root_Pwd2" class="inpt2" required="required" placeholder="Your password check">
						                    <label for="root_Pwd2">check password</label>
                                      
                                       		<input type="text" name="root_Name" id="root_Name" class="inpt2" required="required" placeholder="Your name">
						                    <label for="root_Name">name</label>                                      
                                      
                    						<input type="email" name="root_Email" id="root_Email" class="inpt2" required="required" placeholder="Your email">
						                    <label for="root_Email">Your email</label>
						                    
                                    		<input type="checkbox" id="agree" name ="agree" class="checkbox">						                 
						                    <label for="agree">agree bigdata</label>
						                
        					        </form>  
        					        
        					        <form class="join-cont2" id="bigDataJoin" name="bigDataJoin" action="userJoin.uo" class="join">
        					             <input type="text" name="root_Address" id="root_Address" class="inpt2" required="required" placeholder="Your address">
                						    <label for="root_Address">Your address</label>   
                						    
						                    <input type="text" name="root_Birth" id="root_Birth" class="inpt2" required="required" placeholder="Your birth">
						                    <label for="root_Birth">birth</label>
                                      
                                      		<input type="text" name="root_Gender" id="root_Gender" class="inpt2" required="required" placeholder="Your gender">
						                    <label for="root_Gender">gender</label>
                                      
                                      		<input type="text" name="root_Edu" id="root_Edu" class="inpt2" required="required" placeholder="Your level of education">
						                    <label for="root_Edu">education</label>
                                      
                                       		<input type="text" name="root_Marry" id="root_Marry" class="inpt2" required="required" placeholder="married ?">
						                    <label for="root_Marry">marry</label>                                      
                                      
                    						<input type="text" name="root_Job" id="root_Job" class="inpt2" required="required" placeholder="Your Job">
						                    <label for="root_Job">job</label>                           
											 
        					        </form>   
        					        
        					         <div class="submit-wrap2" >
										<input type="button" value="Sign up" class="submit" id="submit_button" name="submit_button" onclick="aa();">
									</div> 
						    	
			        		</div>
			        		
			        		
			        		
			        </div>
		    </article>
		    
</section>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
function aa(){
	 if ($('#agree').is(":checked"))
		{
		  alert("check됨");
		  
		}else{
	 alert("check안됨");
		}
};
</script>


<!--회원 가입시 빅데이터 동의 체크했을 경우 확장 스크립트  -->
<script type="text/javascript">
 
var agreeCheckBox = document.getElementById('agree')

agreeCheckBox.onchange = function() {
  if(agreeCheckBox.checked) {	  
	 $('.join-cont1').css('width','47%'); 
	  $('.join-cont1').css('float','left');
	  
	  $('.join-cont2').css('width','47%');
	  $('.join-cont2').css('float','right');
		
	
	  $('.join-cont2').show();
	
  } else {
	 
	  $('.join-cont1').css('width','100%');
	  $('.join-cont2').hide();
	  
  }
};  
/* 
 $(function(){
	$('#agree').click(function(){ 
		if($('#agree').prop('checked')) {
			 $('.join-cont1').css('width','47%'); 
			  $('.join-cont1').css('float','left');
			  
			  $('.join-cont2').css('width','47%');
			  $('.join-cont2').css('float','right');
				
			  $('.join-cont2').show();
			$('#agree').prop("checked",true);  
		}
		else {
			  $('.join-cont1').css('width','100%');
			  $('.join-cont2').hide();
			  $('#agree').prop("checked",false); 
		}	
		
	});
}); 
 */
/*  function ab(){
	if($('#agree').is(':checked')){
		  $('.join-cont1').css('width','47%'); 
		  $('.join-cont1').css('float','left');
		  
		  $('.join-cont2').css('width','47%');
		  $('.join-cont2').css('float','right');
			
		
		 $('.join-cont2').show();
		 
	}
	else{
		
	}
}); 
 */
</script>

<!--탭 선택 스크립트  -->
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();        
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
    
    if ($(this).hasClass('login')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.login-cont').show();
    }
    if ($(this).hasClass('join')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.join-cont').show();
    }
});

</script>

<!--로그인 되지 않은 상태에서 글 보려고 하는경우 로그인 페이지로 전환 스크립트 -->
<script type="text/javascript">

function check2(bId){
	<%if(loginId.equals("") && root_Id==null){%>	
		alert("로그인이 필요합니다.")
		location.href="userLogin.uo";
	<%}%>
	<%if(root_Id!=null){%>	
	
		location.href="communiteBoard_content.bo?bId=" + bId; 
<%}%>
	
}
</script>

 </body>
</html>





	

 
	
