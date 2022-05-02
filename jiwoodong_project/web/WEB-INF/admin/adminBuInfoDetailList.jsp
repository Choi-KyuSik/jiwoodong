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
<title>사업자 정보 상세보기</title>
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
		<div class="row"
			style="width: 1200px; margin: 0 auto; padding-top: 30px;">
			<form id="frm" method="post" action="">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">사업자 정보 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">사업자 번호</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buNo" maxlength="300" readonly="readonly"
								value="${buMemberDetail.buNo}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">아이디</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buId" maxlength="300" readonly="readonly"
								value="${buMemberDetail.buId}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">이름</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buName" maxlength="300"
								value="${buMemberDetail.buName}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">생년월일</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buBirth" maxlength="300"
								required="required" value="${buMemberDetail.buBirth}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">전화번호</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buTel" maxlength="300"
								required="required" value="${buMemberDetail.buTel}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">이메일</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="buEmail" maxlength="300"
								required="required" value="${buMemberDetail.buEmail}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">가입일</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="toCharbuWriteDate" maxlength="300" readonly="readonly"
								required="required" value="${buMemberDetail.toCharbuWriteDate}" /></td>
					</tbody>
				</table>
				<input type="button" id="s_delete_btn"
					class="btn btn-danger pull-right s_ad_nt_btn" value="탈퇴하기"> <input
					type="button" id="s_update_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기"> <input
					type="button" id="back_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="뒤로가기">
			</form>
		</div>
	</div>
	<script>
		$("#back_btn").click(function() {
			history.back();
		});

		$("#s_update_btn").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminBuInfoUpdateDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		});

		$("#s_delete_btn").click(function() {
			if (confirm("정말 탈퇴하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminBuInfoDeleteDo");
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
</body>
</html>