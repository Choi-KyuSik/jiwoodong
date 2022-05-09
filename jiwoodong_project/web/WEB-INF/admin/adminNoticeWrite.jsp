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
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
</head>
<body>

	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>

	<div class="container">
		<div class="row" style="width: 1200px; margin: 0 auto; padding-top: 30px;">
			<form method="post" action="AdminNoticeWriteDo">
				<table class="table">
					<thead>
						<tr>
							<th colspan="3">공지사항 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="100%;"><input type="text" class="form-control" placeholder="글 제목" name="ntTitle" maxlength="300" required="required"></td>
						</tr>
						<tr>	
							<td><textarea class="form-control" placeholder="글 내용" name="ntContent" maxlength="4000" style="height: 350px; resize: none;" required="required"></textarea></td>
						</tr>
						<tr>
								<td class="table-light" id="s_us_no"><input type="hidden"
									role="uploadcare-uploader"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" />
					<!-- hidden input에 주소 url을 value로 받을거여서 같이 만듬 세트로 놔두면 편할 듯, 위에거가 파일등록 버튼 -->
									<input type="hidden" name="fileUrl" id="fileUrl">
									</td>
								<td colspan="2" class="table-light"><span style="display: none;"></span></td>
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
	
	<script>
		/* 이미지등록 */
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	
		singleWidget.onUploadComplete(function(info) {
			$("#fileUrl").val(info.cdnUrl);
		});
	</script>
	
	<!-- 메뉴버튼 눌렀을 때 이동할 페이지 -->
	<script>
		$("#s_notice_menu").click(function() {
			location.href = "AdminNoticeList";
		});

		$("#s_bu_accept_menu").click(function() {
			location.href = "AdminBuAcceptList";
		});

		$("#s_bu_accept_result_approval_menu").click(function() {
			location.href = "AdminBuAcceptApprovalList";
		});

		$("#s_bu_accept_result_reject_menu").click(function() {
			location.href = "AdminBuAcceptRejectList";
		});

		$("#s_bu_info_menu").click(function() {
			location.href = "AdminBuInfoList";
		});

		$("#s_bu_delete_menu").click(function() {
			location.href = "AdminBuInfoDeleteList";
		});

		$("#s_us_info_menu").click(function() {
			location.href = "AdminUsInfoList";
		});

		$("#s_us_delete_menu").click(function() {
			location.href = "AdminUsInfoDeleteList";
		});

	    	$("#s_review_menu").click(function() {
	    		location.href="AdminReviewList";
	    	});
	</script>
	
</body>
</html>