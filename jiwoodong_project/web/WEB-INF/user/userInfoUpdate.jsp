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
<!-- 주소 daum우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<td colspan="2" class="table-light tb_bg_color" id="s_us_notice_1" style="vertical-align: middle;">
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
							<input type="text" class="form-control" name="umName" style="border: none;" type="text" readonly="readonly" 
								value="${usMemberListInfo.umId }" /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">생년월일</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umBirth" value="${usMemberListInfo.umBirth }" style="border: none;" type="text" readonly="readonly"  /></td>
							<td colspan="2" class="table-light tb_bg_color"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">전화번호</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umTel" id="umTel" value="${usMemberListInfo.umTel }" style="width: 500px;" placeholder="010-0000-0000"/>
							</td>
							<td style="vertical-align: middle;" colspan="2" class="tb_bg_color"><span id="s_check_tel" style="display: none; font-size: .8em; padding-left: 10px; color: red;">유효성 검사 뜰 자리</span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">이메일</th>
							<td class="table-light tb_bg_color">
							<input type="text" class="form-control" name="umEmail" id="umEmail" value="${usMemberListInfo.umEmail }"  style="width: 500px;" placeholder="email@example.com"/></td>
							<td style="vertical-align: middle; --bs-table-accent-bg: none;" colspan="2" class="tb_bg_color"><span id="s_check_email" style="display: none; font-size: .8em; padding-left: 10px; color: red;">유효성 검사 뜰 자리</span></td>
						</tr>
						<%-- <tr>
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
						</tr> --%>
							
						<tr>
						<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">주소</th>
							<td class="table-light tb_bg_color" colspan="3">
							<div style="margin-bottom: 5px;">
								<!-- 우편번호 -->
								<input type="text" class="form-control"
								 style="width: 100px; display: inline-block;" name="umPostcode" id="postcode"
								 value="${usMemberListInfo.umPostode }" /> 
								<!-- 주소찾기 -->
								<input type="button" class="btn btn-primary s_ad_nt_btn" id="postcode_btn" style="position: absolute; margin-left: 10px;" value="주소 찾기">
							</div>
							<!-- 주소 -->
							<input type="text" class="form-control" id="roadAddress"
							 style="width: 450px; display: inline-block; margin-right: 5px;"
							 name="umAddress" value="${usMemberListInfo.umAddress }" />
							<!-- 상세주소 --> 
							<input type="text" class="form-control" id="jibunAddress"
							 style="width: 470px; display: inline-block;"
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


	<!-- 유효성 검사 -->
	<script>
	/* 비밀번호 유효성 검사 */
	
	
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
				console.log("여기눌리니?333333333333");
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
	
	$("#umPwd_1").keyup(function() {
		var password = $("#umPwd_1").val().trim();
		// var regExpPassword =/^(?=.[A-Za-z])(?=.[0-9]).{8,16}$/;  // 영문자, 숫자가 적어도 1개이상, 8~16글자
		var regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
		
		if(password == "") {
			console.log("빈문자열");
			$("#s_us_pwd_check_1").css('display', 'inline-block');
			$("#s_us_pwd_check_1").text('');
		} else if(!regExpPassword.test(password)){
			console.log("여기눌리니?22222222222");
			$("#s_us_pwd_check_1").css('display', 'inline-block');
			$("#s_us_pwd_check_1").text('패스워드는 영문자, 숫자가 적어도 1개이상, 8~16글자여야 합니다.');
			$("#s_us_pwd_check_1").css('font-size', '0.8em');
			$("#s_us_pwd_check_1").css('color', 'red');
		} else if(regExpPassword.test(password)) {
			console.log("else 탔아???");
			$("#s_us_pwd_check_1").css('display', 'inline-block');
	        $("#s_us_pwd_check_1").text('✅');
	        $("#s_us_pwd_check_1").css('font-size', '1.2em');
	        $("#s_us_pwd_check_1").css('color', 'green');
		}
		
	});
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
	    	 console.log("else 탔아???");
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
		    		
		    		if($.trim($("#umPwd_1").val()) == '') {
						console.log("비어이따");
						alert("변경할 비밀번호를 입력해주세요.");
						$("#umPwd_1").val('');
						$("#umPwd_1").focus();
						return;
					}
		    		
		    		if($.trim($("#umPwd_2").val()) == '') {
						console.log("비어이따");
						alert("비밀번호를 한번 더 입력해주세요.");
						$("#umPwd_2").val('');
						$("#umPwd_2").focus();
						return;
					}
		    		
		    		if($.trim($("#umTel").val()) == '') {
						console.log("비어이따");
						alert("전화번호를 입력해주세요.");
						$("#umTel").val('');
						$("#umTel").focus();
						return;
					}
		    		
		    		if($.trim($("#umEmail").val()) == '') {
						console.log("비어이따");
						alert("이메일을 입력해주세요.");
						$("#umEmail").val('');
						$("#umEmail").focus();
						return;
					}
		    		
		    		if($.trim($("#jibunAddress").val()) == '') {
						console.log("비어이따");
						alert("상세주소를 입력해주세요.");
						$("#jibunAddress").val('');
						$("#jibunAddress").focus();
						return;
					}
		    		
					var frmEl = $("#frm");
					frmEl.attr("action", "UserInfoUpdateDo");
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