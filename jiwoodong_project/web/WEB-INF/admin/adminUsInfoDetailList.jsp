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
<!-- 주소 daum우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<th colspan="2">사용자 정보 상세보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">아이디</th>
							<td class="table-light" id="s_url_no">
							<input type="text" class="form-control" style="border: none;" name="umId" maxlength="300" readonly="readonly"
								value="${usMemberDetail.umId}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">이름</th>
							<td class="table-light tb_bg_color" id="s_url_no"><input type="text" class="form-control"
								name="umName" maxlength="300" required="required" style="border: none; background-color: #e9ecef;"
								value="${usMemberDetail.umName}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">생년월일</th>
							<td class="table-light" id="s_url_no"><input type="text" class="form-control"
								name="umBirth" maxlength="300" required="required" style="border: none; background-color: #e9ecef;"
								required="required" value="${usMemberDetail.umBirth}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">전화번호</th>
							<td class="table-light tb_bg_color" id="s_url_no"><input type="text" class="form-control"
								name="umTel" maxlength="300" id="umTel" placeholder="010-0000-0000"
								required="required" value="${usMemberDetail.umTel}" style="width: 500px;display: inline-block;" />
								<span id="s_check_tel" style="display: none; font-size: .8em; padding-left: 10px; color: red;">유효성 검사 뜰 자리</span>
								</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">이메일</th>
							<td class="table-light tb_bg_color" id="s_url_no"><input type="text" class="form-control"
								name="umEmail" maxlength="300" id="umEmail" placeholder="email@example.com"
								required="required" value="${usMemberDetail.umEmail}" style="width: 500px;display: inline-block;" />
								<span id="s_check_email" style="display:none; font-size: .8em; padding-left: 10px; color: red;">유효성 검사 뜰 자리</span>
								</td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th">주소</th>
							<td class="table-light tb_bg_color" id="s_url_no">
								<div style="margin-bottom: 5px;">
									<!-- 우편번호 -->
									<input type="text" class="form-control" style="width: 100px; display: inline-block;" name="umPostcode" id="postcode" required="required" value="${usMemberDetail.umPostcode}" /> 
									<!-- 주소찾기 -->
									<input type="button" class="btn btn-primary s_ad_nt_btn" id="postcode_btn" style="position: absolute; margin-left: 10px;" value="주소 찾기">
								</div>
								<!-- 주소 --> 
								<input type="text" class="form-control" id="roadAddress" style="width: 473px; display: inline-block; margin-right: 5px;"
								name="umAddress" required="required" value="${usMemberDetail.umAddress}" /> 
								<!-- 상세주소 -->
								<input type="text" id="jibunAddress" class="form-control" style="width: 475px; display: inline-block;"
								name="umDetailAddress" required="required" value="${usMemberDetail.umDetailAddress}" /></td>
						</tr>
						<tr>
							<th class="table-primary s_ac_th" style="--bs-table-accent-bg: none;">가입일</th>
							<td class="table-light" id="s_url_no">
							<input type="text" class="form-control" name="toCharUmWriteDate" readonly="readonly" style="border: none;"
								required="required" value="${usMemberDetail.toCharUmWriteDate}" /></td>
					</tbody>
				</table>
				<input type="button" id="s_delete_btn" class="btn btn-danger pull-right s_ad_nt_btn" value="탈퇴하기"> 
					<input type="button" id="s_update_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기"> 
					<input type="button" id="back_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="뒤로가기">
			</form>
		</div>
	</div>
	
	<!-- 유효성 검사 -->
	<script>
	// 전화번호 유효성 검사
	$("#umTel").keyup(function(){
		
		console.log("눌리나요?");
		
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰 번호
		var phone = $("#umTel").val().trim();
		if(phone == "") {
	    	console.log("빈문자열");
	    	$("#s_check_tel").css('display', 'inline-block');
	    	$("#s_check_tel").text('');
	    	
		} else if(!regPhone.test(phone)){
			 console.log("유효성체크 하나요?");
	            // alert("휴대폰 번호 양식(01#-####-####)에 맞게 입력해주시길 바랍니다.");
	            $("#s_check_tel").css('display', 'inline-block');
	            $("#s_check_tel").text('휴대폰 번호 양식(01#-####-####)에 맞게 입력해주시길 바랍니다.');
	            $("#s_check_tel").css('font-size', '0.8em');
	            $("#s_check_tel").css('color', 'red');
	            
	            // $("#k_tel").focus();
	            // return false;
	     } else {
	    	 $("#s_check_tel").css('display', 'inline-block');
	         $("#s_check_tel").text('✅');
	         $("#s_check_tel").css('font-size', '1.2em');
	         $("#s_check_tel").css('color', 'green');
	     }
	
	});
	
    
	$("#umTel").on(
			"input",
			function() {
				var target = document.getElementById("umTel");
				target.value = target.value.replace(/[^0-9]/g, '').replace(
						/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
						.replace(/(-{1,2})$/g, "");
			});
	
	// 이메일 유효성 검사
	$("#umEmail").keyup(function(){
		
		console.log("눌리나요?");
		
		// var regEmail = /^[0-9a-zA-Z]([-.]?[0-9a-zA-Z])@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]).[a-zA-Z]{2,3}$/i; //이메일 양식
		var regEmail = /^[a-z0-9.-_]+@([a-z0-9-]+.)+[a-z]{2,6}.[a-zA-Z]{3}$/i; // 이메일 양식
		var email = $("#umEmail").val().trim();
		if(email == "") {
	    	console.log("빈문자열");
	    	$("#s_check_email").css('display', 'inline-block');
	    	$("#s_check_email").text('');
	    	
		} else if(!regEmail.test(email)){
			 console.log("유효성체크 하나요?");
	            $("#s_check_email").css('display', 'inline-block');
	            $("#s_check_email").text('email@example.com 형태로 작성 해주시길 바랍니다.');
	            $("#s_check_email").css('font-size', '0.8em');
	            $("#s_check_email").css('color', 'red');
	     } else {
	    	 $("#s_check_email").css('display', 'inline-block');
	         $("#s_check_email").text('✅');
	         $("#s_check_email").css('font-size', '1.2em');
	         $("#s_check_email").css('color', 'green');
	     }
	
	});
	</script>
	
	<script>
		// 뒤로 가기
		$("#back_btn").click(function() {
			history.back();
		});

		// 수정하기 버튼 눌렀을 때
		$("#s_update_btn").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				
				if($.trim($("#umTel").val()) == '') {
					console.log("비어이따");
					alert("전화번호를 입력해주세요.");
					$("#umTel").val('');
					$("#umTel").focus();
					return;
				}
				
				if($.trim($("#umEmail").val()) == '') {
					console.log("비어이따2222");
					alert("이메일을 입력해주세요.");
					$("#umEmail").val('');
					$("#umEmail").focus();
					return;
				}
				
				if($.trim($("#jibunAddress").val()) == '') {
					console.log("비어이따3333");
					alert("상세 주소를 입력해주세요.");
					$("#jibunAddress").val('');
					$("#jibunAddress").focus();
					return;
				}
				
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminUmInfoUpdateDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		});

		// 탈퇴 버튼 눌렀을 때
		$("#s_delete_btn").click(function() {
			if (confirm("정말 탈퇴하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "AdminUmInfoDeleteDo");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				history.back();
			}
		})
	</script>
	
	<script>
	//주소찾기
	$("#postcode_btn").click(function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g
								.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("roadAddress").value = roadAddr;
				/* document.getElementById("jibunAddress").value = data.jibunAddress; */

				var guideTextBox = $("#guide");
				// document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.html('예상 도로명 주소 : ' + expRoadAddr);
					guideTextBox.css('display', 'block');

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.html('예상 지번 주소 : ' + expJibunAddr);
					guideTextBox.css('display', 'block');
				} else {
					console.log(guideTextBox);
					guideTextBox.html('');
					guideTextBox.css('display', 'none');
				}
			}
		}).open();
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