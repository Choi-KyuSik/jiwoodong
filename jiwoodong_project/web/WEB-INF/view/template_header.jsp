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
						<li class="nav-item"><a class="nav-link" href="/jwd/#about">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/jwd/#service">Service</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/jwd/#notice">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="enrollMain">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="AdminLogin">관리자로그인</a>
						</li>
					</ul>
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