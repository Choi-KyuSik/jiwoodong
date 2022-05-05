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
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
	 <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	  <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
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
                      <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203806155157504/hotel.jpg"
                        class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                      <h6 style="margin-top: 10px;"><a href="#"> ${i.cpName } </a></h6>
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
              <table class="table" style="width: 100%; margin-top: 40px;">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">예약날짜</th>
                    <th scope="col">업체명</th>
                    <th scope="col">예약상태</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${usBkList }" var="i">
                  <tr>
                    <th scope="row">${i.rownum }</th>
                    <td>${i.bkDate }</td>
                    <td>${i.cpName }</td>
                    <td>${i.bkStatus }</td>
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
            <div id="c_inner_info">
              <p class="c_info_title">즐겨찾기 리스트</p>

            </div>
            <div id="c_inner_info_l" style="margin-bottom: 40px;">
              <p class="c_info_title">리뷰내역</p>
              <table class="table" style="width: 100%; margin-top: 40px;">
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
                <c:forEach items="${usRvList}" var="i">
                  <tr>
                    <th scope="row">${i.rownum}</th>
                    <td>${i.rvContent}</td>
                    <td>${i.rvWriteDate}</td>
                    <td>${i.umId}</td>
                    <td>${i.rvScore}</td>
                  </tr>
                </c:forEach>
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
        </div>

      </div>
    </div>

  <content>
  <!-- 네비 업체조회 -->
    <article>
      <div id="c_cplist_info">
        업체조회페이지로 이동
      </div>
    </article>
    
  <!-- 네비 공지사항 -->
    <article>
      <div id="c_maps_info">
        <p>주변검색</p>
      </div>
    </article>
    
    <!-- 네비 예약현황 -->
    <article>
      <div id="c_bklist_info">
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
  	$("#umPwd").keyup(function() {
  		// console.log("db에 있는 pwd 확인" + ${uvo.umPwd});
  		var db_pwd = "${usMemberListInfo.umPwd}";
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
  </script>
  
  <!-- 네비바 클릭시 페이지 이동 -->
	<script>
    	$("#c_cplist").click(function(){
    		/* location.href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=qbxlvnf11&logNo=221141017820"; */
    		location.href="uscplist";
    	})
    </script>
    
  <!-- <script>
	$("#p_top_logo").click(function () {
	 	console.log("찍히냐? mypage");
	  href="UserMypage"
	});
	
    $("#c_cplist").click(function () {
    	console.log("찍히냐? mypage");
      href="uscplist"
    });
    $("#c_maps").click(function () {
    	console.log("찍히냐? c_maps");
      $("#c_cplist_info").hide();
      $("#c_maps_info").show();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    });
    $("#c_bklist").click(function () {
    	console.log("찍히냐? c_bklist");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").show();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    });
    $("#c_reviewlist").click(function () {
    	console.log("찍히냐? c_reviewlist");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").show();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    }); 
    $("#c_us_info_edit").click(function () {
    	console.log("찍히냐? c_us_info_edit");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      // $("#c_us_info_edit_info").show();
      $("#main_box").hide();
      $(".s_row").show();
    }); 
    $("#c_us_delete").click(function () {
    	console.log("찍히냐? c_us_delete");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
    });
    $("#s_row").click(function () {
    	console.log("찍히냐? s_row");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").show();
      $("#main_box").hide();
    });
    $("#c_mypage").click(function () {
    	console.log("찍히냐? mypage");
    	location.reload();
    }); -->
    
  </script>

  
 
</body>
</html>