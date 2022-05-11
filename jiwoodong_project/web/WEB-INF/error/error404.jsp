<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>error404 페이지</title>
<style>
	.s_tt {
		font-size: 2.5em;
	    font-weight: bold;
	    color: gray;
	}
</style>
</head>
<body>
	
	<div style="width: 1200px; height: 100%; margin: 0 auto;">
		<div style="text-align: center;">
			<div>
				<img style="width: 30%;" src="https://media.discordapp.net/attachments/958566133752016901/973806289945767966/0798f7fd8ed782a7.png?width=671&height=671"/>
			</div>
			<div>
				<span class="s_tt">죄송합니다.</span>
				<span class="s_tt" style="display: block;">요청하신 페이지를 찾을 수 없습니다.</span>
				<span style="display: block; margin: 50px;">방문하시려는 페이지의 주소가 잘못 입력되었거나, <br>
				페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. <br>
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다. <br>
				감사합니다.</span>
				<button id="s_jwd_btn" style="width: 200px; height: 50px;" class="btn btn-primary pull-right">지우동 홈페이지 이동</button>
			</div>
		</div>
	</div>
	
	<script>
		$("#s_jwd_btn").click(function() {
			location.href="/jwd";
		});
	</script>
	
</body>
</html>