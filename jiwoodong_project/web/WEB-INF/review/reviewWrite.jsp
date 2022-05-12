<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css">    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
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
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<style>
#s_rv_section {
	width: 800px;
	height: 500px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 20px;
	background-color: #f8f9ff;
	margin: 0 auto;
	margin-bottom: 20px;
}

#s_rv_id {
	font-size: 1.2em;
	font-weight: bold;
}

#s_rv_love {
	margin: 10px 0;
}

#s_rv_date {
	color: gray;
	font-size: .9em;
}

#s_rv_content {
	margin-bottom: 10px;
	word-break: break-all;
	width: 500px;
}

#s_rv_title {
	text-align: center;
	font-size: 2em;
	font-weight: bold;
	margin: 20px;
}

#s_rv_main_box {
	margin: 0 auto;
	width: 1200px;
}

#s_rv_btn_box {
	clear: both;
	text-align: center;
	padding-top: 30px;
	line-height: 4;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
    font-size: 19px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #0074ba;
}
</style>
</head>
<body>
<header>
 	<div>
		<%@ include file="../view/user/user_header.jsp"%>
	</div>  
</header> 
	<div class="container" style="background-color: rgb(241, 241, 241); border-radius: 15px; height: auto;margin: 0 auto;position: relative;top: 30px;">
		<div class="row" style="width: 100%; margin: 0 auto; padding-top: 30px; padding-bottom: 30px;">
			<form method="post" action="userRvWrite.lo">
				<table class="table">
					<thead>
						<tr>
							<th colspan="3">리뷰 작성</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td width="100%;">
								<input type="hidden" class="form-control" placeholder="예약번호" name="bkNo" maxlength="300" required="required">
								
							</td>
						</tr>
						<tr>
							<td style="line-height: 1; margin: 10px 0; vertical-align: middle;">
					      		<p id="rating_ct" style="display: inline-block; color: dimgray; margin-bottom: 0;">별점을 선택해주세요 : </p>
						      	<p name ="rvScore" class="star_rating" style="display: inline-block; margin-bottom: 0;">
								    <a href="1" class="on">♥</a>
								    <a href="2" class="on">♥</a>
								    <a href="3" class="on">♥</a>
								    <a href="4" class="on">♥</a>
								    <a href="5" class="on">♥</a>
								</p>
							</td>
						</tr>					
						<tr>	
							<td><textarea id="rvContent" class="form-control" placeholder="즐거운 시간 보내셨나요? from. 지우동" name="rvContent" maxlength="4000" style="height: 350px; resize: none;" required="required"></textarea></td>
						</tr>
						<tr>
								<td class="table-light" id="s_us_no">
									<input type="hidden" role="uploadcare-uploader" data-public-key="c545e991d9de45462444"
										data-tabs="file camera url facebook gdrive gphotos" />
					<!-- hidden input에 주소 url을 value로 받을거여서 같이 만듬 세트로 놔두면 편할 듯, 위에거가 파일등록 버튼 -->
									<input type="hidden" name="fileUrl" id="fileUrl">
									</td>
								<td colspan="2" class="table-light"><span style="display: none;"></span></td>
							</tr>
					</tbody>
				</table>
				<input id="rv_write_btn" type="button" class="btn btn-primary pull-right" style="float: right; margin-right: 10px;" value="글쓰기">
				<input type="button" id="back_btn" class="btn btn-secondary pull-right" style="float: right; margin-right: 10px;" value="뒤로가기">
			</form>
		</div>
	</div>
	<script>
		$("#back_btn").click(function() {
			history.back();
		});
		
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			console.log($(this).attr('href'));
			var obj = $(this);
			console.log(obj.attr('href'));
			//console.log("this가 뭔데?" + JSON.Stringfy(thisVal));
			return false;
		});
		$("#rv_write_btn").click(function(){
			var val = $(".on").last();
			var rvScore = val.attr('href');
			var rvContent = $('#rvContent').val();
			
			console.log("rvScore:"+rvScore);
			console.log("rvContent:"+rvContent);
			 /* location.href = ”url?name=값+"&"+name2=값”; */
			location.href="userRvWrite.lo?rvScore="+rvScore+"&rvContent="+rvContent;
		});
	</script>
	
	<script>
		/* 이미지등록 */
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	
		singleWidget.onUploadComplete(function(info) {
			$("#fileUrl").val(info.cdnUrl);
		});
	</script>
</body>
</html>