<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<title>리뷰 상세 조회 페이지(사용자)</title>
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
	height: 480px;
	background-color: white;
	border-radius: 30px;
	margin: 0 15px 30px;
	overflow: hidden;
}

.box_font {
	margin-top: 10px;
	font-weight: bold;
	color: #0D6EFD;
	margin-bottom: 20px;
	font-size: large;
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
	margin-top: 20px;
    font-weight: bold;
    color: #0D6EFD;
    margin-bottom: 20px;
    font-size: large;
}
.table{
	font-size : 15px;
	text-align: center;
}
</style>
<style>
#s_rv_section {
	width: 800px;
	height: 500px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 20px;
	background-color: #f8f9ff;
	margin: 0 auto;
	margin-bottom: 20px;
}

#s_rv_id {
	font-size: 1.2em;
	font-weight: bold;
}

#s_rv_love {
	margin: 10px 0;
}

#s_rv_date {
	color: gray;
	font-size: .9em;
}

#s_rv_content {
	margin-bottom: 10px;
	word-break: break-all;
	width: 500px;
}

#s_rv_title {
	text-align: center;
	font-size: 2em;
	font-weight: bold;
	margin: 20px;
}

#s_rv_main_box {
	margin: 0 auto;
	width: 1200px;
}

#s_rv_btn_box {
	clear: both;
	text-align: center;
	padding-top: 30px;
	line-height: 4;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
    font-size: 19px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #0074ba;
}
</style>
</head>
<body>
	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="<%=request.getContextPath() %>/BumMainPage" id="k_logo"><img
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
										id="k_review_menu" href="#" role="button" > 리뷰관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown" data-value="cpSignYn"
									id="k_bu_eroll_menu" href="#" role="button"> 업체등록 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 예약관리 </a>
									<ul class="dropdown-menu dropdown-menu">
										<li><a class="dropdown-item" id="k_re_menu_enroll" href="#"
											>예약메뉴등록</a></li>
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

	<article>
	<div id="main_box">
	<section id="contents">

		<div id="s_rv_main_box">
			<div id="s_rv_title">리뷰 상세 조회</div>
			<form id="frm" method="post" action="#">
				<c:forEach items="${rvDetailList }" var="i">
					<section id="s_rv_section">
						<article style="float: left;">
							<div>
								<div id="s_rv_id">${i.umId }</div>
								<div id="s_rv_love">${i.rvScore }</div>
								<div id="s_rv_date">${i.rvWriteDate }</div>
							</div>
						</article>
						<article style="float: right;">
							<div id="s_rv_content">${i.rvContent }</div>
							<c:if test="${empty i.flGno }">
							<div style="padding-top: 10px; width: 300px; height: 300px;">
								
							</div>
							</c:if>
							<c:if test="${not empty i.flGno }">
							<div style="padding-top: 10px; width: 300px; height: 300px;">
								<img style="width: 300px; height: 300px; border-radius: 10px;"
									src="${i.flGno }">
							</div>
							</c:if>
						</article>
						<div id="s_rv_btn_box">
							<input type="button" id="back_btn"
								class="btn btn-secondary pull-right" value="뒤로가기"> 
							<!-- <input type="button" id="s_update_btn"
								class="btn btn-primary pull-right" data-bs-toggle="modal" data-bs-target="#exampleModal"value="수정하기"> --> 
							
						</div>
					</section>
				</c:forEach>
			</form>
		
		</div>
		
	</section>
	</div>
</article>

	<script>
		$("#k_review_menu").click(function() {
			history.back();
		});
		$("#back_btn").click(function() {
			history.back();
		});
		
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			console.log($(this).attr('href'));
			var obj = $(this);
			console.log(obj.attr('href'));
			return false;
		});
		
	</script>
<!-- 	  	<script>
		$(".s_tr_readList").click(function() {
			
			// 배열 선언
			var tdArr = new Array();
			// 현재 클릭된 행(tr의 td)
			var tr = $(this);
			console.log("tr : " + tr);
			var td = tr.children();
			console.log("td : " + td);

			// 반복문을 통해 배열에 값을 담아 사용
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			// td들이 배열에 담겨있는데 그 중 1번째가 필요
			console.log("tdArr : " + tdArr);
			console.log("배열에 담긴 값 : " + tdArr[0]);
			console.log(typeof (tdArr[0]));
			/* var rvNo = $("#rvNo").val();
			console.log("rvNo ? : " + rvNo);
			console.log("rvNo 의 타입 ? : " + typeof(rvNo)); */
			location.href="bumReviewDetailList?rvNo=" + tdArr[0];
		}); 
	</script> --> 
	<!--메뉴바 이동  -->
	
		<script>
			$("#k_info_menu").click(function() {
				$("#k_info_content").hide();
				$(".s_row").show();
				$("#k_bu_eroll_content").hide();
				$("#k_re_cu_content").hide();
				$("#k_us_info_content").hide();
				$("#k_re_menu_content").hide();
				$("#main_box").hide();
				/* var frm = $("#frm");
				frm.attr("action", "buminfocheck");
				frm.attr("method", "post");
				frm.submit(); */
			});
			
			$("#k_review_menu").click(function() {
				$("#k_info_content").hide();
				$("#k_review_content").show();
				$("#k_bu_eroll_content").hide();
				$("#k_re_cu_content").hide();
				$("#k_us_info_content").hide();
				$("#k_re_menu_content").hide();
				$("#main_box").hide();
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
			
			//예약관리 - 예약 조회/수정
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
	  <script src="https://code.highcharts.com/modules/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script> 
</body>
</html>