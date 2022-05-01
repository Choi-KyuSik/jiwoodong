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
.table{
	font-size : 15px;
	text-align: center;
}
</style>
<!--월별 예약통계-->
<style>
#container {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#datatable {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
	display: none;
}

#datatable caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

#datatable th {
	font-weight: 600;
	padding: 0.5em;
}

#datatable td, #datatable th, #datatable caption {
	padding: 0.5em;
}

#datatable thead tr, #datatable tr:nth-child(even) {
	background: #f8f8f8;
}

#datatable tr:hover {
	background: #f1f7ff;
}
</style>
<!--별점통계-->
<style>
.highcharts-figure, .highcharts-data-table table {
	width: 500px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
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
						<li><a class="dropdown-item" href="bucpcheck">비밀번호 재설정</a></li>
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
	<section>
		<div id="main_box">
			<div class="nav_tab_div">
				<div id="booking">
					<p class="box_font">예약현황</p>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">성함</th>
									<th scope="col">연락처</th>
									<th scope="col">예약번호</th>
									<th scope="col">예약일시</th>
									<th scope="col">예약시간</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr>
										<th scope="row"><c:out value="${list.bkName }" /></th>
										<td>${list.bkPhone }</td>
										<td>${list.bkNo }</td>
										<td>${list.bkDate }</td>
										<td>${list.bkTime }</td>
										<td><c:out value="${list.bsStatus eq 'R' ? '예약' : '취소' }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="review">
					<p class="box_font">리뷰</p>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">제목</th>
									<th scope="col">작성일자</th>
									<th scope="col">아이디</th>
									<th scope="col">별점</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${Rlist}" var="list">
									<tr>
										<th scope="row">${list.rownum}</th>
										<td><c:out value="${list.rvContent}" /></td>
										<td>${list.rvWriteDate}</td>
										<td>${list.umId}</td>
										<td>${list.rvScore}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="statistics_visit">
					<p class="statiscics_font">월별 예약통계</p>
					<figure class="highcharts-figure">
						<div id="container_visit"></div>
						<table id="datatable">
							<thead>
								<tr>
									<th></th>
									<th>예약</th>
									<th>취소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${visit}" var="visit">
									<tr>
										<th>${visit.month}월</th>
										<td>${visit.booking}</td>
										<td>${visit.cancle}</td>
									</tr>
								</c:forEach>
								<!-- <tr>
									<th>3월</th>
									<td>3</td>
									<td>10</td>
								</tr>
								<tr>
									<th>4월</th>
									<td>5</td>
									<td>14</td>
								</tr> -->
							</tbody>
						</table>
					</figure>
				</div>
				<div id="statistics_review">
					<p class="statiscics_font">별점 통계</p>
					<script src="https://code.highcharts.com/highcharts.js"></script>
					<figure class="highcharts-figure">
						<div id="container"></div>
					</figure>
				</div>
			</div>
		</div>
	</section>
	
	
	<script>
			$("#k_info_menu").click(function() {
				location.href="bucpcheck";
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
			$("#k_bu_eroll_menu").click(function() {
				location.href="bucompany";
			});
			$("#k_re_cu_menu").click(function() {
				location.href = "<%=request.getContextPath()%>/burscheck";
			});
			$("#k_us_info_menu").click(function() {
				$("#k_info_content").hide();
				$("#k_review_content").hide();
				$("#k_re_cu_content").hide();
				$("#k_bu_eroll_content").hide();
				$("#k_re_menu_content").hide();
				$("#k_us_info_content").show();
				$("#main_box").hide();
			});
	</script>
	<script>
		// Create the chart
		Highcharts.chart('container', {
			chart : {
				type : 'pie'
			},
			title : {
				text : ''
			},
			accessibility : {
				announceNewData : {
					enabled : true
				},
				point : {
					valueSuffix : '%'
				}
			},
			plotOptions : {
				series : {
					dataLabels : {
						enabled : true,
						format : '{point.name}: {point.y:1f}개'
					}
				}
			},
			series : [ {
				name : "카운터",
				colorByPoint : true,
				data : [
					{
						name : "1점",
						y : ${review[0].count},
					}, {
						name : "2점",
						y : ${review[1].count},
					}, {
						name : "3점",
						y : ${review[2].count},
					}, {
						name : "4점",
						y : ${review[3].count},
					}, {
						name : "5점",
						y : ${review[4].count},
					}
				]
			} ]
		});
	</script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<!--방문자통계-->
	<script>
		Highcharts.chart('container_visit', {
			data : {
				table : 'datatable'
			},
			chart : {
				type : 'column'
			},
			title : {
				text : ''
			},
			yAxis : {
				allowDecimals : false,
				title : {
					text : 'count'
				}
			}
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>