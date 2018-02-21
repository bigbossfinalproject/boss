<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<meta charset="UTF-8">
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script>

var var1='param1';

var var2='param2';

var normal_url = 'aaa.html'; // [내부url] 크로스 도메인 지원 되지 않음.

var cross_domain_url = 'http://www.naver.com/';



function sample_ajax(){

if(confirm('처리하겠습니까?')){

$.post(normal_url,{ param1:var1, param2:var2, param3:'string3'},function(result){

if(result == 1){ // [내부url] 에 파라메터를 던지고, 출력된 값이 1일 경우

alert('성공');

}else{

alert('실패');

}

alert(result);

}, "text");

}

}

function sample_jsonp(){

if(confirm('처리하겠습니까?')){

$.ajax({

url: cross_domain_url,

type: 'GET', // POST 는 내부 콜만 가능

data: {param1: var1,param2: var2}, // jsonp 값을 전달할 때 사용되는 파라미터 변수명

dataType: 'jsonp',

jsonpCallback: "callback", // 콜백 함수 지정한다. 이 속성을 생략하면 callback 파라미터 변수명으로 전달된다.

success: function(data) {

console.log("success : " , data);

alert('성공 ! \n\n일반 데이터 > ' + data.id + '\n오브젝트 데이터 > '+ data.object_data.name);

},

error: function(data) {

alert('실패');

console.log('err : ', data);

}

});

}

}



</script>

<input type="button" value="sample_ajax" onclick='sample_ajax();'><br><br>

<input type="button" value="sample_jsonp" onclick='sample_jsonp();'><br><br>



JSONP >> callback({'object_data':{'name':'hong gil-dong'},'id':'hello'})



</html>