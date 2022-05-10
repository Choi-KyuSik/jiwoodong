<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
href="<%=request.getContextPath()%>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>공지사항</title>
<!-- google font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap');
    </style>
</head>
<body>

	<div>
		<%@ include file="../template_header.jsp"%>
	</div>

	<div style="margin: 0 auto; width: 1200px;">
		
		<div style="font-size: 2em; font-weight: bold; margin: 30px 0;">
			공지사항
		</div>
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
			<table class="table" style="clear: both; table-layout: fixed;">
			  <thead>
			    <tr>
			      <th scope="col" class="s_center" style="width: 100px;">글번호</th>
					<th scope="col" class="s_center" style="width: 300px;">제목</th>
							<th scope="col" class="s_center" style="width: 450px;">내용</th>
							<th scope="col" class="s_center">작성자</th>
							<th scope="col" class="s_center">작성일</th>
			    </tr>
			  </thead>
			  <tbody id="tbody" style="cursor: pointer;">
					<c:if test="${empty query}">
						<c:forEach items="${noticeListDetailPaging }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<th class="s_center" scope="row" class="s_ntNo">${i.ntNo}</th>
								<td class="s_td_short">${i.ntTitle}</td>
								<td class="s_td_short">${i.ntContent}</td>
								<td class="s_center">관리자</td>
								<td class="s_center">${i.ntDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty query}">
						<c:forEach items="${noticeListSearch }" var="i">
							<tr class="s_tr_readList s_tr_modal">
								<th class="s_center" scope="row" class="s_ntNo">${i.ntNo}</th>
								<td class="s_td_short">${i.ntTitle}</td>
								<td class="s_td_short">${i.ntContent}</td>
								<td class="s_center">관리자</td>
								<td class="s_center">${i.ntDate}</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
				<c:if test="${fn:length(noticeListSearch) == 0 and noticeListDetailPaging == null}">
					<div class="s_notice_msg">검색결과가 없습니다. 다시 검색해주세요.</div>
					<div id="s_back_list_div"><button id="s_back_list" class="btn btn-primary" type="button">목록으로</button></div>
				</c:if>
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


	<script>
		$("#s_back_list").click(function() {
    		location.href="AdminNoticeList";
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
			location.href = "MainpageNoticeDetail?ntNo=" + tdArr[0];
		});
	</script>
</body>
</html>