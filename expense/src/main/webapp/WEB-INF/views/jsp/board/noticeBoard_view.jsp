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

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;  
}

textarea{
	font-family: 'Lato', sans-serif;
    background-color: #f8f8f8;
      color: #263238;
}

body .container {
  position: relative;
  overflow: hidden;
  
  width: 1000px;
  
  height: 700px;
  margin: 80px auto 0;
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
  margin-bottom: 25x;
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

 body .container .tabs2 {
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

 body .container .tabs .inpt2{
 width:78.5%;
 }

body .container .content{
text-align: center;
width:100%;
margin-top : 20px;
margin-bottom: 10px;
}

body .container .content2{
text-align: center;

margin-top : 20px;
margin-bottom: 30px;
margin-left: auto;
margin-right: auto;

}

body .container .half .tabs .welcome{
	
  font-size: 13px;
  font-weight: 700;
  margin-bottom: 15px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;  
}

body .container .content input.inpt:focus {
  border-color: #999999;
}


body .container .content .submit-wrap {
  margin-right : 5px;
  margin-top: 30px;
  width: 100%;
  float: right;
  
  
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

</style>



 <body>

<section class="container" id="container">
		    
		   
		    <article class="half" id="half">
		   		 <form action="mainBoard.bo">
				        <h1>Writer : ${dto.root_Id}</h1>
		       	     	<input type="hidden" id="bId" name="bId" value="${dto.bId }">
				        <div class="tabs">
					            <span class="welcome"> Title : ${dto.bTitle}</span>
				        </div>
				        
				        <div class="content2">
							                    <div class="inpt2">
							                    	<textarea rows="25px" cols="100%" class="welcome" id="bContent" name="bContent" readonly="readonly">${dto.bContent}</textarea>
							                    </div>
	        					                                
				        </div>
				        
				        <div class="content">
				        		
				        						<div class="submit-wrap">
								                        <input type="submit" value="list" class="submit"">
							                    </div>							                   
							                    
							                    
				        </div>
			       </form>
			        
		    </article>    
</section>
 </body>
</html>






	

 
	
