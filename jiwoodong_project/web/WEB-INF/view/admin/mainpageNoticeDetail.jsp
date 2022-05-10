<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
href="<%=request.getContextPath()%>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>공지사항 상세조회</title>
<!-- google font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap');
    </style>
    <style>
#s_main_tt {
	font-size: 1.3em;
	font-weight: bold;
	border-top: 1px solid;
	border-bottom: 1px solid;
	padding: 20px 10px;
}

.s_main_ct {
	text-align: left;
	margin-left: 10px;
	margin-bottom: 30px;
	padding-bottom: 30px;
	margin-top: 30px;
	display: block;
	width: 100%;
	/* height: 50%; */
	border: none;
	resize: none;
	cursor: context-menu;
	min-height: 200px;
	overflow-y: hidden;
	resize: none;
}

.s_main_ct:focus {
	outline: none;
}

.img_box {
	width: 1200px;
	overflow:hidden;
    margin:0 auto;	
}

.img_thum {
	width:50%;
    object-fit: contain;;
}
</style>
<body>
	<div>
		<%@ include file="../template_header.jsp"%>
	</div>
	
	<div style="margin: 0 auto; width: 1200px;">
		
		<div style="font-size: 2em; font-weight: bold; margin: 30px 0;">
			공지사항
		</div>
		
		<div>
			<div id="s_main_tt">
				${adnvoList.ntTitle}
			</div>
			<div style="text-align: center;">
				<c:if test="${empty adnvoList.flGno}">
					<textarea class="s_main_ct" readonly="readonly">${adnvoList.ntContent}</textarea>
				</c:if>
				<c:if test="${not empty adnvoList.flGno}">
					<div class="img_box">
						<img class="img_thum" src="${adnvoList.flGno }">
					</div>
						<textarea class="s_main_ct"  readonly="readonly">${adnvoList.ntContent}</textarea>
				</c:if>
			</div>
		</div>
		<div style="text-align: center; border-top: 1px solid darkgray;">
			<input type="button" style="margin: 20px 0;" id="back_btn" class="btn btn-secondary pull-right" value="뒤로가기">
			<input type="button" id="s_notice_list" class="btn btn-primary pull-right" value="목록으로">
		</div>
	</div>	
	
	
	<script>
		$("#back_btn").click(function() {
			history.back();
		});
		
		$("#s_notice_list").click(function() {
			location.href="MainpageNotice";
		});
		
		
		
		 (function () {
			  var textEle = $('.s_main_ct');
			  textEle[0].style.height = 'auto';
			  var textEleHeight = textEle.prop('scrollHeight');
			  textEle.css('height', textEleHeight);
			})();
	</script>
	
</body>
</html>