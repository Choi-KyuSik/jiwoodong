<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>Insert title here</title>
</head>
<body>


	<section id="contents">

		<div id="s_rv_main_box">
			<div id="s_rv_title">리뷰 상세 조회</div>
			<form id="frm" method="post" action="#">
				<c:forEach items="${rvDetailList }" var="i">
					<section id="s_rv_section">
						<article style="float: left;">
							<div>
								<div id="s_rv_id">${i.umId }</div>
								<div id="s_rv_love">${i.rvScore }</div>
								<div id="s_rv_date">${i.rvWriteDate }</div>
							</div>
						</article>
						<article style="float: right;">
							<div id="s_rv_content">${i.rvContent }</div>
							<div style="padding-top: 10px;">
								<img style="width: 300px; height: 300px;"
									src="https://media.discordapp.net/attachments/958682757230366780/973048351383777300/KakaoTalk_20220509_112623382.jpg?width=905&height=905">
							</div>
						</article>
						<div id="s_rv_btn_box">
							<input type="button" id="back_btn"
								class="btn btn-secondary pull-right" value="뒤로가기"> <input
								type="button" id="s_update_btn"
								class="btn btn-primary pull-right" value="수정하기"> <input
								type="button" id="s_delete_btn"
								class="btn btn-danger pull-right" value="삭제하기">
						</div>
					</section>
				</c:forEach>
			</form>
		</div>
	</section>
</body>
</html>