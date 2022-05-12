<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>사업자 정보 수정</title>

<style>
/* header */
header {
	margin-top: 10px;
}

#p_main_top {
	width: 1200px;
	margin: 0 auto;
	border-bottom: 2px solid silver;
}

#p_top_logo {
	float: left;
	margin-left: 30px;
}

#p_top_menu {
	float: left;
	margin: 15px 0 0 10px;
}

#p_top_profile {
	float: left;
}

.navbar-nav {
	margin-left: 30px;
	padding-bottom: 20px;
}

.dropdown-toggle, .dropdown {
	font-weight: bold;
}

#dropdownUser1 {
	padding-right: 10px;
}

.c_info_title {
	font-size: x-large;
	font-weight: 600;
	color: #0D6EFD;
	margin: 0;
}

.c_main_box {
	width: 1200px;
	height: 1000px;
	margin: 0 auto;
	margin-top: 20px;
}

.c_outline {
	background-color: rgba(241, 241, 241);
	width: 1200px;
	margin: 10px 0;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	border-radius: 15px;
}

#c_inner_info {
	text-align: center;
	width: 550px;
	height: 500px;
	background-color: white;
	border-radius: 30px;
	margin: 40px 10px;
	padding: 20px 30px;
}

#c_inner_info_l {
	text-align: center;
	width: 1120px;
	height: 500px;
	background-color: white;
	border-radius: 30px;
	margin: 10px;
	padding: 20px 30px;
	margin: 10px 10px;
}

.c_company-slider {
	width: 1050px;
	margin: 0px auto;
	position: relative;
	padding-top: 30px;
}

.c_company-slider .c_next {
	position: absolute;
	top: 40%;
	right: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.c_company-slider .c_prev {
	position: absolute;
	top: 40%;
	left: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.c_company-slider .c_company-wrapper {
	width: 84%;
	height: 400px;
	margin: 0px auto;
	overflow: hidden;
	/* padding: 10px 0px 10px 0px; */
	display: flex;
	align-items: center;
}

.c_company-slider .c_company-wrapper .c_company {
	width: 300px;
	margin: 0px 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.c_company-slider .c_company-wrapper .c_company .c_company-info {
	font-size: 13px;
	height: 30%;
	padding-left: 10px;
}

.c_company-slider .c_company-wrapper .c_company .c_slider-image {
	width: 100%;
	height: 270px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

content>article>div, #c_notice_info {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
}

/* 컨텐트 */
content>article>div, #c_notice_info {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
	border-radius: 15px;
}

/* 컨텐트 안 제목 */
article>div>p {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
	font-size: large;
}

/* section 공용 */
#main_box {
	width: 1200px;
	margin: 15px auto 0;
}

.box_font {
	margin-top: 10px;
	font-weight: bold;
}

.c_company_info {
	background-color: white;
	width: 900px;
	margin: 10px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	border-radius: 15px;	
}
/* 내 정보 수정 : 손은진 */
.s_us_th {
    text-align: center;
    vertical-align: middle;
    width: 250px;
}

.s_row {
	width: 1200px;
    margin: 0 auto;
    padding-top: 30px;
    margin-top: 30px;
}

#s_us_info_btn {
	text-align: center;
	margin-top: 30px;
}

.border_none {
	border: 0;
}

#s_us_notice {
	vertical-align: middle;
	color: red;
}

#s_bu_pwd {
	width: 500px;
}

#s_id_style {
	display: inline-block;
    color: #0d6efd;
    font-weight: bold;
}

#s_us_push_right_btn {
	display: inline-block;
    color: gray;
    font-size: .8em;
}

</style>

</head>

	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="BumMainPage" id="k_logo"><img
					src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
					width="80px" alt="logo"></a>
			</div>
			<div id="p_top_menu">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									 id="k_info_menu" role="button"> 내정보 관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_review_menu" href="#" role="button"> 리뷰관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									href="bucompany" id="k_bu_eroll_menu" href="#" role="button">
										업체등록 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 예약관리 </a>
									<ul class="dropdown-menu dropdown-menu">
										<li><a class="dropdown-item" id="k_re_menu_enroll"
											href="#">예약메뉴등록</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" id="k_re_cu_menu" href="#">예약
												조회/수정</a></li>
									</ul></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_us_info_menu" href="#" role="button"> 회원정보조회 </a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<div style="float: right; margin: 0 30px 0 0;">
				<div class="dropdown text-end" id="p_top_profile">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown"> <img
						src="https://media.discordapp.net/attachments/958566133752016901/973649744310202458/e3362c1706dbf481.png?width=676&height=676"
						alt="mdo" width="60px">
					</a>
					<p style="font-size: 12px; margin: 5px;">환영합니다
						<%= session.getAttribute("buName") %>님</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" id="k_pwdinfo" href="#">비밀번호 재설정</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</header>

