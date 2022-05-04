<%-- <%@page import="java.io.Console"%>
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
<title>사업자 본인확인</title>
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

<!--content-->
<style>
/* 컨텐트 */
#k_info_content {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
	border-radius: 15px;
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
</style>

</head>

<body>
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
									href="bucpupdate" id="k_info_menu" role="button"> 내정보 관리 </a></li>
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
						src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
						alt="mdo" width="60px">
					</a>
					<p style="font-size: 12px; width: 115px; margin: 5px;">환영합니다
						사업자님</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">비밀번호 재설정</a></li>
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
	<!-- 내정보 관리 -->	
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
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none; background-color: var(- -bs-table-bg);">사업자
									번호</th>
								<td colspan="3" class="table-light" id="s_us_no"><input
									type="text" class="form-control border_none" name="buNumber"
									readonly="readonly" value="${bvo.buNumber}" /></td>
							</tr>

							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none; background-color: var(- -bs-table-bg);">아이디</th>
								<td colspan="3" class="table-light" id="s_us_no"><input
									type="text" class="form-control border_none" name="buId"
									readonly="readonly" value="${bvo.buId}" /></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">변경할 비밀번호</th>
								<td class="table-light" id="s_bu_pwd"><input
									type="password" class="form-control" name="buPwd_1"
									id="buPwd_1" value="${bvo.buPwd}" placeholder="변경할 비밀번호를 입력해주세요." /></td>
								<td colspan="2" class="table-light" id="s_us_notice_1"><span
									id="s_bu_pwd_check_1" style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">비밀번호 확인</th>
								<td class="table-light" id="s_bu_pwd_check"><input
									type="password" class="form-control" name="buPwd_2"
									id="buPwd_2" value="${bvo.buPwd}" placeholder="비밀번호를 한번 더 입력해주세요." /></td>
								<td colspan="2" class="table-light" id="s_us_notice_2"><span
									id="s_bu_pwd_check_2" style="display: none;">현재 비밀번호가
										일치하지 않습니다.</span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">이름</th>
								<td class="table-light" id="s_bu_no"><input type="text"
									class="form-control" name="buName" readonly
									value="${bvo.buName}" /></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">생년월일</th>
								<td class="table-light"><input type="text"
									class="form-control" name="buBirth" value="${bvo.buBirth}"
									readonly="readonly" /></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">이메일</th>
								<td class="table-light"><input type="text"
									class="form-control" placeholder="jwd@google.com"
									name="buEmail" value="${bvo.buEmail}" /></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">핸드폰 번호</th>
								<td class="table-light"><input type="text"
									class="form-control" name="buTel" id="k_tel"
									placeholder="010-0000-0000" value="${bvo.buTel}" /></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
						</tbody>
					</table>
					<div id="s_us_info_btn">
						<input type="button" id="back_btn"
							class="btn btn-danger pull-right s_ad_nt_btn" value="취소하기">
						<input type="button" id="s_bu_check_btn"
							class="btn btn-primary pull-right s_ad_nt_btn" value="수정하기">
					</div>
					<hr>
					<div style="text-align: right;">
						<div id="s_us_push_right_btn">회원탈퇴를 원하시면 오른쪽 버튼을 눌러주세요.</div>
						<input type="button" style="font-size: .8em;" id="s_bu_delete_btn"
							class="btn btn-secondary pull-right s_ad_nt_btn" value="회원탈퇴">
					</div>
				</form>
			</div>
		</div>
	</article>
	
	
	<article>
		<div id="k_info_content">
			<nav id="k_bu_eroll_top">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_info_menu" href="bucpcheck" role="button"> 기본정보 </a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_delete_info" href="bucpdelete" role="button"> 내정보 삭제 </a></li>
				</ul>
			</nav>
				<form action="<%=request.getContextPath() %>/bucpupdate" method="post">
				<div>
					<!-- 사업자번호 읽기만 -->
					사업자 번호
					<p>
						<input type="text" value="${bvo.buNumber}" readonly>
					</p>
				</div>
				<div>
					이름
					<p>
						<input type="text" value="${bvo.buName}" readonly>
					</p>
				</div>
				<div>
					생년월일
					<p>
						<input type="text" value="${bvo.buBirth}" readonly>
					</p>
				</div>
				<!-- 아이디 읽기만 -->
				<div>
					아이디
					<p>
						<input type="text" value="${bvo.buId}" readonly>
					</p>
				</div>
				<div id = "k_passwordChange">
					변경할 비밀번호

					<p>
						<input type="password" class="pwd" id="buPwd" name ="buPwd" value="${bvo.buPwd}">						
					</p>
				</div>
				 <div>
					변경할 비밀번호 확인
					<p>
						<input type="password" id ="buPwd_re" name ="buPwd" value="${bvo.buPwd}">						
					</p>			
				</div> 
				<div>
					이메일 주소
					<p>
						<input type="text" name ="buEmail" value="${bvo.buEmail}">
					</p>
				</div>
				<div>
					핸드폰번호('-'없이 입력하여주세요)
					<p>
						<input type="text" name ="buTel" id="k_tel" value="${bvo.buTel}"
							placeholder="000-0000-0000" maxlength="13">
					</p>
				</div>
				<div>
					<input type="button" id="k_cancle_btn" value="취소하기">
					<input type="submit" id="k_update_btn" value="수정하기">
				</div>
			</form>
		</div>

	</article>
          
        

	<script src="https://code.highcharts.com/modules/data.js"></script> 
	<script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"
	</script>
</body>
</html> --%>