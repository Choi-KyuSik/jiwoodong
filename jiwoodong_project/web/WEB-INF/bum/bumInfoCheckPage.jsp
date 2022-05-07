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
<title>사업자 메인페이지</title>
<!--header-->
<style>
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
	margin-right: 20px;
}

.dropdown-toggle, .dropdown {
	font-weight: bold;
}

#dropdownUser1 {
	padding-right: 10px;
}
</style>
<!--section공용-->
<style>
#main_box {
	width: 1200px;
	margin: 15px auto 0;
}

#booking, #review {
	text-align: center;
	/* display: flex;
      justify-content: center; */
	/* float: left; */
	width: 550px;
	height: 450px;
	background-color: white;
	border-radius: 30px;
	margin: 30px 15px;
	padding: 15px;
}

#statistics_visit, #statistics_review {
	text-align: center;
	/* display: flex;
      justify-content: center; */
	/* float: left; */
	width: 550px;
	height: 450px;
	background-color: white;
	border-radius: 30px;
	margin: 0 15px 30px;
	overflow: hidden;
}

.box_font {
	margin-top: 10px;
	font-weight: bold;
}

.nav_tab_div {
	background-color: rgba(241, 241, 241);
	width: 1200px;
	margin: 10px 0;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	border-radius: 15px;
}

.statiscics_font {
	font-weight: bold;
	margin-top: 22px;
}

.table {
	font-size: 15px;
	text-align: center;
}
</style>

<!--content-->
<style>
/* 컨텐트 */
content>article>div, .s_row {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
}


/* 컨텐트안 제목 */
article>div>p {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
	font-size: large;
}

/* 검색바 위치*/
.navbar-light {
	float: right;
	margin-bottom: 20px;
}

/* 내정보 관리 */
.k_company {
	font-weight: bold;
}

/* 업체등록 */
#k_bu_eroll_top {
	display: flex;
}

.k_company_info {
	resize: none;
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

#s_us_pwd {
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

.s_row {
	border-radius: 15px;
}
</style>
</head>

	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="<%=request.getContextPath()%>/BumMainPage" id="k_logo"><img
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
									id="k_bu_eroll_menu" href="#" role="button"> 업체등록 </a></li>
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
									id="k_us_info_menu" href="" role="button"> 회원정보 조회 </a></li>
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
						src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
						alt="mdo" width="60px">
					</a>
					<p style="font-size: 12px; width: 115px; margin: 5px;">환영합니다
						${bvo.buName}님</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" id="k_pwdinfo">비밀번호 재설정</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</header>
	<body>
		<!-- 내 정보관리 확인 페이지 -->
		
		<article>
			<div class="s_row">
				<div id="c_us_info_edit_info">
					<form id="frm" method="post" action="">
						<table class="table table-striped">
							<thead>
								<tr>
									<td colspan="3"><p id="s_id_style">${bvo.buId}</p>님의 정보를
										안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="table-primary s_us_th"
										style="-bs-table-accent-bg: none;">아이디</th>
									<td colspan="2" class="table-light" id="s_us_no"><input
										type="text" class="form-control border_none" name="buId"
										maxlength="300" readonly="readonly" value="${bvo.buId}" /></td>
								</tr>
								<tr>
									<th class="table-primary s_us_th"
										style="vertical-align: middle;">비밀번호</th>
									<td class="table-light" id="s_us_pwd"><input
										type="password" class="form-control" name="buPwd"
										maxlength="300" id="buPwd" value="" placeholder="비밀번호를 입력해주세요." /></td>
									<td class="table-light" id="s_us_notice"><span
										id="s_us_pwd_check" style="display: none;">현재 비밀번호가 일치하지
											않습니다.</span></td>
								</tr>
							</tbody>
						</table>
						<div id="s_us_info_btn">
							<input type="button" id="s_bu_check_btn"
								class="btn btn-primary pull-right s_ad_nt_btn" value="확인">
							<input type="button" id="back_btn"
								class="btn btn-secondary pull-right s_ad_nt_btn" value="취소">
						</div>
					</form>
				</div>
			</div>
		</article>
		
		<script>
				
				//업체등록
				$("#k_bu_eroll_menu").click(function() {			
					location.href="bucompany";
				});
	
			$("#buPwd").keyup(function() {
				// console.log("db에 있는 pwd 확인" + ${bvo.buPwd});
				var db_pwd = "${bvo.buPwd}";
				console.log(db_pwd);
				var check_pwd = $("#buPwd").val();
	
				if (db_pwd == "" || check_pwd == "") {
					$("#s_us_pwd_check").css('display', 'inline-block');
					$("#s_us_pwd_check").text('');
				} else if (db_pwd != check_pwd) {
					console.log("비밀번호가 일치하지 않습니다.");
					$("#s_us_pwd_check").css('display', 'inline-block');
					$("#s_us_pwd_check").text('비밀번호가 일치하지 않습니다.');
					$("#s_us_pwd_check").css('color', 'red');
				} else {
					console.log("비밀번호가 일치합니다.");
					$("#s_us_pwd_check").css('display', 'inline-block');
					$("#s_us_pwd_check").text('비밀번호가 일치합니다.');
					$("#s_us_pwd_check").css('color', 'green');
				}
			});
	
			$("#back_btn").click(function() {
				location.href = "BumMainPage";
			});
	
			$("#s_bu_check_btn").click(function() {
				var txt = $("#s_us_pwd_check").text();
	
				if (txt == '비밀번호가 일치합니다.') {
					$("#s_us_pwd_check").text('');
					var frm = $("#frm");
					frm.attr("action", "bucpcheck");
					frm.attr("method", "post");
					frm.submit();
				} else {
					alert("비밀번호가 일치하지 않습니다.");
					$("#s_us_pwd_check").css('display', 'none');
					$("#buPwd").val("");
					$("#buPwd").focus();
				}
			});
			
			$("#k_pwdinfo").click(function() {
		    	var frm = $("#frm");
	  			frm.attr("action", "buminfocheck");
	  			frm.attr("method", "post");
	  			frm.submit();
			});
		</script>
	
		<script src="https://code.highcharts.com/modules/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	</body>
</html>