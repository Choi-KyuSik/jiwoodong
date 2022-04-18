<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</body>
</html>