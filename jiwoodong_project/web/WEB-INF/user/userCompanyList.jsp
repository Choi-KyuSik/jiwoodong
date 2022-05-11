<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/userCpList.css">

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

<title>지우동 업체조회</title>
</head>
<body>
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
									id="k_info_menu" href="#" role="button"> 마이페이지 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_review_menu" href="#" role="button"> 공지사항 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_bu_eroll_menu" href="#" role="button"> 리뷰 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 사진 </a>
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
									id="k_us_info_menu" href="#" role="button"> 지도 </a></li>
							</ul>
							<div>
								<form class="d-flex">
									<input class="form-control me-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-primary" type="submit">Search</button>
								</form>
							</div>
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
            style="width: 1200px; margin: 15px auto 0; background-color: rgb(241, 241, 241); border-radius: 15px;">
            <ul style="padding-top: 20px; padding-bottom: 20px;">
                <div style="width: 95%; background-color: white; border-radius: 15px; margin-left: 12px;">
                    <div style="padding: 45px 0 10px 40px; border-bottom: 2px solid silver;">
                        <h3 style="font-weight: 600;">지금 우리 동네는</h3>
                    </div>
					<!-- 	private String cpName;
							private String cpAddress;
							private String cpDTAdress;
							private String cpOpenTime;
							private String cpCloseTime;
							private String cpExplain;
							private int cpNo; -->
					<div style="padding-left: 35px;">
						<c:forEach items="${uscplist }" var="i">
	                    <li style="display: inline-block; width: 22%; margin: 20px 10px 40px 10px;">
	                        <div class="card" style="height: 410px;">
	                        <c:if test="${empty i.flGno }">
	                            <img width="235px;" height="200px;" src="https://economist.co.kr/resources/images/error/noimage.gif"
	                                class="card-img-top" alt="...">
	                         </c:if>
	                         <c:if test="${not empty i.flGno }">
	                            <img width="235px;" height="200px;" src="${i.flGno }"
	                                class="card-img-top" alt="...">
	                         </c:if>
	                            <table style="margin-top: 20px; margin-left: 10px;">
	                            	<tr>
	                            		<th colspan="3">
	                            			${i.cpName}
	                            		</th>
	                            	</tr>
	                            	<tr class="tr_list">
	                            		<td style="font-size: small;  padding-top: 25px;">${i.cpAddress} ${i.cpDTAddress} 
	                            		</td>
	                            		<td style="display: none;">${i.cpNo }</td>
	                            		<td>
                        			<input type="button" id="detailbtn" onclick="movepage()" class="btn btn-primary detailbtn" style="position: absolute; right: 15px; bottom: 15px;" value="자세히"/>
                       		 </td>
	                            	</tr>
	                            </table>
	                            <div class="card-body"  style=" height: 100px;">
	                            </div>
	                        </div>
	                    </li>
	                    </c:forEach>
	                </div>
                </div>
            </ul>
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
                        class="card-img-top" style="height: 250px;">
                        </c:if>
                        <c:if test="${not empty i.flGno }">
                      <img src="${i.flGno }"
                        class="card-img-top" style="height: 250px;">
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
	                        class="card-img-top" style="height: 250px;">
	                        </c:if>
	                        <c:if test="${not empty i.flGno }">
	                      <img src="${i.flGno }"
	                        class="card-img-top" style="height: 250px;">
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
							<td colspan="3"><p id="s_id_style">${usMemberListInfo.umId }</p>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary s_us_th" style="--bs-table-accent-bg: none;">아이디</th>
							<td colspan="2" class="table-light" id="s_us_no">
							<input type="text" class="form-control border_none" name="umId" readonly="readonly"
								value="${usMemberListInfo.umId }" /></td>
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
  </content>
    </section>
    
    <script>
    function movepage() {
    	
    	$(".tr_list").on("click", function(e){
    		/* location.href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=qbxlvnf11&logNo=221141017820"; */

    		// 배열 선언
    		var arr = new Array();
    		// 현재 클릭된 행(tr의 td)
    		var tr = $(this);
			console.log("tr : " + JSON.stringify(tr));
			console.log(tr);
			var td = tr.children();
			console.log("td : " + td.innertext);
			console.log(td);
			
    		
			// 반복문을 통해 배열에 값을 담아 사용
			td.each(function(i) {
				arr.push(td.eq(i).text().trim());
			});
			
			// td들이 배열에 담겨있는데 그 중 2번째가 필요
			console.log("arr : " + arr);
			console.log("arr[1] : " + arr[1]);
    		
			location.href="uscpdetail?cpNo=" + arr[1];
    	});
    }
    </script>
    
    	<script>
	$("#c_reviewlist").click(function() {
		console.log("안녕");
		$("#c_reviewlist_info").show();
		$("#c_reviewlist_info").load("userreviewlist");
	//var rvNo = $("#umId").val();
	//console.log("umId ? : " + umId);
	//console.log("umId 의 타입 ? : " + typeof (umId));
	// location.href = "userreviewlist";
});
	</script>

</body>
</body>
</html>