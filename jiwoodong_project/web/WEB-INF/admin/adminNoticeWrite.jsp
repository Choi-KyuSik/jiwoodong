<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
		<header style="margin-top: 10px;">
        <div id="p_main_top" style="width: 1200px; margin: 0 auto; border-bottom: 2px solid silver;">
            <div style="float: right;">
                <p style="font-size: 10px; margin: 25px 30px 0 10px;">환영합니다 손은진님</p>
                <a href=""
                    style="font-size: 14px; margin: 0 0 0 30px; color: red; font-weight: bold; text-decoration: none;">로그아웃</a>
            </div>
            <div id="p_top_logo" style="float: left; margin: 0 0 0 30px;">
                <a href="http://localhost:8090/jwd/AdminMyPage"><img
                        src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
                        width="80px" alt="logo" id="logo"></a>
            </div>
            <div style="float: right; margin-top: 10px;">
                <div style="text-align: center;">
                    <img src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
                        alt="프사" width="60px">
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </header>
	<div class="container">
		<div class="row" style="width: 1200px; margin: 0 auto; padding-top: 30px;">
			<form method="post" action="AdminNoticeWriteDo">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">공지사항 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="ntTitle" maxlength="300" required="required"></td>
						</tr>
						<tr>	
							<td><textarea class="form-control" placeholder="글 내용" name="ntContent" maxlength="4000" style="height: 350px; resize: none;" required="required"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" style="float: right; margin-right: 10px;" value="글쓰기">
				<input type="button" id="back_btn" class="btn btn-secondary pull-right" style="float: right; margin-right: 10px;" value="뒤로가기">
			</form>
		</div>
	</div>
	<script>
		$("#back_btn").click(function() {
			history.back();
		});
	</script>
	
</body>
</html>