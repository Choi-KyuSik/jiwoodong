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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56f933d730edd6925940403e2568524b&libraries=services"></script>
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
						<c:forEach items="${uscpdetail }" var="i">
						<div style="text-align: center;">
							<a href="#" style="text-align: center;"> 
							<c:if test="${empty i.flGno }">
							<img src="https://hk-clean.co.kr/images/no_image.jpg"
								alt="" style="width: 400px; height: 300px; margin: 30px;">
								</c:if>
							<c:if test="${not empty i.flGno }">
							<img src="${i.flGno }" alt="" style="width: 400px; height: 300px; margin: 30px;">
							</c:if>
							</a>
						</div>
						<div style="margin-bottom: 20px; text-align: center;">
						
							<p style="font-weight: bold; font-size: 1.5em;">${i.cpName }</p>
								  <c:if test="${not empty uscpRvscoreAVG.rvScore }">
							<div><span>💙 ${uscpRvscoreAVG.rvScore } / 5.0</span></div>
								</c:if>
								<c:if test="${empty uscpRvscoreAVG.rvScore }">
								<div><span>💙 0.0 / 5.0</span></div>
								</c:if>
							<input type="hidden" id="cpNo" name="cpNo" value="${i.cpNo }"/>
							<div>
								<span><button id="s_us_reservation_btn" class="btn btn-primary" href="#"
									style="width: 300px;">예약하기</button></span>
							</div>
						</div>
						</c:forEach>

						<hr style="margin: 0;">

						<div id="s_us_content_box" style="width: 900px;">
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
											<th class="c_home_info">업종</th>
											<td class="c_home_info_td">${i.cpCategory }</td>
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
											<th class="c_home_info">운영요일</th>
											<td class="c_home_info_td">${i.cpClassify }</td>
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
											
											<tbody>
												<c:forEach items="${uscpRvList }" var="i">
												<tr>
													<th scope="row">${i.rownum}</th>
													<td>${i.rvContent }</td>
													<td>${i.rvWriteDate }</td>
													<td>${i.umId }</td>
													<td>${i.rvScore }</td>
												</tr>
												</c:forEach>
												<c:if test="${empty test}">
													<tr><td colspan="5" style="text-align: center">등록된 리뷰가 없습니다.</td></tr>
													</c:if>
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
											
										</table>
									</div>
								</div>
								<!--사진 탭 내용-->
								<div class="tab-pane fade" id="c_img" role="tabpanel"
									aria-labelledby="c_img-tab">
									<ul class="c_img_list">
										<div style="margin: 30px 0;">
										<c:forEach items="${uscpdetail }" var="i">
											
											<c:if test="${empty i.flGno }">
												<li class="c_img_box">
												<div>
												<img
													src="https://economist.co.kr/resources/images/error/noimage.gif"
													class="c_img" alt="">
												</div>
												</li>
											</c:if>
											<c:if test="${not empty i.flGno }">
											<li class="c_img_box">
												<div>
												<img src="${i.flGno }" class="c_img" alt="">
											</div>
											</li>
													<c:if test="${not empty i.flGno2 }">
														<li class="c_img_box">
														<div>
														<img src="${i.flGno2 }" class="c_img" alt="">
														</div>
														</li>
													</c:if>
													<c:if test="${not empty i.flGno3 }">
														<li class="c_img_box">
														<div><img src="${i.flGno3 }" class="c_img" alt=""></div></li>
													</c:if>
											</c:if>
											
											
											</c:forEach>
											<!-- <li class="c_img_box">
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
											</li> -->
										</div>
									</ul>
								</div>

								<!--지도 탭 내용-->
								<div class="tab-pane fade" id="c_map" role="tabpanel"
									aria-labelledby="c_map-tab">
									<div id="u_map_content" style="padding: 50px 0 50px 0; height: 700px; margin-top: 30px; width: 900px;">
										<!-- <div id="u_map_content2" style="width: 100%; height: 350px;"></div> -->
	
										<!-- <script type="text/javascript"
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
										</script> -->
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
    <div style="padding: 30px; border-radius: 15px; background-color: white;">
      <div class="d-flex align-items-start">
  		<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    		<button class="nav-link active" id="v-pills-home-tab" style="width: 100px;" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">예약완료</button>
    		<button class="nav-link" id="v-pills-profile-tab" style="width: 100px;" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">예약취소</button>
  		</div>
  	  <div class="tab-content" id="v-pills-tabContent">
		<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
		<!-- 네비 예약현황 : 예약 완료 -->
		<c:forEach items="${bklist_r }" var="i">
    		<div class="card" style="width: 300px; height: 540px; display: inline-block; float: left; margin: 10px;">
    		<c:if test="${empty i.flGno }">
    		<!-- https://hk-clean.co.kr/images/no_image.jpg 대체이미지 -->
                      <img src="https://media.discordapp.net/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png?width=1358&height=1358"
                        class="card-img-top" style="height: 260px;">
                        </c:if>
                        <c:if test="${not empty i.flGno }">
                      <img src="${i.flGno }"
                        class="card-img-top" style="height: 270px;">
                        </c:if>
            	<%-- <img src="${i.flGno }" class="card-img-top" alt="..."> --%>
	            <div class="card-body">
	            	<input type="hidden" id="umId" name="umId" value="${umId }"/>
	              <h5 class="card-title"> ${i.cpName} </h5>
	              <p class="card-text">${i.cpAddress}</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item">${i.bkDate}</li>
	              <li class="list-group-item">${i.bkStatus}</li>
	            </ul>
	            <div class="card-body">
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a>
	            </div>
         	</div>
         	</c:forEach>
    	 </div>
    	
	     <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
	     	<!-- 네비 예약현황 : 예약 취소 -->
	          <c:forEach items="${bklist_c }" var="i">
	    		<div class="card" style="width: 300px; height: 540px; display: inline-block; float: left; margin: 10px;">
	    		<c:if test="${empty i.flGno }">
	    		<!-- https://hk-clean.co.kr/images/no_image.jpg 대체이미지 -->
	                      <img src="https://media.discordapp.net/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png?width=1358&height=1358"
	                        class="card-img-top" style="height: 260px;">
	                        </c:if>
	                        <c:if test="${not empty i.flGno }">
	                      <img src="${i.flGno }"
	                        class="card-img-top" style="height: 270px;">
	                        </c:if>
	            	<%-- <img src="${i.flGno }" class="card-img-top" alt="..."> --%>
		            <div class="card-body">
		            	<input type="hidden" id="umId" name="umId" value="${umId }"/>
		              <h5 class="card-title"> ${i.cpName} </h5>
		              <p class="card-text">${i.cpAddress}</p>
		            </div>
		            <ul class="list-group list-group-flush">
		              <li class="list-group-item">${i.bkDate}</li>
		              <li class="list-group-item">${i.bkStatus}</li>
		            </ul>
		            <div class="card-body">
		              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
		              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a>
		            </div>
	         	</div>
	         	</c:forEach>
	         	<c:if test="${empty bklist_c }">
	         	<p style="margin: 50px 0 0 100px; font-size: 16px; font-weight: 700; text-align: center; width: 800; height: 500px;"> 
	         	예약 취소 내역이 없습니다. </p>
	         	</c:if>
	     </div>
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
							<th colspan="3" style="font-size: 2em;">회원정보확인</th>
						</tr>
						<tr>
							<td colspan="3"><p id="s_id_style">${um_id }</p>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">아이디</th>
							<td colspan="2" class="table-light" id="s_us_no">
							<input type="text" class="form-control border_none" name="umId" readonly="readonly"
								value="${um_id }" /></td>
						</tr>
						<tr>
							<th class="table-primary s_us_th" style="vertical-align: middle;">비밀번호</th>
							<td class="table-light" id="s_us_pwd">
							<input type="password" class="form-control" name="umPwd" id="umPwd"
								value="" placeholder="비밀번호를 입력해주세요."/></td>
							<td class="table-light" id="s_us_notice">
							<span id="s_us_pwd_check" style="display: none;">현재 비밀번호가 일치하지 않습니다.</span></td>
						</tr>
					</tbody>
				</table>
				<div id="s_us_info_btn">
				<input type="button" id="s_us_check_btn" class="btn btn-primary pull-right s_ad_nt_btn" value="확인">
				<input type="button" id="back_btn" class="btn btn-secondary pull-right s_ad_nt_btn" value="취소">
				</div>
			</form>
		</div>
      </div>
    </article>
		<article>
			<div id="c_cplist_info" class="c_info_bgcolor">
				업체 조회 페이지로 이동
				<!-- 검색 -->

			</div>
		</article>
		<article>
			<%-- <div id="c_mapsc_info" class="c_info_bgcolor">
				<%@ include file="../view/map_api.jsp"%>
			</div> --%>
		</article>
	</section>

	<script>
	/* $("#c_riview-tab").click(function(){
		location.href = "usercpdetailreview";
		 var cpNo = $("#cpNo").val(); 
	}); */
	</script>
	

	<script>
		$("#c_map-tab").click(function() {
			$("#u_map_content").load("UserMapAPI");
			// $("#s_us_content_box").load("UserMapAPI");
		});
	</script>
	
	<script>
		$("#s_us_reservation_btn").click(function() {
			// TODO
			// 1. cpNo 값에 따라 UserReservation페이지 cpNo에 맞게 띄우기
			var cpNo = $("#cpNo").val();
			console.log(cpNo);
			// 2. 업종 값 가져와서 업종이 어떤거냐에 따라 들어가는 jsp가 다름
			location.href="UserReservation?cpNo=" + cpNo;
		});
	</script>

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