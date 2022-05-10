<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kh.semi.jwd.bum.model.service.BumService"%>
<%@page import="kh.semi.jwd.bum.model.dao.BumDao"%>
<%@page import="kh.semi.jwd.bum.model.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css">	

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<title>리뷰 게시판</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div>
		<%@ include file="../view/user/user_header.jsp"%>
	</div>
    <!-- 네비 리뷰 -->
    <article>
      <div id="c_reviewlist_info">
        <div style="text-align: center;">
        	<p style="font-size: 2em; font-weight: bold;">리뷰 조회</p>
        </div>
        <table class="table table table-hover"
					style="clear: both; table-layout: fixed;">
					<thead>
						<tr>
							<th style="display: none;" scope="col" class="s_center">No</th>
							<th scope="col" class="s_center" style="display: none;">No</th>
							<th scope="col" class="s_center">업체명</th>
							<th scope="col" class="s_center">내용</th>
							<th scope="col" class="s_center">평점</th>
							<th scope="col" class="s_center">작성자</th>
							<th scope="col" class="s_center">작성일</th>
						</tr>
					</thead>

					<tbody id="tbody" style="cursor: pointer;">
				                <c:forEach items="${userrvlist}" var="i">
								<tr id="k_review_menu" class="s_tr_readList s_tr_modal">
									<th style="display: none;" class="s_td_short" scope="row" class="s_ntNo">${i.rvNo}</th>
									<th class="s_td_short" scope="row" class="s_ntNo">${i.cpName }</th>
									<td class="s_center">${i.rvContent}</td>
									<td class="s_center">${i.rvScore}</td>
									<td class="s_td_short">${i.umId }</td>
									<td class="s_td_short">${i.rvWriteDate }</td>
									<td style="display: none;" class="s_td_short">${i.rvNo }</td>
									<%-- <input type="text" id="rvNo" name="rvNo" value="${i.rvNo}"/> --%>
								</tr>
			                </c:forEach>
					</tbody>
				</table>
      </div>
    </article>

<%--             <div id="c_inner_info" style="width: 1000px">
              <p class="c_info_title">리뷰내역</p>
              <table class="table" style="width: 100%; margin-top: 40px;">
                <thead>
                  <tr>
					<th scope="col" class="s_center" style="width: 300px;">업체명</th>
					<th scope="col" class="s_center" style="width: 400px;">내용</th>
					<th scope="col" class="s_center" style="width: 100px;">평점</th>
					<th scope="col" class="s_center" style="width: 100px;">작성자</th>
					<th scope="col" class="s_center" style="width: 100px;">작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${userrvlist}" var="i">
					<tr class="s_tr_readList s_tr_modal">
						<th class="s_center" scope="row" class="s_ntNo">${i.cpName }</th>
						<td class="s_td_short">${i.rvContent}</td>
						<td class="s_td_short">${i.rvScore}</td>
						<td class="s_center">${i.umId}</td>
						<td class="s_center">${i.rvWriteDate }</td>
					</tr>
                </c:forEach>
                </tbody>
              </table>
            </div> --%>
	
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
			location.href="userRvDetailList?rvNo=" + tdArr[0];
		}); 
	</script>   
	<!-- 네비바 클릭시 페이지 이동 -->
	<script>
		//$("#k_review_menu").click(function() {
			//var rvNo = $("#umId").val();
			//console.log("umId ? : " + umId);
			//console.log("umId 의 타입 ? : " + typeof (umId));
			//location.href = "userreviewlist";
		//});
		$("#c_cplist").click(function() {
			/* location.href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=qbxlvnf11&logNo=221141017820"; */
			location.href = "uscplist";
		})
		$("#c_mypage").click(function() {
			console.log("찍히냐? mypage");
			location.reload();
		});
	</script> 
</body> 
</html>