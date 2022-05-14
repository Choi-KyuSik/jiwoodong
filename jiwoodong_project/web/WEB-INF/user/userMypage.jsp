<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">

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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!--이용매장 슬라이더-->
	
	<script>
        $(document).ready(function () {
            $('.c_company-wrapper').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                nextArrow: $('.c_next'),
                prevArrow: $('.c_prev'),
            });
        });
    </script>

<title>사용자 마이페이지</title>
</head>
<body>
	<div>
		<%@ include file="../view/user/user_header.jsp"%>
	</div>
	<section style="height: 100%;">
    <div id="main_box" style="background-color: rgb(241, 241, 241); border-radius: 15px;">
      <div style="padding: 10px 0 10px 0;">

        <div class="c_main_box">
          <div class="c_outline">
            <div id="c_inner_info_l">
              <p class="c_info_title">이용 매장</p>
              <div class="c_company-slider">
                <div class="fas fa-chevron-left c_prev">〈</div>
                <div class="fas fa-chevron-right c_next">〉</div>
                <div class="c_company-wrapper">
                <c:forEach items="${usCpList }" var="i">
                  <div class="c_company">
                    <a href="#">
                    	<c:if test="${empty i.flGno }">
                      <img src="https://media.discordapp.net/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png?width=1358&height=1358"
                        class="c_slider-image">
                        </c:if>
                        <c:if test="${not empty i.flGno }">
                      <img style="border-radius: 10px;" src="${i.flGno }"
                        class="c_slider-image">
                        </c:if>
                    </a>
                    <div class="c_company-info">
                      <p style="margin-top: 20px; font-weight: bold; font-size: 1.5em">${i.cpName }</p>
                      <div class="far fa-user" style="height:10%;"> ${i.cpAddress } ${i.cpDtaddress } </div>
                    </div>
                  </div>
                  </c:forEach>
                  <!-- <div class="c_company">
                    <a href="#">
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203805815431238/hair.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> 너나 나나 빡빡머리 </a></h6>
                      <div class="far fa-user" style="height:10%;"> 인천광역시 동구 바리깡로 483번길 39-1</div>
                    </div>
                  </div>
                  <div class="c_company">
                    <a href="#">
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203805538590771/cafe.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> 투썸벅스 </a></h6>
                      <div class="far fa-user" style="height:10%;"> 서울특별시 강남구 원두로 84번길 </div>
                    </div>
                  </div>
                  <div class="c_company">
                    <a href="#">
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203805815431238/hair.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> 샴푸 전문점 </a></h6>
                      <div class="far fa-user" style="height:10%;">서울특별시 강서구 샴푸길 12-327길 </div>
                    </div>
                  </div>
                  <div class="c_company">
                    <a href="#">
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203806155157504/hotel.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> 쉬었다 갈래 호텔 </a></h6>
                      <div class="far fa-user" style="height:10%;"> 경기도 김포시 피곤로 24길 11-4 </div>
                    </div>
                  </div>
                  <div class="c_company">
                    <a href="#">
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203805538590771/cafe.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> 카페 이름이 뭐였지? </a></h6>
                      <div class="far fa-user" style="height:10%;"> 서울특별시 서초구 콜드브루로 1번길 </div>
                    </div>
                  </div> -->
                </div>
              </div>
            </div>
            <div id="c_inner_info">
              <p class="c_info_title">예약현황</p>
              <table class="table" style="width: 100%; margin-top: 30px;">
                <thead>
                  <tr>
                    <th scope="col" class="c_info_center">No</th>
                    <th scope="col" class="c_info_center">예약날짜</th>
                    <th scope="col" class="c_info_center">예약시간</th>
                    <th scope="col" class="c_info_center">업체명</th>
                    <th scope="col" class="c_info_center">예약상태</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${usBkList }" var="i">
                  <tr>
                    <th scope="row" class="c_info_ct_ftsz">${i.rownum }</th>
                    <td class="c_info_center c_info_ct_ftsz">${i.bkDate }</td>
                    <td class="c_info_center c_info_ct_ftsz">${i.bkTime }</td>
                    <td class="c_info_center c_info_ct_ftsz">${i.cpName }</td>
                    <td class="c_info_center c_info_ct_ftsz">${i.bkStatus }</td>
                  </tr>
                  </c:forEach>
                  <!-- <tr>
                    <th scope="row">2</th>
                    <td>2022-04-08</td>
                    <td>샴푸 전문점</td>
                    <td>예약취소</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>2022-04-29</td>
                    <td>샴푸 전문점</td>
                    <td>이용중</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>2022-05-05</td>
                    <td>집 나가면 개고생</td>
                    <td>예약완료</td>
                  </tr> -->
								</tbody>
							</table>
						</div>
						<!-- 리뷰내역  -->
						<div id="c_inner_info">
							<p class="c_info_title">리뷰내역</p>
							<table class="table" style="width: 100%; margin-top: 30px; table-layout: fixed;">
								<thead>
									<tr>
										<th style="width: 50px;" scope="col" class="c_info_center">No</th>
										<th scope="col" class="c_info_center">내용</th>
										<th scope="col" class="c_info_center">업체명</th>
										<th scope="col" class="c_info_center">별점</th>
										<th scope="col" class="c_info_center">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${usRvList}" var="i">
										<tr>
											<th scope="row" class="c_info_center short c_info_ct_ftsz">${i.rownum}</th>
											<td class="short c_info_ct_ftsz">${i.rvContent}</td>
											<td class="c_info_center short c_info_ct_ftsz">${i.cpName}</td>
											<td class="c_info_center" style="font-size: .8em;">${i.rvScore}</td>
											<td class="c_info_center c_info_ct_ftsz">${i.rvWriteDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<%-- <div id="c_inner_info_l" style="margin-bottom: 40px;">
              <p class="c_info_title">리뷰내역</p>
              <table class="table" style="width: 100%; margin-top: 40px;">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
		    <th scope="col">업체명</th>
                    <th scope="col">별점</th>
                    <th scope="col">작성일자</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${usRvList}" var="i">
                  <tr>
                    <th scope="row">${i.rownum}</th>
                    <td>${i.rvContent}</td>
                    <td>${i.cpName}</td>
                    <td>${i.rvScore}</td>
                    <td>${i.rvWriteDate}</td>
                  </tr>
                </c:forEach>
                  <tr>
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
                  </tr>
                </tbody>
              </table>
            </div> --%>
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
    		<div class="card" style="width: 300px; height: 540px; display: inline-block; float: left; margin: 10px; border-radius: 15px;">
    		<c:if test="${empty i.flGno }">
    		<!-- https://hk-clean.co.kr/images/no_image.jpg 대체이미지 -->
                      <img src="https://media.discordapp.net/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png?width=1358&height=1358"
                        class="card-img-top" style="height: 250px; border-radius: 15px;">
                        </c:if>
                        <c:if test="${not empty i.flGno }">
                      <img src="${i.flGno }"
                        class="card-img-top" style="height: 250px; border-radius: 15px;">
                        </c:if>
            	<%-- <img src="${i.flGno }" class="card-img-top" alt="..."> --%>
	            <div class="card-body">
	            	<input type="hidden" id="umId" name="umId" value="${umId }"/>
	              <h5 class="card-title" style="font-weight: bold;font-size: 1.5em;"> ${i.cpName} </h5>
	              <p class="card-text">${i.cpAddress}</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item">예약날짜 : ${i.bkDate}</li>
	              <li class="list-group-item">예약시간 : ${i.bkTime}</li>
	              <li class="list-group-item" style="color: blue;">${i.bkStatus}</li>
	            </ul>
	            <div class="card-body">
	            <form id="frm">
	              <!-- <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
	              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a> -->
			   <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="rv_btn">리뷰작성</button></a>
	            <span><button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop_u" id="bkupdata_btn_btn">변경</button></span>
	            <!-- 예약 변경 모달창 -->
		    	 <div class="modal fade" id="staticBackdrop_u" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">예약변경</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        예약을 변경하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				
	            <span><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="bkcancle_btn">취소</button></span>
	            <!-- 예약 취소 모달창 -->
		    	 <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">예약취소</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        예약을 취소하시겠습니까?
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="c_cancle_btn">취소</button>
				        <button type="button" class="btn btn-primary"  id="c_check_btn">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				</form>
	            </div>
         	</div>
         	</c:forEach>
    	 </div>
    	 
	     
    	 
    	
	     <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
	     	<!-- 네비 예약현황 : 예약 취소 -->
	          <c:forEach items="${usBkList_c }" var="i">
	    		<div class="card" style="width: 300px; height: 540px; display: inline-block; float: left; margin: 10px;">
	    		<c:if test="${empty i.flGno }">
	    		<!-- https://hk-clean.co.kr/images/no_image.jpg 대체이미지 -->
	                      <img src="https://media.discordapp.net/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png?width=1358&height=1358"
	                        class="card-img-top" style="height: 250px;">
	                        </c:if>
	                        <c:if test="${not empty i.flGno }">
	                      <img src="${i.flGno }"
	                        class="card-img-top" style="height: 250px;">
	                        </c:if>
	            	<%-- <img src="${i.flGno }" class="card-img-top" alt="..."> --%>
		            <div class="card-body">
		            	<input type="hidden" id="umId" name="umId" value="${umId }"/>
		              <h5 class="card-title" style="font-weight: bold;font-size: 1.5em;"> ${i.cpName} </h5>
		              
		              <p class="card-text">${i.cpAddress}</p>
		            </div>
		            <ul class="list-group list-group-flush">
		              <li class="list-group-item">예약날짜 : ${i.bkDate}</li>
		              <li class="list-group-item">예약시간 : ${i.bkTime}</li>
		              <li class="list-group-item" style="color: #dc3545;" >${i.bkStatus}</li>
		            </ul>
		            <div class="card-body">
		              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary" id="bkupdata_btn">변경</button></a>
		              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger"  id="bkcancle_btn">취소</button></a>
		            </div>
	         	</div>
	         	</c:forEach>
	         	<c:if test="${empty usBkList_c }">
	         	<p style="margin: 50px 0 0 100px; font-size: 16px; font-weight: 700; text-align: center; width: 800; height: 500px;"> 
	         	예약 취소 내역이 없습니다. </p>
	         	</c:if>
	     </div>
  	  </div>
	</div>
	</div>	  
	</div>
	</article>
	
    
    
      <!-- <div id="c_bklist_info">
        <div id="c_inner_info_l" style="height: 920px;">
          <div class="card" style="width: 250px; display: inline-block; float: left; margin: 10px;">
            <img src="https://cdn.discordapp.com/attachments/958566133752016903/966709570334523402/hotel7.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title"> 잠죽자 호텔 </h5>
              <p class="card-text">서울특별시 강서구 154-1</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">2022-05-05</li>
              <li class="list-group-item">이용전</li>
            </ul>
            <div class="card-body">
              <a href="#" class="card-link"><button type="button" class="btn btn-outline-secondary">변경</button></a>
              <a href="#" class="card-link"><button type="button" class="btn btn-outline-danger">취소</button></a>
            </div>
          </div>
        </div>
      </div> --> 
      <!-- 네비 리뷰 -->
		<article>
			<div id="c_reviewlist_info">
				<div style="text-align: center;">
					<p style="font-size: 2em; font-weight: bold;" id="k_review_menu" href="#">리뷰 조회</p>
				</div>
				<%--  <table class="table table table-hover"
					style="clear: both; table-layout: fixed;">
					<thead>
						<tr>
							<th style="display: none;" scope="col" class="s_center">No</th>
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
									 <input type="hidden" id="umId" name="umId" value="${umId}"/>
								</tr>
			                </c:forEach>
					</tbody>
				</table> --%>
			</div>
		</article>

		<!-- 내 정보 관리 -->
		<article>
			<div id="c_mypage_info">마이페이지로 이동</div>
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
									<td colspan="3"><p id="s_id_style">${um_id }</p>님의 정보를
										안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="table-primary s_us_th"
										style="--bs-table-accent-bg: none;">아이디</th>
									<td colspan="2" class="table-light" id="s_us_no"><input
										type="text" class="form-control border_none" name="umId"
										readonly="readonly" value="${um_id }" /></td>
								</tr>
								<tr>
									<th class="table-primary s_us_th"
										style="vertical-align: middle;">비밀번호</th>
									<td class="table-light" id="s_us_pwd"><input
										type="password" class="form-control" name="umPwd" id="umPwd"
										value="" placeholder="비밀번호를 입력해주세요." /></td>
									<td class="table-light" id="s_us_notice"><span
										id="s_us_pwd_check" style="display: none;">현재 비밀번호가
											일치하지 않습니다.</span></td>
								</tr>
							</tbody>
						</table>
						<div id="s_us_info_btn">
							<input type="button" id="s_us_check_btn"
								class="btn btn-primary pull-right s_ad_nt_btn" value="확인">
							<input type="button" id="back_btn"
								class="btn btn-secondary pull-right s_ad_nt_btn" value="취소">
						</div>
					</form>
				</div>
			</div>
		</article>
		</content>
	</section>
	
	<script>
		$("#c_bklist").click(function(){
			var umId = $("#umId").val();
			console.log("umId : " + umId);
		});
		
	</script>
	
<!--  	<script>
		$("#k_review_menu").click(function() {
			//var rvNo = $("#umId").val();
			//console.log("umId ? : " + umId);
			//console.log("umId 의 타입 ? : " + typeof (umId));
			location.href = "userreviewlist";
		});
	</script>  -->
  <script>
  	$("#umPwd").keyup(function() {
  		// console.log("db에 있는 pwd 확인" + ${uvo.umPwd});
  		var db_pwd = "${password}";
  		console.log(db_pwd);
  		var check_pwd = $("#umPwd").val();
  		
  		if(db_pwd == "" || check_pwd == "") {
  			$("#s_us_pwd_check").css('display', 'inline-block');
  			$("#s_us_pwd_check").text('');
  		} else if(db_pwd != check_pwd) {
  			console.log("비밀번호가 일치하지 않습니다.");
  			$("#s_us_pwd_check").css('display', 'inline-block');
  			$("#s_us_pwd_check").text('비밀번호가 일치하지 않습니다.');
			$("#s_us_pwd_check").css('color', 'red');
  		} else {
  			console.log("비밀번호가 일치합니다.");
  			$("#s_us_pwd_check").css('display', 'inline-block');
  			$("#s_us_pwd_check").text('비밀번호가 일치합니다.');
  			$("#s_us_pwd_check").css('color', 'green');
  		}
  	});
  	
  	$("#back_btn").click(function() {
  		location.href="UserMypage";
  	});
  	
  	$("#s_us_check_btn").click(function() {
  		var txt = $("#s_us_pwd_check").text();
  		
  		if(txt == '비밀번호가 일치합니다.') {
  			$("#s_us_pwd_check").text('');
  			var frm = $("#frm");
  			frm.attr("action", "UserInfoUpdate");
  			frm.attr("method", "post");
  			frm.submit();
  		} else {
  			alert("비밀번호가 일치하지 않습니다.");
  			$("#s_us_pwd_check").css('display', 'none');
  			$("#umPwd").val("");
  			$("#umPwd").focus();
  		}
  	});
  	/* 리뷰작성 버튼 클릭시 */
  	$("#rv_btn").click(function() {
  		location.href="userRvWrite";
  	});
  	
  	/* 예약변경 버튼 클릭시 */
  	/* $("#bkupdata_btn").click(function() {
  		location.href="";
  	}); */
  	
  	/* 예약취소 버튼 클릭시 */
  	/* $("#bkcancle_btn").click(function() {
  		location.href="";
  	});
  	 */
  	
  </script>
  
  <!-- 네비바 클릭시 페이지 이동 -->
	<script>
		$("#k_review_menu").click(function() {
			//var rvNo = $("#umId").val();
			//console.log("umId ? : " + umId);
			//console.log("umId 의 타입 ? : " + typeof (umId));
			location.href = "userreviewlist";
		});
		$("#c_cplist").click(function() {
			/* location.href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=qbxlvnf11&logNo=221141017820"; */
			location.href = "uscplist";
		})
		$("#c_mypage").click(function() {
			console.log("찍히냐? mypage");
			location.reload();
		});
	</script>
	
	<script>
	$("#c_cancle_btn").click(function(){
		history.back();
	})
	
	/* $("#c_check_btn").click(function(){
		console.log("삭제버튼");
		var frm = $("#frm");
		frm.attr("action","UserBookingCancle");
		frm.attr("method","post");
		frm.submit();
	}) */
	
	</script>
	
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