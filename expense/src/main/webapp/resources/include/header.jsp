<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
	.menubar {
		border: none;
		border: 0px;
		margin: 0px auto;
		padding: 0px;
		font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
			"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
			sans-serif;
		font-size: 14px;
		font-weight: bold;
		width: 1280px;
	}
	
	.menubar ul {
		background: rgb(109, 109, 109);
		height: 50px;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	
	.menubar li {
		float: left;
		padding: 0px;
	}
	
	.menubar li a {
		background: rgb(109, 109, 109);
		color: #cccccc;
		display: block;
		font-weight: normal;
		line-height: 50px;
		margin: 0px;
		padding: 0px 25px;
		text-align: center;
		text-decoration: none;
	}
	
	.menubar li a:hover, .menubar ul li:hover a {
		background: rgb(71, 71, 71);
		color: #FFFFFF;
		text-decoration: none;
	}
	
	.menubar li ul {
		background: rgb(109, 109, 109);
		display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
		height: auto;
		padding: 0px;
		margin: 0px;
		border: 0px;
		position: absolute;
		width: 200px;
		z-index: 200;
		/*top:1em;
		/*left:0;*/
	}
	
	.menubar li:hover ul {
		display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
	}
	
	.menubar li li {
		background: rgb(109, 109, 109);
		display: block;
		float: none;
		margin: 0px;
		padding: 0px;
		width: 200px;
	}
	
	.menubar li:hover li a {
		background: none;
	}
	
	.menubar li ul a {
		display: block;
		height: 50px;
		font-size: 12px;
		font-style: normal;
		margin: 0px;
		padding: 0px 10px 0px 15px;
		text-align: left;
	}
	
	.menubar li ul a:hover, .menubar li ul li:hover a {
		background: rgb(71, 71, 71);
		border: 0px;
		color: #ffffff;
		text-decoration: none;
	}
	
	.menubar p {
		clear: left;
	}
</style>

</head>
<body>
	<div class="menubar">
		<ul>		
		<li><a href="boardList.bo">Home</a></li>
		<li><a href="#">커뮤니티</a>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="boardList.bo">자유게시판</a></li>
			</ul>		 
		</li>
		<li><a href="#">정보입력</a>
			<ul>
				<li><a href="budget_page.bg">예산</a></li>
				<li><a href="list.io">수입</a></li>
				<li><a href="expense_list.do">지출</a></li>
			</ul>
		</li>
		<li><a href="#">분석</a>
			<ul>
				<li><a href="#">분석 1</a></li>
			    <li><a href="#">분석 2</a></li>		 	
			</ul>
		</li> <li><a href="#">설정</a>
			<ul>
				<li><a href="item_list.do">항목</a></li>
				<li><a href="asset_list.do">자산</a></li>
				<li><a href="#">대출</a></li>
				<li><a href="#">카드</a></li>
			</ul>
		</li>
		 
		<li><a href="#">${ root_Id }님 환영합니다.</a></li>
		<li><a href="#" style="font-size: 20px">▼</a>
			<ul>
				<li><a href="userLogin.uo">로그아웃</a></li>
				<li><a href="userModify_view.uo?root_Id=${root_Id }">정보 수정</a></li>
				<li><a href="userDelete.uo?root_Id=${root_Id }">탈퇴</a></li>
			</ul>	 
		 </li>		 
		</ul>		
	</div>
	
</body>

</html>
