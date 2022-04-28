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

<!--content-->
<style>
/* 컨텐트 */
content>article>div {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
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
</style>

</head>
<script>
	$()
</script>
<body>
	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="" id="k_logo"><img
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
<content> 
	<!-- 내정보 관리 -->
	<article>

		<div id="k_info_content">

			<nav id="k_bu_eroll_top">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_info_menu" href="#" role="button"> 기본정보 </a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_info_menu" href="#" role="button"> 내정보 삭제 </a></li>
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
				<div>
					변경할 비밀번호
					<p>
						<input type="password" name ="buPwd" value="${bvo.buPwd}">
					</p>
				</div>
				<%-- <div>
					변경할 비밀번호 확인
					<p>
						<input type="password" name ="buPwd" value="${bvo.buPwd}">
					</p>
				</div> --%>
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
					<input type="submit" value="수정하기">
				</div>
			</form>
		</div>

	</article>
</content>
	<!-- <article>
		<div id="k_bu_eroll_content">
			<div>
				<div class="k_company">
					<strong>업체명을 입력해주세요.<span class="k_essential_info">*필수</span></strong>
					<p>
						<input type="text" placeholder="대표업체명을 입력해주세요.">
					</p>
				</div>
				<div class="k_company">
					<strong>업종을 선택해주세요.<span class="k_essential_info">*필수</span></strong>
					<p>
						<select name="category">
							<option value="category_select">업종을 선택해주세요</option>
							<option value="category_salon">미용실</option>
							<option value="category_cafe">카페</option>
							<option value="category_hotel">호텔</option>
						</select>
					</p>
				</div>

				<div class="k_company">
					상세설명을 입력해주세요
					<p>
						<textarea placeholder="우리업체를 고객들에게 자세히 설명해주세요"
							class="k_company_info">                            
                            </textarea>
					</p>
				</div>
				<div class="k_company">업체 사진을 추가해 주세요</div>
				<div class="k_company">
					운영 구분
					<p>
						<label><span>모든 영업일 같아요</span></label> <label><span>평일/주말
								달라요</span></label>
					</p>
				</div>
				<div>
					<strong>전화번호를 입력해주세요<span class="k_essential_info">*필수</span></strong>
					<p>
						<input type="text">
					</p>
				</div>
				<div class="k_company">
					<strong>주소를 입력해주세요<span class="k_essential_info">*필수</span></strong>
					<p>
						<input type="text">
					</p>
					<p>
						<span>찾아오는 길 설명이 필요하신가요?</span>

						<p>
                                <textarea placeholder="예)"
							class="k_company_info">                            
                                </textarea>
                            </p>
                        </p>
                        
                        <button>취소하기</button>
					<button>수정하기</button>
                    </div>
                </div>                
            </div>
        </article>--> 
        
        <script>
			$("#k_info_content").show();
		</script> 
		
		<!--전화번호 하이픈 정규식 DOM  --> 
		<script>
		$("#k_tel").on(
				"input",
				function() {
					var target = document.getElementById("k_tel");
					target.value = target.value.replace(/[^0-9]/g, '').replace(
							/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
							.replace(/(\-{1,2})$/g, "");

				});
	</script> 

	<script src="https://code.highcharts.com/modules/data.js"></script> <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>