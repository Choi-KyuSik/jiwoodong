<%@page import="kh.semi.jwd.bum.model.service.BumService"%>
<%@page import="kh.semi.jwd.bum.model.dao.BumDao"%>
<%@page import="kh.semi.jwd.bum.model.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>

/* function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;       // 이름(name)이 "writeFrm"인 폼 선택
        form.method = "post";               // 전송 방식 
        form.action = "DeleteProcess.jsp";  // 전송 경로
        form.submit();                      // 폼값 전송
    }
} */
</script>	
</head>
<body>
	<div class="container">
		<div class="row"
			style="width: 1200px; margin: 0 auto; padding-top: 30px;">
			<form id="frm" method="post" action="AdminNoticeUpdateDo">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">리뷰 상세보기</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${userrvlist}" var="i">
						<tr>
							<td><input type="hidden" class="form-control"
								placeholder="글 번호" name="rvNo" maxlength="300"
								required="required" value="${i.rvNo}" /></td>
						</tr>
						<tr>
							<td style="width: 100%;"><input type="text" class="form-control"
								placeholder="별점" name="rvScore" maxlength="300"
								required="required" value="${i.rvScore}" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="rvContent" maxlength="4000"
									style="height: 350px; resize: none;" required="required">${i.rvContent}</textarea></td>
						</tr>
				
							</c:forEach>
					</tbody>
				</table>
				<input type="button" id="s_delete_btn"
					class="btn btn-danger pull-right s_ad_nt_btn" value="삭제하기"> <input
					type="button" id="s_update_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기"> <input
					type="button" id="back_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="뒤로가기">
			</form>
		</div>
	</div>

</body>
</html>