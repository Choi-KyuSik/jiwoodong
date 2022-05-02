<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<form action="AdminLogin" method="post">
		<h1>관리자 로그인 페이지입니다.</h1>
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" id="id" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" id="pwd" name="pwd" required></td>
			</tr>
		</table>
		<br>
		<button id="login">로그인</button>
	<button onclick="history.back()">뒤로가기</button>
	</form>

	<br>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<ul>
		<li onclick="kakaoLogin();"><a href="javascript:void(0)"><img src="https://media.discordapp.net/attachments/965916528350478386/970250948553371668/kakao_login_medium.png">
		</a></li>
	</ul>
	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('f276b6cc77a90e02edac0cb9b783cc3f'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response);
							// alert("로그인 성공");
							// window.location.href="AdminMainPage";
							var obj = response;
							for(response in obj) {
								console.log("key : " + response + ", value : " + obj[response]);
								// 내 아이디 값 : 2224536524
							}
							console.log(Object.values(obj)[0]);
							if(Object.values(obj)[0] == 2224536524) {
								alert("손은진님 로그인되었습니다.");
								window.location.href="AdminMainPage";
							} else {
								alert("가입되지 않은 아이디입니다.");
							}
						},
						fail : function(error) {
							console.log(error);
							alert("로그인 실패");
						},
					})
				},
				fail : function(error) {
					console.log("에러발생");
					console.log(error);
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response);
						alert("로그아웃 성공");
					},
					fail : function(error) {
						console.log(error);
						alert("로그아웃 실패");
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>

</body>
</html>