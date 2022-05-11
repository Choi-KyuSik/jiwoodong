<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">
 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css"> 
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



</head>
<body>
<header>
 	<div>
		<%@ include file="../view/user/user_header.jsp"%>
	</div>  
</header>   
    <article>
    <div id="main_box" style="background-color: rgb(241, 241, 241); border-radius: 15px; height: auto;">
    	<div style="padding: 10px 0 10px 0;">
     	 <div style="width: 90%;margin: 0 auto;background: white;border-radius: 15px;padding: 51px;margin-top: 30px; margin-bottom: 30px;">
	        <div style="text-align: center;">
	        	<p style="font-size: 2em; font-weight: bold;">리뷰 조회</p>
	        </div>
	
        <table class="table table table-hover"
					style="clear: both; table-layout: fixed; width: 70%; margin: 0 auto; margin-top: 30px;">
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
      </div> 
      </div>
    </article>
	
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
<!-- 	<script>
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
	</script>  -->
	
<!-- 	<script>
	$("#c_reviewlist").click(function() {
		console.log("안녕");
		$("#c_reviewlist_info").show();
		$("#c_reviewlist_info").load("userreviewlist");
	//var rvNo = $("#umId").val();
	//console.log("umId ? : " + umId);
	//console.log("umId 의 타입 ? : " + typeof (umId));
	// location.href = "userreviewlist";
});
	</script> -->
</body> 
</html>