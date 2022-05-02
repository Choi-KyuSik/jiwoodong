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
<title>공지사항 조회</title>
</head>
<body>

	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	<section id="contents">

		<!-- 공지사항 content : 손은진 -->
		<div>
			<div id="s_notice_content" class="tab_menu s_content" style="display: block;">
				<p class="p_content_style">공지사항 조회</p>
				<button type="button" id="s_notice_insert_btn"
					class="btn btn-primary" data-bs-dismiss="modal">글 등록</button>
				<!-- 검색 -->
				<nav class="navbar navbar-light"
					style="float: right; margin-bottom: 20px;">
					<div class="container-fluid">
						<form action="AdminNoticeList" method="get" id="frm" class="d-flex">
							<select name="f" style="width: 100px; float: right; margin-right: 10px;"
								class="form-select" aria-label="Default select example">
								<option value="nt_title" selected="selected" ${field eq 'nt_title' ? 'selected' : ''}>제목</option>
								<option value="nt_content" ${field eq 'nt_content' ? 'selected' : ''}>내용</option>
							</select> 
							<input class="form-control me-2" type="search" name="q" placeholder="Search" aria-label="Search" value="${query }">
							<button id="s_search_btn" class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>
				<table class="table table table-hover"
					style="clear: both; table-layout: fixed;">
					<thead>
						<tr>
							<th scope="col" style="width: 100px;">글번호</th>
							<th scope="col" style="width: 300px;">제목</th>
							<th scope="col" style="width: 450px;">내용</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>

					<tbody id="tbody" style="cursor: pointer;">
					<c:if test="${empty query}">
						<c:forEach items="${noticeListDetailPaging }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<th scope="row" class="s_ntNo">${i.ntNo}</th>
								<td class="s_td_short">${i.ntTitle}</td>
								<td class="s_td_short">${i.ntContent}</td>
								<td>관리자</td>
								<td>${i.ntDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty query}">
						<c:forEach items="${noticeListSearch }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<th scope="row" class="s_ntNo">${i.ntNo}</th>
								<td class="s_td_short">${i.ntTitle}</td>
								<td class="s_td_short">${i.ntContent}</td>
								<td>관리자</td>
								<td>${i.ntDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				<div id="pagingBox">
					<ul class="pagination">
					<!-- startPage에서 -1일 때 -->
					<c:if test="${startPage > 1 }">
						<li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${startPage-1 }">Previous</a></li>
					</c:if>
					<c:if test="${startPage <= 1 }">
						<li class="page-item disabled"><a class="page-link" href="AdminNoticeList?pageNum=${startPage-1 }">Previous</a></li>
					</c:if>
					<c:forEach step="1" begin="${startPage }" end="${endPage }" var="idx">
						<c:if test="${idx eq currentPage }">
						<li class="page-item active"><a class="page-link" href="AdminNoticeList?pageNum=${idx }">${idx }</a></li>
						</c:if>
						<c:if test="${idx ne currentPage }">
						<li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${idx }">${idx }</a></li>
						</c:if>
					</c:forEach>
					<!-- endPage에서 +1일 때 -->
					<c:if test="${endPage < pageCnt }">
						<li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${endPage+1 }">Next</a></li>
					</c:if>
					<c:if test="${endPage >= pageCnt }">
						<li class="page-item disabled"><a class="page-link" href="AdminNoticeList?pageNum=${endPage+1 }">Next</a></li>
					</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<script>
		$("#s_notice_insert_btn").click(function() {
			console.log("등록버튼 눌리니?");
			location.href = "AdminNoticeWrite";
		});
		/* $("#s_search_btn").click(function() {
        	$("#frm").attr("action", "AdminNoticeList");
        	$("#frm").submit();
        }); */
		
		$(".s_tr_readList").click(function() {
			// 배열 선언
			var tdArr = new Array();
			// 현재 클릭된 행(tr의 td)
			var tr = $(this);
			var td = tr.children();

			// 반복문을 통해 배열에 값을 담아 사용
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
			// td들이 배열에 담겨있는데 그 중 1번째가 필요
			console.log("배열에 담긴 값 : " + tdArr[0]);
			console.log(typeof (tdArr[0]));

			// 링크로 넘기기
			location.href = "AdminNoticeDetailRead?ntNo=" + tdArr[0];
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
    </script>
    
    <!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    	$("#s_logout").click(function() {
    		Kakao.init('f276b6cc77a90e02edac0cb9b783cc3f'); //발급받은 키 중 javascript키를 사용해준다.
    		if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response);
						alert("로그아웃 성공");
						location.href="AdminLogin";
					},
					fail : function(error) {
						console.log(error);
						alert("로그아웃 실패");
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
    	});
    </script>
</body>
</html>