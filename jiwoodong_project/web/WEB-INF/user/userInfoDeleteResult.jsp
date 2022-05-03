<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>회원 탈퇴 성공 페이지</title>
</head>
<body>
	
	
	<article>
        <div class="s_row">
      		<div id="c_us_info_edit_info">
      			<div style="text-align: center;">
					<img id="s_us_ss_delete_img" src="https://cdn.discordapp.com/attachments/958566133752016903/966709570955268146/22b75afde37f348d.png">
					<div style="margin-bottom: 30px;">
						<span id="s_us_ss_delete_span">회원 탈퇴가</span> <span id="s_us_ss_delete_span_2">완료되었습니다.</span>
					</div>
				</div>
				<hr>
				<div id="s_us_ss_delete_box">
					<img id="s_us_ss_delete_img_2" src="https://cdn.discordapp.com/attachments/958566133752016901/966199476131889172/jigu.png">
					<div id="s_us_ss_delete_box_ct">그 동안 지우동 서비스를 사용해 주셔서 감사합니다.</div>
					<div>더 좋은 서비스로 보답하겠습니다.</div>
					<button type="button" id="s_us_mainpage" class="btn btn-primary">지우동 홈으로 가기</button>
				</div>
			</div>
      </div>
    </article>
    
    <script>
    	$("#s_us_mainpage").click(function() {
    		location.href="/jwd";
    	});
	</script>
	
</body>
</html>