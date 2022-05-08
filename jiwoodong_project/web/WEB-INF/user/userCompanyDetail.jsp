<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userCpDetail.css">

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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>업체 상세 페이지</title>
</head>
<body>
	<div>
		<%@ include file="../view/user/user_header.jsp" %>
	</div>
	<!-- <header>
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
									id="c_mypage" href="#" role="button"> 마이페이지 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="c_notice" href="#" role="button"> 공지사항 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="c_cplist" href="#" role="button"> 매장 찾기 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="c_mapsc" href="#" role="button"> 내 주변 검색 </a></li>
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
						alt="mdo" style="width: 60px;">
					</a>
					<p style="font-size: 12px; width: 115px; margin: 5px;">사용자ID</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">마이페이지</a></li>
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
 -->
	<section style="height: 100%;">
		<div id="main_box"
			style="background-color: rgb(241, 241, 241); border-radius: 15px;">
			<div style="padding: 10px 0 10px 0;">
				<div class="c_company_info" style="border-radius: 15px;">
					
					<div>
						<div style="text-align: center;">
							<a href="#" style="text-align: center;"> <img
								src="https://cdn.discordapp.com/attachments/958566133752016903/966709567109095484/hotel.jpg"
								alt="" style="width: 400px; height: 300px; margin: 30px;">
							</a>
						</div>
						<c:forEach items="${uscpdetail }" var="i">
						<div style="margin-bottom: 20px; text-align: center;">
						
							<h4>${i.cpName }</h4>
							<div>
								<span>☆ 4.8 / 5.0</span>
							</div>
							<div>
								<span><a class="btn btn-primary" href="#" role="button"
									style="width: 300px;">예약하기</a></span> <span><input
									type="checkbox" class="btn-check" id="btncheck2"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="btncheck2">☆</label> </span>
							</div>
						</div>
						</c:forEach>

						<hr style="margin: 0;">

						<div style="width: 900px;">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="c_home-tab"
										data-bs-toggle="tab" data-bs-target="#c_home" type="button"
										role="tab" aria-controls="c_home" aria-selected="true">홈</button>
								</li>
								<!-- <li class="nav-item" role="presentation">
									<button class="nav-link" id="c_notice_t-tab"
										data-bs-toggle="tab" data-bs-target="#c_notice_t"
										type="button" role="tab" aria-controls="c_notice_t"
										aria-selected="false">소식</button>
								</li> -->
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="c_riview-tab" data-bs-toggle="tab"
										data-bs-target="#c_riview" type="button" role="tab"
										aria-controls="c_riview" aria-selected="false">리뷰</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="c_img-tab" data-bs-toggle="tab"
										data-bs-target="#c_img" type="button" role="tab"
										aria-controls="c_img" aria-selected="false">사진</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="c_map-tab" data-bs-toggle="tab"
										data-bs-target="#c_map" type="button" role="tab"
										aria-controls="c_map" aria-selected="false">지도</button>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<!--홈 탭 내용-->
								<div class="tab-pane fade show active" id="c_home"
									role="tabpanel" aria-labelledby="c_home-tab">
								<c:forEach items="${uscpdetail }" var="i">
									<table style="width: 900px; margin-top: 30px;">
										<tr>
											<th class="c_home_info">업체명</th>
											<td class="c_home_info_td">${i.cpName }</td>
										</tr>
										<tr>
											<th class="c_home_info">주소</th>
											<td class="c_home_info_td">${i.cpAddress } ${i.cpDTAddress }</td>
										</tr>
										<tr>
											<th class="c_home_info">전화번호</th>
											<td class="c_home_info_td">${i.buTel }</td>
										</tr>
										<tr>
											<th class="c_home_info">운영시간</th>
											<td class="c_home_info_td">${i.cpOpenTime } ~ ${i.cpCloseTime }</td>
										</tr>
									</table>
									<hr style="margin-top: 30px; margin-bottom: 30px;">

								</c:forEach>
								</div>

								<!-- 소식 탭 내용 -->
								<!-- <div class="tab-pane fade" id="c_notice_t" role="tabpanel"
									aria-labelledby="c_notice-tab">...</div> -->
								<!--리뷰 탭 내용-->
								<div class="tab-pane fade" id="c_riview" role="tabpanel"
									aria-labelledby="c_riview-tab">

									<div style="height: 700px; margin-top: 30px;">
										<table class="table" style="width: 900px;">
											<thead>
												<tr>
													<th scope="col">No</th>
													<th scope="col">제목</th>
													<th scope="col">작성일자</th>
													<th scope="col">아이디</th>
													<th scope="col">별점</th>
												</tr>
											</thead>
											<c:forEach items="${uscpdetail }" var="i">
											<tbody>
												<tr>
													<th scope="row">${i.rvNo}</th>
													<td>${i.rvContent }</td>
													<td>${i.rvWriteDate }</td>
													<!-- TO DO -->
													<td>${i.umId }</td>
													<td>${i.rvScore }</td>
												</tr>
												
												<!-- <tr>
													<th scope="row">2</th>
													<td>제목</td>
													<td>리뷰내용</td>
													<td>아이디</td>
													<td>별점</td>
												</tr>
												<tr>
													<th scope="row">3</th>
													<td>제목</td>
													<td>리뷰내용</td>
													<td>아이디</td>
													<td>별점</td>
												</tr> -->
											</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
								<!--사진 탭 내용-->
								<div class="tab-pane fade" id="c_img" role="tabpanel"
									aria-labelledby="c_img-tab">
									<ul class="c_img_list">
										<div style="margin: 30px 0;">
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709567696285696/hotel1.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709568396730439/hotel2.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709568786817024/hotel3.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709569185263697/hotel4.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709569533399040/hotel5.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709569986387989/hotel6.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709570334523402/hotel7.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
											<li class="c_img_box">
												<div>
													<a href="#"> <img
														src="https://cdn.discordapp.com/attachments/958566133752016903/966709570623909888/hotel8.jpg"
														class="c_img" alt="">
													</a>
												</div>
											</li>
										</div>
									</ul>
								</div>

								<!--지도 탭 내용-->
								<div class="tab-pane fade" id="c_map" role="tabpanel"
									aria-labelledby="c_map-tab">
									<div style="padding: 50px 0 50px 0">
										<div id="map" style="width: 100%; height: 350px;"></div>

										<script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56f933d730edd6925940403e2568524b"></script>
										<script>
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};

											var map = new kakao.maps.Map(
													mapContainer, mapOption); // 지도를 생성합니다

											// 마커가 표시될 위치입니다 
											var markerPosition = new kakao.maps.LatLng(
													33.450701, 126.570667);

											// 마커를 생성합니다
											var marker = new kakao.maps.Marker(
													{
														position : markerPosition
													});

											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);

											// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
											// marker.setMap(null);
										</script>
										<%-- <%@ include file="../view/map_api.jsp"%> --%>
									</div>
								</div>
							</div>
						</div>

					</div>
					
				</div>
			</div>
		</div>

		<content>
  <!-- 네비 업체조회 -->
    
    
  <!-- 네비 주변검색 -->
    <article>
      <div id="c_maps_info">
        <div style="width:100%; height: 100%;">
		<%@ include file="../view/map_api.jsp"%>
		</div>
      </div>
    </article>
    
    <!-- 네비 예약현황 -->
    <article>
    <div id="c_bklist_info">
    <div style="width: 100%; height: 100%; padding: 30px; border-radius: 15px; background-color: white;">
      <div class="d-flex align-items-start">
  		<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    		<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">예약대기</button>
    		<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">예약완료</button>
    		<button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">예약취소</button>
  		</div>
  	  <div class="tab-content" id="v-pills-tabContent">
		<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
		<!-- 네비 예약현황 : 예약 대기 -->
          <%-- <c:forEach items="${usBkList_h }" var="i"> --%>
    		<div class="card" style="width: 250px; display: inline-block; float: left; margin: 10px;">
            	<img src="https://cdn.discordapp.com/attachments/958566133752016903/966709570334523402/hotel7.jpg" class="card-img-top" alt="...">
	            <div class="card-body">
	              <h5 class="card-title"> ${bklist_h.cpName} </h5>
	              <p class="card-text">${bklist_h.cpAddress}</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item">${bklist_h.bkDate}</li>
	              <li class="list-group-item">${bklist_h.bkStatus}</li>
	            </ul>
	            <div class="card-body">
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a>
	            </div>
         	</div>
         	<%-- </c:forEach> --%>
    	 </div>
    	 <!-- 네비 예약현황 : 예약 완료 -->
	     <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
	     	<%-- <c:forEach items="${usBkList_r }" var="i"> --%>
    		<div class="card" style="width: 250px; display: inline-block; float: left; margin: 10px;">
            	<img src="https://cdn.discordapp.com/attachments/958566133752016903/966709570334523402/hotel7.jpg" class="card-img-top" alt="...">
	            <div class="card-body">
	              <h5 class="card-title"> ${bklist_r.cpName} </h5>
	              <p class="card-text">${bklist_r.cpAddress}</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item">${bklist_r.bkDate}</li>
	              <li class="list-group-item">${bklist_r.bkStatus}</li>
	            </ul>
	            <div class="card-body">
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a>
	            </div>
         	</div>
         	<%-- </c:forEach> --%>
	     </div>
	     
	     <!-- 네비 예약현황 : 예약 취소 -->
	     <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
  	  </div>
	</div>
	</div>	  
	</div>
	</article>
	
    
    
    <!-- 네비 리뷰 -->
    <article>
      <div id="c_reviewlist_info">
        리뷰 페이지로 이동
      </div>
    </article>
    
    <!-- 내 정보 관리 -->
    <article>
      <div id="c_mypage_info">
        마이페이지로 이동
      </div>
    </article>
    <!-- 내 정보 관리(내 정보 수정) : 손은진 -->
    <article>
        <div class="s_row">
      		<div id="c_us_info_edit_info">
			<form id="frm" method="post" action="">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>merong</td>
							<td>Larry the Bird</td>
							<td>@twitter</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>merong</td>
							<td>Larry the Bird</td>
							<td>@twitter</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>merong</td>
							<td>Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</article>
		<article>
			<div id="c_cplist_info" class="c_info_bgcolor">
				업체 조회 페이지로 이동
				<!-- 검색 -->

			</div>
		</article>
		<article>
			<div id="c_mapsc_info" class="c_info_bgcolor">
				<%@ include file="../view/map_api.jsp"%>
			</div>
		</article>
	</section>

	<script>
		/* 네비 선택시 */
		/* $("#c_mypage").click(function() {
			$("#c_mypage_info").show();
			$("#c_cplist_info").hide();
			$("#c_mapsc_info").hide();
			$("#c_notice_info").hide();
			$("#main_box").hide();
		});
		$("#c_notice").click(function() {
			$("#c_mypage_info").hide();
			$("#c_notice_info").show();
			$("#c_cplist_info").hide();
			$("#c_mapsc_info").hide();
			$("#main_box").hide();
		});
		$("#c_cplist").click(function() {
			$("#c_mypage_info").hide();
			$("#c_notice_info").hide();
			$("#c_mapsc_info").hide();
			$("#c_cplist_info").show();
			$("#main_box").hide();
		});
		$("#c_mapsc").click(function() {
			$("#c_mypage_info").hide();
			$("#c_notice_info").hide();
			$("#c_cplist_info").hide();
			$("#c_mapsc_info").show();
			$("#main_box").hide();
		}); */
		
		
		
	</script>


</body>
</html>