<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="p_main_top">
			<div id="p_main_logo_bar">
				<div id="p_main_logo">
					<a href="<%=request.getContextPath()%>"><img
						src="https://cdn.discordapp.com/attachments/958566133752016901/966262090698457108/logo.png"
						alt="지우동로고"></a>
				</div>
				<div id="p_main_bar">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link" href="#about">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#service">Service</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#notice">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="enrollMain">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="AdminLogin">관리자로그인</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div
			style="clear: both; height: 500px; background-image: url(https://www.gongbiz.kr/resources/static/assets/img/common/bg-img@2x.png); background-size: cover; color: white;">
			<div id="p_main_login">
				<div id="p_small_text">Welcome To JIWOODONG!</div>
				<div id="p_big_text">IT'S NICE TO MEET YOU</div>
				<div id="p_login_btn">
					 <!-- 로그인 여부에 따른 메뉴 변화 -->
        			<% if (session.getAttribute("password") == null) { %>
						<button type="button" id="login_btn" class="btn btn-primary btn-lg">
							<a href="loginMain">로그인</a>
						</button>
					<% } else { %>
						<button type="button" id="logout_btn" class="btn btn-primary btn-lg">
						 	<a href="logout">로그아웃</a>
						 </button>
      				 <% } %>
					<br>
					<% if (session.getAttribute("bu_id") != null && session.getAttribute("um_id") == null) { %>
					<button type="button" id="bum_mypage_btn" class="btn btn-secondary btn-sm">
						<%= session.getAttribute("bu_id") %>'s page
						</button>
					<% } else if(session.getAttribute("um_id") != null && session.getAttribute("bu_id") == null){ %>
					<button type="button" id="um_mypage_btn" class="btn btn-secondary btn-sm">
							 <%= session.getAttribute("um_id") %>'s page
							 </button>
					 <% } %>
				</div>
			</div>
		</div>
	</header>
	<script>
	//사업자 마이페이지로 이동
		    $("#bum_mypage_btn").click(function() {
		    	location.href="BumMainPage";
		    });		
	//사용자 마이페이지로 이동
			    $("#um_mypage_btn").click(function() {
		    	location.href="UserMypage";
		    });	
			
	</script>
</body>
</html>