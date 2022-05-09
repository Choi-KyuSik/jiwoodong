<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>리뷰 상세 조회페이지</title>
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
</style>
</head>
<body>

	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	
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
	
	<script>
		$("#back_btn").click(function() {
			history.back();
		});
		
		$("#s_update_btn").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "#");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		});
		
		$("#s_delete_btn").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "#");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		})
	</script>
	
	<!-- 메뉴버튼 눌렀을 때 이동할 페이지 -->
	<script>
    	$("#s_notice_menu").click(function() {
    		location.href="AdminNoticeList";
    	});
    	
    	$("#s_bu_accept_menu").click(function() {
    		location.href="AdminBuAcceptList";
    	});
    	
    	$("#s_bu_accept_result_approval_menu").click(function() {
    		location.href="AdminBuAcceptApprovalList";
    	});
    	
    	$("#s_bu_accept_result_reject_menu").click(function() {
    		location.href="AdminBuAcceptRejectList";
    	});
    	
    	$("#s_bu_info_menu").click(function() {
    		location.href="AdminBuInfoList";
    	});
    	
    	$("#s_bu_delete_menu").click(function() {
    		location.href="AdminBuInfoDeleteList";
    	});
    	
    	$("#s_us_info_menu").click(function() {
    		location.href="AdminUsInfoList";
    	});
    	
    	$("#s_us_delete_menu").click(function() {
    		location.href="AdminUsInfoDeleteList";
    	});

    	$("#s_review_menu").click(function() {
    		location.href="AdminReviewList";
    	});
    </script>
</body>
</html>