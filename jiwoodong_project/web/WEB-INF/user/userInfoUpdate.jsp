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
<title>사용자 정보 수정</title>
</head>
<body>
	<div>
		<%@ include file="../view/user/user_header.jsp" %>
	</div>
	<article>
        <div class="s_row">
      		<div id="c_us_info_edit_info">
			<form id="frm" method="post" action="">
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 2em;">회원정보수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none; background-color: var(--bs-table-bg);">아이디</th>
							<td colspan="3" class="table-light tb_bg_color" id="s_us_no">
							<input type="text" class="form-control border_none" name="umId" readonly="readonly"
								value="${usMemberListInfo.umId }" /></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">변경할 비밀번호</th>
							<td class="table-light tb_bg_color" id="s_us_pwd">
							<input type="password" class="form-control" name="umPwd_1" id="umPwd_1"
								value="" placeholder="변경할 비밀번호를 입력해주세요."/></td>
							<td colspan="2" class="table-light tb_bg_color" id="s_us_notice_1">
							<span id="s_us_pwd_check_1" style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">비밀번호 확인</th>
							<td class="table-light tb_bg_color" id="s_us_pwd_check">
							<input type="password" class="form-control" name="umPwd_2" id="umPwd_2"
								value="" placeholder="비밀번호를 한번 더 입력해주세요."/></td>
							<td colspan="2" class="table-light tb_bg_color" id="s_us_notice_2">
							<span id="s_us_pwd_check_2" style="display: none;">현재 비밀번호가 일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">이름</th>
							<td class="table-light tb_bg_color" id="s_us_no">
							<input type="text" class="form-control" name="umName"
								value="${usMemberListInfo.umId }" /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">생년월일</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umBirth" value="${usMemberListInfo.umBirth }" /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">전화번호</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umTel" value="${usMemberListInfo.umTel }" /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">이메일</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umEmail" value="${usMemberListInfo.umEmail }" /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">주소</th>
								<td class="table-light tb_bg_color" colspan="3">
								<input type="text" class="form-control"
									style="width: 200px; display: inline-block;" name="umPostcode" value="${usMemberListInfo.umPostode }" /> 
									<input type="text" class="form-control"
									style="width: 300px; display: inline-block; margin-left: 10px;"
									name="umAddress" value="${usMemberListInfo.umAddress }" /> 
									<input type="text" class="form-control"
									style="display: inline-block; width: 400px; margin-left: 10px;"
									name="umDetailAddress" value="${usMemberListInfo.umDetailAddress }" /></td>
							</tr>
					</tbody>
				</table>
				<div id="s_us_info_btn">
				<input type="button" id="back_btn" class="btn btn-danger pull-right s_ad_nt_btn" value="취소하기">
				<input type="button" id="s_us_check_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기">
				</div>
				<hr>
				<div style="text-align: right;">
				<div id="s_us_push_right_btn">회원탈퇴를 원하시면 오른쪽 버튼을 눌러주세요.</div>
				<input type="button" style="font-size: .8em;" id="s_us_delete_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="회원탈퇴">
				</div>
			</form>
		</div>
      </div>
    </article>

	<script>
	$("#umPwd_2").keyup(function() {

		var firstPwd = $("#umPwd_1").val();
		var secondPwd = $("#umPwd_2").val();

		// console.log("firstPwd : " + firstPwd);
		// console.log("secondPwd : " + secondPwd);

			if(firstPwd == "" || secondPwd == "") {
				console.log("빈문자열");
				$("#s_us_pwd_check_2").css('display', 'inline-block');
				$("#s_us_pwd_check_2").text('');
			} else if (firstPwd != secondPwd) {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치하지 않습니다.");
				$("#s_us_pwd_check_2").css('display', 'inline-block');
				$("#s_us_pwd_check_2").text('비밀번호가 일치하지 않습니다.');
				$("#s_us_pwd_check_2").css('color', 'red');
			} else {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치합니다.");
				$("#s_us_pwd_check_2").css('display', 'inline-block');
				$("#s_us_pwd_check_2").text('비밀번호가 일치합니다.');
				$("#s_us_pwd_check_2").css('color', 'green');
			}
	});
	</script>

	<script>
	    $("#back_btn").click(function() {
	  		location.href="UserMypage";
	  	});
	    
	    $("#s_us_delete_btn").click(function() {
	    	location.href="UserInfoDelete";
	    });
	    
	    $("#s_us_check_btn").click(function() {
	    	if($("#umPwd_1").val() == "") {
	    		alert("변경할 비밀번호를 입력해주세요.");
	    		$("#umPwd_1").focus();
	    	} else {
		    	if (confirm("정말 수정하시겠습니까?") == true) {
					var frmEl = $("#frm");
					frmEl.attr("action", "UserUpdateInfoDo");
					frmEl.attr("method", "post");
					frmEl.submit();
				} else {
					location.href="UserMypage";
				}
	    	}
	    });
    </script>
</body>
</html>