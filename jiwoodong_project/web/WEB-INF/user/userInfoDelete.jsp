<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>회원 탈퇴 페이지</title>
</head>
<body>
	
	<div>
		<%@ include file="../view/user/user_header.jsp" %>
	</div>
	
	<article>
        <div class="s_row">
      		<div id="c_us_info_edit_info">
			<form id="frm">
				<div class="s_us_delete_tt">탈퇴 안내</div>
				<div class="s_us_delete_ct">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</div>
				<div style="margin: 30px 0;">
					<div style="margin-bottom: 10px;">
						<img class="s_us_delete_img" src="https://media.discordapp.net/attachments/958566133752016903/971034656512303154/check.png">
						<div class="s_us_delete_st">사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</div>
					</div>
					<span id="s_us_delete_ct_span">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span><span id="s_us_delete_ct_span_2">하오니 신중하게 선택하시기 바랍니다.</span>
				</div>
				<div style="margin-bottom: 50px;">
					<img class="s_us_delete_img" src="https://media.discordapp.net/attachments/958566133752016903/971034656512303154/check.png">
					<div class="s_us_delete_st">탈퇴 후 회원님의 정보는 바로 삭제됩니다.</div>
					<div class="s_us_delete_ct" style="padding-left: 35px;">(단, 관계법령 및 내부방침에 의하여 보존하도록 규정된 정보는 그 기간까지만 보관됩니다.)</div>
				</div>
				<hr>
				<div id="s_us_info_btn" style="margin-top: 50px;">
				<input type="button" id="back_btn" class="btn btn-danger pull-right s_ad_nt_btn" value="취소하기">
				<input type="button" id="s_us_delete_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="탈퇴하기">
				</div>
				<input type="hidden" name="umId" value="${usMemberListInfo.umId }">
			</form>
		</div>
      </div>
    </article>
    
    <script>
    	$("#back_btn").click(function() {
    		location.href="UserMypage";
    	});
    	
    	$("#s_us_delete_btn").click(function() {
    		if (confirm("정말 탈퇴하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "UserInfoDeleteDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				location.href="UserMypage";
			}
    	});
    </script>
    
</body>
</html>