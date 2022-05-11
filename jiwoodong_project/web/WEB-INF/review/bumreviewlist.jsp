<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">       --%> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css"> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<title>사업자 리뷰 관리</title>
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
.s_row{
	border-radius: 15px;
}

.ftsz {
	font-size: .9em;
}

.highcharts-credits {
	display: none !important; 
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
										id="k_review_menu" href=" " role="button" > 리뷰관리 </a></li>
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
	
	<content>
	<article>
		<div id="main_box" style="display: block;height: 1000px;background-color: rgb(241, 241, 241);margin: 20px auto 0;padding: 30px;border-radius: 20px;">
         	<!-- 리뷰 조회 content : 전승희 -->
            <div id="c_inner_info" style="width: 1000px ; margin:0 auto;">
              <p class="c_info_title"
              style="text-align: center;margin: 20px;font-size: 1.5em;font-weight: bolder;">내 업체 리뷰조회</p>
              <table class="table table table-hover" 
              	style="width: 100%; margin-top: 40px; margin:0 auto;">
                <thead>
                  <tr>
                  	<th style="display: none;" scope="col" class="s_center">No</th>
                  	<!-- <th style="display: none;" scope="col" class="s_center">업체번호</th> -->
					<th scope="col" class="s_center" style="width: 200px;">업체명</th>
					<th scope="col" class="s_center" style="width: 400px;">내용</th>
					<th scope="col" class="s_center" style="width: 200px;">평점</th>
					<th scope="col" class="s_center" style="width: 100px;">작성자</th>
					<th scope="col" class="s_center" style="width: 100px;">작성일</th>
                  </tr>
                </thead>
                
                <tbody id="tbody" style="cursor: pointer;">
                <c:if test="${not empty bumRvlists }">
                <c:forEach items="${bumRvlists}" var="i">
					<tr id="j_review_menu" class="s_tr_readList s_tr_modal" >	
							<th style="display: none;" class="s_td_short" scope="row" class="s_ntNo">${i.rvNo}</th>
							<%-- <th style="display: none;" class="s_td_short" scope="row" class="s_ntNo">${i.cpNo}</th> --%>
							<th class="s_center" scope="row" class="s_ntNo">${i.cpName }</th>
							<td class="s_td_short" 
								style=" overflow: hidden; display: block; text-overflow: ellipsis; white-space: nowrap; width: 400px;">${i.rvContent}</td>
							<td class="s_td_short">${i.rvScore}</td>
							<td class="s_center">${i.umId}</td>
							<td class="s_center">${i.rvWriteDate }</td>
							<td style="display: none;" class="s_td_short">${i.rvNo }</td>
                 <%-- <input type="hidden" id="rvNo" name="rvNo" value="${i.rvNo}" /> --%>
					</tr>
                </c:forEach>
                </c:if>
				<c:if test="${empty bumRvlists }">
					<tr>
						<td colspan="5">등록된 리뷰가 없습니다.</td>
					</tr>
				</c:if>                
                </tbody>
              </table>
              </div>
            </div>
           </article>
<%--            <input type="hidden" id="cpNo" name="cpNo" value="${cpNo }" /> --%>
		</content>           

		<script>
		$("#k_review_menu").click(function() {
			var cpNo = $("#cpNo").val();
			console.log("cpNo ? : " + cpNo);
			console.log("cpNo 의 타입 ? : " + typeof(cpNo));
			location.href="bumreviewlist?cpNo=" + cpNo;
		});
	     </script>
	  	<script>
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
	</script>    
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
		    	location.href="buminfocheck";
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
		  		location.href="buminfocheck";
			});
			
			
	</script>            
           
    <script src="https://code.highcharts.com/modules/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>  
</body>
</html>