<body>
	<article>
        <div class="s_row">
      		<div id="c_us_info_edit_info">
			<form id="frm" method="post" action="">
				<table class="table table-striped">	
					<thead>
							<tr>
								<th colspan="4" style="font-size: 2em;">내정보 관리</th>
							</tr>
					</thead>				
					<tbody>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none; background-color: var(--bs-table-bg);">사업자 번호</th>
							<td colspan="3" class="table-light" id="s_us_no">
							<input type="text" class="form-control border_none" name="buNumber" readonly="readonly"
								value="${bvo.buNumber}" /></td>
						</tr>					
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none; background-color: var(--bs-table-bg);">아이디</th>
							<td class="table-light" id="s_url_no" style="background-color : #ecedee">
							<input type="text" class="form-control border_none" name="buId" readonly="readonly" style="background-color : #ecedee"
								value="${bvo.buId}" /></td><td colspan="2" class="table-light" style="background-color : #ecedee" id="s_us_notice_1"></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">변경할 비밀번호</th>
							<td class="table-light" id="s_bu_pwd" style="background-color : #f8f9fa">
							<input type="password" class="form-control" name="buPwd_1" id="buPwd_1"
								value="" placeholder="변경할 비밀번호를 입력해주세요."/></td>
							<td colspan="2" class="table-light" id="s_us_notice_1" style="background-color : #f8f9fa">
							<span id="s_bu_pwd_check_1" style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">비밀번호 확인</th>
							<td class="table-light" id="s_bu_pwd_check" style="background-color : #ecedee">
							<input type="password" class="form-control" name="buPwd_2" id="buPwd_2"
								value="" placeholder="비밀번호를 한번 더 입력해주세요."/></td>
							<td colspan="2" class="table-light" id="s_us_notice_2" style="background-color : #ecedee">
							<span id="s_bu_pwd_check_2" style="display: none;">현재 비밀번호가 일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">이름</th>
							<td class="table-light" id="s_us_no">
							<input type="text" class="form-control border_none" name="buName" readonly="readonly"
								value="${bvo.buName}" /></td>
							<td colspan="2" class="table-light"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">생년월일</th>
							<td class="table-light" style="background-color : #ecedee">
							<input type="text" class="form-control border_none" name="buBirth" readonly="readonly" value="${bvo.buBirth}" /></td>
							<td colspan="2" class="table-light" style="background-color : #ecedee"><span style="display: none;"></span></td>
						</tr>						
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">이메일</th>
							<td class="table-light" style="background-color : #f8f9fa">
							<input type="text" id= "k_email" placeholder="Email@example.com" class="form-control" name="buEmail" value="${bvo.buEmail}" /></td>
							<td colspan="2" class="table-light" style="background-color : #f8f9fa"><span style="display: none;"></span></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">핸드폰 번호</th>
							<td class="table-light" style="background-color : #ecedee">
							<input type="text" class="form-control" name="buTel" placeholder="-없이 입력" id="k_tel" value="${bvo.buTel}" /></td>
							<td colspan="2" class="table-light" style="background-color : #ecedee"><span style="display: none;" ></span></td>
						</tr>					
					</tbody>
				</table>
				<div id="s_us_info_btn">
				<input type="button" id="back_btn" class="btn btn-danger pull-right s_ad_nt_btn" value="취소하기">
				<input type="button" id="s_bu_check_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기">
				</div>
				<hr>
				<div style="text-align: right;">
				<div id="s_us_push_right_btn">회원탈퇴를 원하시면 오른쪽 버튼을 눌러주세요.</div>
				<input type="button" style="font-size: .8em;" id="s_bu_delete_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="회원탈퇴">
				</div>
			</form>
		</div>
      </div>
    </article>


	<script>
	
	//[수정하기] 버튼 클릭시 비밀번호/이메일/휴대폰 번호 유효성검사
    $("#s_bu_check_btn").click(function() {
    	
   	
		var password = $("#buPwd_1").val().trim();
		var email = $("#k_email").val().trim();
		var phone = $("#k_tel").val().trim();
    	
    	/* var regExpPassword =/^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/; */  
    	var regExpPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/; // 영문자, 숫자가 적어도 1개이상, 8~16글자
    	var regEmail = /^[a-z0-9.-_]+@([a-z0-9-]+.)+[a-z]{2,6}.[a-zA-Z]{3}$/i; // 이메일 양식
    	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰 번호
    	
		if(!password || password != $("#buPwd_2").val().trim()){
			alert("패스워드 입력란과 확인란이 같지 않습니다.");
			$("#buPwd_1").val("");
			$("#buPwd_2").val("");
			$("#buPwd_1").focus();
			return false;
			
		}else if(!regExpPassword.test(password)){
			alert("패스워드는 영문자, 숫자가 적어도 1개이상, 8~16글자여야 합니다.");
			$("#buPwd_1").focus();
			return false;
			console.log(buPwd_1);
		}else if(!regEmail.test(email)){
			alert("Email@example.com 형식으로 작성 해주시길 바랍니다.");
			$("#k_email").focus();
			return false;
			
		}else if(!regPhone.test(phone)){
			alert("휴대폰 번호 양식(01#-####-####)에 맞게 입력해주시기 바랍니다.");
			$("#k_tel").focus();
			return false;	
			
		}else{
			if (confirm("입력하신 정보로 수정하시겠습니까?") == true) {
				var frmEl = $("#frm");
				frmEl.attr("action", "bucpupdate");
				frmEl.attr("method", "post");
				frmEl.submit();
			} else {
				return;
			}			
		}
	   	
    });
       
	$("#buPwd_2").keyup(function() {

		var firstPwd = $("#buPwd_1").val();
		var secondPwd = $("#buPwd_2").val();

		// console.log("firstPwd : " + firstPwd);
		// console.log("secondPwd : " + secondPwd);

			if(firstPwd == "" || secondPwd == "") {
				console.log("빈문자열");
				$("#s_bu_pwd_check_2").css('display', 'inline-block');
				$("#s_bu_pwd_check_2").text('');H
			} else if (firstPwd != secondPwd) {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치하지 않습니다.");
				$("#s_bu_pwd_check_2").css('display', 'inline-block');
				$("#s_bu_pwd_check_2").text('비밀번호가 일치하지 않습니다.');
				$("#s_bu_pwd_check_2").css('color', 'red');
			} else {
				console.log("firstPwd : " + firstPwd);
				console.log("secondPwd : " + secondPwd);
				console.log("비밀번호가 일치합니다.");
				$("#s_bu_pwd_check_2").css('display', 'inline-block');
				$("#s_bu_pwd_check_2").text('비밀번호가 일치합니다.');
				$("#s_bu_pwd_check_2").css('color', 'green');
			}			
	});
	
	
	 	//취소하기
  	$("#back_btn").click(function() {
  		var result = confirm('메인페이지로 이동하시겠습니까?'); 
    	if(result) { 
    		//yes 
    		location.href="BumMainPage";
    		} else { 
    		//no 
    		}            
    });
	 	
	 	
      
    	/* 탈퇴하기 */
    $("#s_bu_delete_btn").click(function() {  	
			location.href="bucpdelete";
    });
     	
  	/* 전화번호 하이픈 정규식 DOM  */	
	$("#k_tel").on(
			"input",
			function() {
				var target = document.getElementById("k_tel");
				target.value = target.value.replace(/[^0-9]/g, '').replace(
						/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
						.replace(/(\-{1,2})$/g, "");

			});
	
		/* 내정보 관리 이동 */
	    $("#k_info_menu").click(function() {
	       var frm = $("#frm");
	       frm.attr("action", "buminfocheck");
	       frm.attr("method", "post");
	       frm.submit();
	    });
		
	  	/* 업체등록 */
			$("#k_bu_eroll_menu").click(function() {			
				location.href="bucompany";
			});
		
		/* 예약관리 - 예약 조회/수정 */
		$("#k_re_cu_menu").click(function() {
			location.href = "<%=request.getContextPath()%>/burscheck";
		});
		
		/* 예약관리 - 예약 메뉴 등록 */
		$("#k_re_menu_enroll").click(function() {
			location.href = "<%=request.getContextPath()%>/burmenu";
		});
		
		/* 토글 - 비밀번호 변경 */
	  	$("#k_pwdinfo").click(function() {
	    	var frm = $("#frm");
				frm.attr("action", "buminfocheck");
				frm.attr("method", "post");
				frm.submit();
		});
	</script>
	
	
  </script>

	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>