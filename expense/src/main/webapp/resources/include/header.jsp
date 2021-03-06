<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
	.main_header {
		position: fixed;
		top:0;
		background:#1e90ff;
		width:1280px;
		height:100px;
		z-index: 500;
		margin:0 auto;
		clear:both;
	}
	
	.menutop{
		height:50px;
	}
	
	.menubar {
		border: none;
		border: 0;
		margin: 0 auto;
		padding: 0;
		font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
			"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
			sans-serif;
		font-size: 14px;
		font-weight: bold;
		width: 1280px;
		position:absolute;
	}
	
	.menubar ul {
		background: #1e90ff;
		height: 50px;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	
	.menubar li {
		float: left;
		padding: 0;
	}
	
	.menubar li a {
		background: #1e90ff;
		color: #fff;
		text-shadow:0 0 2px #00008b;
		display: block;
		font-weight: normal;
		line-height: 50px;
		margin: 0;
		padding: 0 25px;
		text-align: center;
		text-decoration: none;
	}
	
	.menubar li a:hover, .menubar ul li:hover a {
		background: #4682b4;
		color: #FFFFFF;
		text-decoration: none;
	}
	
	.menubar li ul {
		background: #4682b4;
		display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
		height: auto;
		padding: 0px;
		margin: 0px;
		border: 0px;
		position: absolute;
		width: 200px;
		z-index: 450;
		/*top:1em;
		/*left:0;*/
	}
	
	.menubar li:hover ul {
		display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
	}
	
	.menubar li li {
		background: #4682b4;
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
		margin: 0;
		padding: 0 10px 0 15px;
		text-align: left;
	}
	
	.menubar li ul a:hover, .menubar li ul li:hover a {
		background: #b0c4de;
		border: 0;
		color: #000000;
		text-shadow:none;
		font-weight:bold;
		text-decoration: none;
	}
	
	.menubar p {
		clear: left;
	}
	
</style>

</head>
<body>
	<div class="menu_frame">
		<div class="main_header">
			<div class="menutop"></div>
			<div class="menubar">
				<ul>		
				<li><a href="testMain.bo">Home</a></li>
				<li><a href="#">커뮤니티</a>
					<ul>
						<li><a href="noticeBoard.bo">공지사항</a></li>
						<li><a href="communiteBoard.bo">자유게시판</a></li>
					</ul>		 
				</li>
				<li><a href="#">입력</a>
					<ul>
						<li><a href="budget_page.bg">예산</a></li>
						<li><a href="list.io">수입</a></li>
						<li><a href="expense_list.do">지출</a></li>
					</ul>
				</li>
				<li><a href="#">분석</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/income-analysis.do">소득 분석</a></li>
					    <li><a href="<%=request.getContextPath() %>/expense-analysis.do">소비 분석</a></li>		 	
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
						<li><a href="userLogout.uo">로그아웃</a></li>
						<li><a href="userModify_view.uo?root_Idn=${root_Idn }">정보 수정</a></li>
						<li><a href="userDelete.uo?root_Idn=${root_Idn }">탈퇴</a></li>
					</ul>	 
				 </li>		 
				</ul>		
			</div>
		</div>
	</div>
	
</body>

</html>
