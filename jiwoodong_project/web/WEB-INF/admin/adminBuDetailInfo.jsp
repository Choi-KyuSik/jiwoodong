<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 신청 상세보기</title>
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
		<div id="p_main_top">
			<div style="float: right;">
				<p id="p_welcome_msg">환영합니다 손은진님</p>
				<a id="s_logout" href="" style="">로그아웃</a>
			</div>
			<div id="p_top_logo">
				<a href="<%=request.getContextPath()%>/AdminMainPage"><img
					src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
					width="80px" alt="logo" id="logo"></a>
			</div>
			<div style="float: right; margin-top: 10px;">
				<div style="text-align: center;">
					<img
						src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
						alt="프사" width="60px">
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</header>
	<div class="container">
		<form action="" id="frm" method="post">
		<div class="row"
			style="width: 1200px; margin: 0 auto; padding-top: 30px; display: block;">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">업체 신청내역 상세보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adBuAccept }" var="i">
						<tr>
							<th class="table-primary s_ac_th">사업자 번호</th>
							<td class="table-light" id="s_url_no">${i.buNo }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">사업자 아이디</th>
							<td class="table-light">${i.buId }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">사업자 이름</th>
							<td class="table-light">${i.buName }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">업종</th>
							<td class="table-light">${i.cpCategory }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">사업자 등록 번호</th>
							<td class="table-light">${i.buNumber }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">업체명</th>
							<td class="table-light">${i.cpName }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th"
								style="height: 100px; line-height: 100px;">업체 상세설명</th>
							<td class="table-light" style="line-height: 100px;">${i.cpExplain }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">사업자 전화번호</th>
							<td class="table-light">${i.buTel }</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">주소</th>
							<td class="table-light">(${i.cpPostcode }) ${i.cpAddress }
								${i.cpDtaddress }</td>
						</tr>
						<input type="hidden" name="buNo" value="${i.buNo }"/>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="width: 1200px; margin: 0 auto;">
			<input type="button" id="s_no_btn"
				class="btn btn-danger pull-right s_ad_ac_btn" data-bs-toggle="modal" data-bs-target="#exampleModal" value="거절"> 
				<input type="button" id="s_result_ok_btn"
				class="btn btn-primary pull-right s_ad_ac_btn" value="승인"> 
				<input type="button" id="back_btn"
				class="btn btn-secondary pull-right s_ad_ac_btn" value="뒤로가기">
		</div>
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">승인 거절</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<input type="text" id="s_result_input" name="rejectMsg"
								placeholder="거절 사유를 입력하세요." required="required" class="form-control">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" id="s_result_send_btn"
								class="btn btn-primary">보내기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#back_btn").click(function() {
			history.back();
		});

		$("#s_result_ok_btn").click(function() {
			if (confirm("정말 승인하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminBuAcceptResult");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		});
		
		$("#s_result_send_btn").click(function() {
			console.log("거절사유 : " + $("#s_result_input").val());
			alert("정상 처리되었습니다.");
			$("#exampleModal").click();
			var frmEl = $("#frm");
			frmEl.attr("action", "AdminBuAcceptResult");
			frmEl.attr("method", "post");
			frmEl.submit();
		});

		/* $("#s_delete_btn").click(function() {
			if (confirm("정말 거절하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminNoticeDeleteDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		}) */
	</script>
</html>