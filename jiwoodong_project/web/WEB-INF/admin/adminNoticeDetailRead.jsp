<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
</head>
<body>
	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	<div class="container">
		<div class="row"
			style="width: 1200px; margin: 0 auto; padding-top: 30px;">
			<form id="frm" method="post" action="AdminNoticeUpdateDo">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">공지사항 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden" class="form-control"
								placeholder="글 번호" name="ntNo" maxlength="300"
								required="required" value="${adnvoList.ntNo}" /></td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="text" class="form-control"
								placeholder="글 제목" name="ntTitle" maxlength="300" id="ntTitle"
								required="required" value="${adnvoList.ntTitle}" /></td>
						</tr>
							<c:if test="${empty adnvoList.flGno}">
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="ntContent" maxlength="4000" id="ntContent"
									style="height: 350px; resize: none;" required="required">${adnvoList.ntContent}</textarea></td>
						</tr>
							</c:if>
							<c:if test="${not empty adnvoList.flGno}">
						<tr>
							<td>
							<img style="border-radius: 5px; float: right; width: 350px; height: 350px; border: 1px solid #ced4da;" src="${adnvoList.flGno }">
							<textarea class="form-control ntContent" placeholder="글 내용"
									name="ntContent" maxlength="4000"
									style="height: 350px; resize: none; float: left; width: 800px;" required="required">${adnvoList.ntContent}</textarea></td>
						</tr>
							</c:if>
						<tr>
								<td class="table-light" id="s_us_no"><input type="hidden"
									role="uploadcare-uploader"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" />
					<!-- hidden input에 주소 url을 value로 받을거여서 같이 만듬 세트로 놔두면 편할 듯, 위에거가 파일등록 버튼 -->
									<input type="hidden" name="fileUrl" id="fileUrl">
									</td>
								<!-- <td colspan="2" class="table-light"><span style="display: none;"></span></td> -->
							</tr>
					</tbody>
				</table>
				<input type="button" id="s_delete_btn"
					class="btn btn-danger pull-right s_ad_nt_btn" value="삭제하기"> <input
					type="button" id="s_update_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기"> <input
					type="button" id="back_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="뒤로가기">
			</form>
		</div>
	</div>
	
	<script>
		/* 이미지등록 */
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	
		singleWidget.onUploadComplete(function(info) {
			$("#fileUrl").val(info.cdnUrl);
		});
	</script>
	
	<script>
		$("#back_btn").click(function() {
			history.back();
		});

		$("#s_update_btn").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				if($.trim($("#ntTitle").val()) == '') {
					console.log("비어이따");
					alert("제목을 입력해주세요.");
					$("#ntTitle").val('');
					$("#ntTitle").focus();
					return;
				}
				
				if($.trim($("#ntContent").val()) == '') {
					console.log("비어이따222");
					alert("내용을 입력해주세요.");
					$('.ntContent').val('');
					$('.ntContent').focus();
					return;
				}
				
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminNoticeUpdateDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		});

		$("#s_delete_btn").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminNoticeDeleteDo");
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