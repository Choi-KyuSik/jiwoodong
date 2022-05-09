<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin.css">
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>리뷰 관리</title>
</head>
<body>
	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	
	<section id="contents">

		<!-- 리뷰관리 content : 손은진 -->
		<div>
			<div id="s_notice_content" class="tab_menu s_content" style="display: block;">
				<p class="p_content_style">리뷰 조회</p>
				<!-- 검색 -->
				<nav class="navbar navbar-light"
					style="float: right; margin-bottom: 20px;">
					<div class="container-fluid">
						<form action="AdminReviewList" method="get" id="frm" class="d-flex">
							<select name="f" style="width: 100px; float: right; margin-right: 10px;"
								class="form-select" aria-label="Default select example">
								<option value="cp_category" selected="selected" ${field eq 'cp_category' ? 'selected' : ''}>업종</option>
								<option value="cp_name" ${field eq 'cp_name' ? 'selected' : ''}>업체명</option>
								<option value="um_id" ${field eq 'um_id' ? 'selected' : ''}>리뷰작성자</option>
								<option value="rv_content" ${field eq 'rv_content' ? 'selected' : ''}>내용</option>
							</select> 
							<input class="form-control me-2" type="search" name="q" placeholder="Search" aria-label="Search" value="${query }">
							<button id="s_search_btn" class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>
				<table class="table table table-hover"
					style="clear: both; text-align: center; table-layout: fixed;">
					<thead>
						<tr>
							<th scope="col" class="s_center" style="width: 50px;">NO</th>
							<th scope="col" class="s_center" style="width: 100px;">업종</th>
							<th scope="col" class="s_center" style="width: 150px;">업체명</th>
							<th scope="col" class="s_center" style="width: 150px;">리뷰작성자</th>
							<th scope="col" class="s_center" style="width: 400px;">내용</th>
							<th scope="col" class="s_center" style="width: 150px;">별점</th>
							<th scope="col" class="s_center">작성일</th>
						</tr>
					</thead>

					<tbody id="tbody" style="cursor: pointer;">
					<c:if test="${empty query }">
						<c:forEach items="${adRvList }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<td style="display: none;">${i.rvNo }</td>
								<th class="s_center" scope="row" class="s_ntNo">${i.rnum }</th>
								<td class="s_td_short">${i.cpCategory }</td>
								<td class="s_td_short">${i.cpName }</td>
								<td class="s_center">${i.umId }</td>
								<td class="s_center">${i.rvContent }</td>
								<td class="s_center">${i.rvScore }</td>
								<td class="s_center">${i.rvWriteDate }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty query }">
						<c:forEach items="${adRvListSearch }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<td style="display: none;">${i.rvNo }</td>
								<th class="s_center" scope="row" class="s_ntNo">${i.rnum }</th>
								<td class="s_td_short">${i.cpCategory }</td>
								<td class="s_td_short">${i.cpName }</td>
								<td class="s_center">${i.umId }</td>
								<td class="s_center">${i.rvContent }</td>
								<td class="s_center">${i.rvScore }</td>
								<td class="s_center">${i.rvWriteDate }</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
				<c:if test="${fn:length(adRvListSearch) == 0 and fn:length(adRvList) == 0}">
					<div class="s_notice_msg">검색결과가 없습니다. 다시 검색해주세요.</div>
					<div id="s_back_list_div"><button id="s_back_list" class="btn btn-primary" type="button">목록으로</button></div>
				</c:if>
				<div id="pagingBox">
					<ul class="pagination">
					<!-- startPage에서 -1일 때 -->
					<c:if test="${startPage > 1 }">
						<li class="page-item"><a class="page-link" href="AdminReviewList?pageNum=${startPage-1 }">Previous</a></li>
					</c:if>
					<c:if test="${startPage <= 1 }">
						<li class="page-item disabled"><a class="page-link" href="AdminReviewList?pageNum=${startPage-1 }">Previous</a></li>
					</c:if>
					<c:forEach step="1" begin="${startPage }" end="${endPage }" var="idx">
						<c:if test="${idx eq currentPage }">
						<li class="page-item active"><a class="page-link" href="AdminReviewList?pageNum=${idx }">${idx }</a></li>
						</c:if>
						<c:if test="${idx ne currentPage }">
						<li class="page-item"><a class="page-link" href="AdminReviewList?pageNum=${idx }">${idx }</a></li>
						</c:if>
					</c:forEach>
					<!-- endPage에서 +1일 때 -->
					<c:if test="${endPage < pageCnt }">
						<li class="page-item"><a class="page-link" href="AdminReviewList?pageNum=${endPage+1 }">Next</a></li>
					</c:if>
					<c:if test="${endPage >= pageCnt }">
						<li class="page-item disabled"><a class="page-link" href="AdminReviewList?pageNum=${endPage+1 }">Next</a></li>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<script>
		
		$("#s_back_list").click(function() {
			location.href="AdminReviewList";
		});
	
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

			// 링크로 넘기기
			location.href = "AdminReviewDetailList?rvNo=" + tdArr[0];
		});
	</script>
	
	<!-- 메뉴버튼 눌렀을 때 이동할 페이지 -->
	<script>
    	$("#s_notice_menu").click(function() {
    		location.href="AdminNoticeList";
    	});
    	
    	$("#s_bu_accept_menu").click(function() {
    		location.href="AdminBuAcceptList";
    	});
    	
    	$("#s_bu_accept_result_approval_menu").click(function() {
    		location.href="AdminBuAcceptApprovalList";
    	});
    	
    	$("#s_bu_accept_result_reject_menu").click(function() {
    		location.href="AdminBuAcceptRejectList";
    	});
    	
    	$("#s_bu_info_menu").click(function() {
    		location.href="AdminBuInfoList";
    	});
    	
    	$("#s_bu_delete_menu").click(function() {
    		location.href="AdminBuInfoDeleteList";
    	});
    	
    	$("#s_us_info_menu").click(function() {
    		location.href="AdminUsInfoList";
    	});
    	
    	$("#s_us_delete_menu").click(function() {
    		location.href="AdminUsInfoDeleteList";
    	});

    	$("#s_review_menu").click(function() {
    		location.href="AdminReviewList";
    	});
    </script>
	
</body>
</html>