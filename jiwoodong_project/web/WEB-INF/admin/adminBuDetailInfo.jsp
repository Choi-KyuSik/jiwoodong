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
	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	<div class="container">
		<form action="" id="frm" method="post">
		<div class="row"
			style="width: 1200px; margin: 0 auto; padding-top: 30px; display: block;">
			<table class="table">
					<c:forEach items="${adBuAccept }" var="i">
				<thead>
					<tr>
						<th colspan="2">업체 신청내역 상세보기</th>
					</tr>
				</thead>
				<tbody>
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
						<c:if test="${empty i.fileUrl }">
							<tr>
							<th class="table-primary s_ac_th">업체사진</th>
							<td class="table-light">
								<img width="300px;" style="border-radius: 15px;" src="https://media.discordapp.net/attachments/965916528350478386/971797973627437076/-removebg-preview_1.png">
							</td>
							</tr>
						</c:if>
						<c:if test="${not empty i.fileUrl }">
							<tr>
								<th class="table-primary s_ac_th">업체사진</th>
								<td class="table-light">
									<img width="300px;" height="200px;" style="border-radius: 15px;" src="${i.fileUrl }">
									<c:if test="${not empty i.fileUrl2 }">
											<img width="300px;" height="200px;" style="border-radius: 15px;" src="${i.fileUrl2 }">
										<c:if test="${not empty i.fileUrl3 }">
											<img width="300px;" height="200px;" style="border-radius: 15px;" src="${i.fileUrl3 }">
										</c:if>
									</c:if>
								</td>
							</tr>
						</c:if>
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
						<input type="hidden" name="cpNo" value="${i.cpNo }"/>
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
			$("#exampleModal").click();
			var frmEl = $("#frm");
			frmEl.attr("action", "AdminBuAcceptResult");
			frmEl.attr("method", "post");
			frmEl.submit();
		});
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
    
        <!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    	$("#s_logout").click(function() {
    		Kakao.init('f276b6cc77a90e02edac0cb9b783cc3f'); //발급받은 키 중 javascript키를 사용해준다.
    		if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response);
						alert("로그아웃 성공");
						location.href="AdminLogin";
					},
					fail : function(error) {
						console.log(error);
						alert("로그아웃 실패");
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
    	});
    </script>
</html>