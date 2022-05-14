<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
</head>
<body>
	<div
			style="clear: both; height: 500px; background-image: url(https://www.gongbiz.kr/resources/static/assets/img/common/bg-img@2x.png); background-size: cover; color: white;">
			<div id="p_main_login">
				<div id="p_small_text">Welcome To JIWOODONG!</div>
				<div id="p_big_text">IT'S NICE TO MEET YOU</div>
				<div id="p_login_btn">
					 <!-- 로그인 여부에 따른 메뉴 변화 -->
        			<% if (session.getAttribute("password") == null) { %>
						<button type="button" id="login_btn" class="btn btn-primary btn-lg">
							<a href="loginMain">로그인</a>
						</button>
					<% } else { %>
						<button type="button" id="logout_btn" class="btn btn-primary btn-lg">
						 	<a href="logout">로그아웃</a>
						 </button>
      				 <% } %>
					<br>
					<% if (session.getAttribute("bu_id") != null && session.getAttribute("um_id") == null) { %>
					<button type="button" id="bum_mypage_btn" class="btn btn-secondary btn-sm">
						<%= session.getAttribute("buName") %>'s page
						</button>
					<% } else if(session.getAttribute("um_id") != null && session.getAttribute("bu_id") == null){ %>
					<button type="button" id="um_mypage_btn" class="btn btn-secondary btn-sm">
							 <%= session.getAttribute("umName") %>'s page
							 </button>
					 <% } %>
				</div>
			</div>
		</div>

	<section id="first_section">
		<div id="first_section_div1">
			<p class="color_yellow">지</p>
			<p class="first_section_p">금</p>
			<p class="color_yellow">우</p>
			<p class="first_section_p">리</p>
			<p class="color_yellow">동</p>
			<p class="first_section_p">네는</p>
			<p class="first_section_p2">우리 동네의 핫플레이스를</p>
			<p class="first_section_p2">한 눈에 확인하고 예약하세요!</p>
		</div>
	</section>
	<p style="padding-top: 80px;" id="about"></p>
	<p style="padding-top: 30px;" class="j_title">About</p>
	<section id="second_section">
		<div id="second_section_div1">
			<div data-aos="fade-left" style="margin: 0 auto; float: left;">
			<img style="float: left;" width="300px" src="https://cdn.discordapp.com/attachments/965916528350478386/970175050118484018/urbanbrush-20210424204040992630-removebg-preview.png">
			</div>
			<div data-aos="fade-right" style="float: right; height: 300px;">
			<p class="second_section_p2">비대면 시대에 맞춰</p>
			<p class="second_section_p2">온라인으로</p>
			<p class="color_blue">사업자와 사용자가 쉽게 소통</p>
			</div>
		</div>
	</section>
	<section id="third_section" style="clear: both;">
		<div id="third_section_div1">
			<div data-aos="fade-left" style="float: left; height: 300px;">
			<p class="third_section_p2">시간과 장소에 구애받지 않고</p>
			<p class="third_section_p2" style="display: inline-block;">클릭 한 번으로</p>
			<p class="color_blue" style="text-align: left; padding-left: 15px;">편하게 예약 가능</p>
			</div>
			<div data-aos="fade-right" style="margin: 0 auto; float: right;">
			<img style="float: left;" width="500px" src="https://cdn.discordapp.com/attachments/965916528350478386/970171076267106394/shutterstock_1502148890-removebg-preview.png">
			</div>
		</div>
	</section>
	<section id="fourth_section">
		<div id="fourth_section_div1">
			<div data-aos="fade-left" style="margin: 0 auto; float: left;">
			<img style="float: left;" width="300px" src="https://cdn.discordapp.com/attachments/965916528350478386/970176992148324372/web-20180113081439258486-removebg-preview.png">
			</div>
			<div data-aos="fade-right" style="float: right; height: 300px;">
			<p class="fourth_section_p2">실시간으로 예약현황을 확인하여</p>
			<p class="color_blue">고객의 예약 스케쥴 관리</p>
			</div>
		</div>
	</section>
	<!-- 이용 안내  -->
	<p style="padding-top: 80px;" id="service"></p>
	<p style="padding-top: 30px; clear: both;" class="j_title">Service</p>
    <section id="section1">
        <div id="j_explain" style="margin: 0 auto;">
            <div id="j_sl1" data-aos="fade-right" style="margin: 0 auto;">
                <p id="j_ex1">
                    <b>[사업자]</b> 업체 관리
                    <br>
                    A부터 Z까지
                    <br>
                    지우동의 <b>비즈니스</b> 서비스!
                </p>
                <p id="j_ex2">
                    <img src="https://cdn.discordapp.com/attachments/958566133752016901/966199476396126218/mac.png">
                </p>

            </div>

            <div id="j_sl2" data-aos="fade-left">
                <p id="j_ex3">
                    <b>[사용자]</b><br>
                    장소와 시간에 상관없이
                    <br>
                    <b>클릭</b> 한번으로
                    <br>
                    예약완료!
                </p>
                <p id="j_ex4">
                    <img src="https://cdn.discordapp.com/attachments/958566133752016901/966199476706492426/phone2.png">
                </p>
            </div>
            <div id="j_sl3" data-aos="fade-right" style="margin: 0 auto;">
                <p id="j_ex5">
                    처음이어도 누구나 쉽게 이용할 수 있는 서비스!
                </p>
                <p id="j_ex6">
                    <img src="https://cdn.discordapp.com/attachments/958566133752016901/966199477230776370/test1.png">
                </p>
            </div>
            <div id="j_sl4" data-aos="fade-left" style="margin: 0 auto; ">
                <p id="j_ex7">
                    <b>지우동</b>과 함께
                    <br>
                    유연한 스케줄관리를 해보세요!
                </p>
                <p id="j_ex8">
                    <img src="https://cdn.discordapp.com/attachments/958566133752016901/966199476131889172/jigu.png">
                </p>
            </div>
        </div>
    </section>
    <!-- 공지사항 -->
	<section style="background-color: #F9fafb;">
		<div style="margin: 0 auto; width: 1200px; padding: 30px 50px;">
			<p style="padding-top: 100px;" id="notice"></p>
			<p class="j_title">공지사항</p>
			<div>
				<table class="table table table-hover" style="clear: both;">
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${adnolist }" var="i">
							<tr style="cursor: pointer;" class="s_tr_readList">
								<th scope="row">${i.ntNo}</th>
								<td>${i.ntTitle}</td>
								<td>관리자</td>
								<td>${i.ntDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--업체 리스트-->
    <section style="margin-top: 50px;">
        <!--c_company slider -->
        <div class="c_company-slider">
            <h3 class="c_silder-title">업체리스트</h3>
            <div class="fas fa-chevron-left c_prev">〈</div>
            <div class="fas fa-chevron-right c_next">〉</div>
            <div class="c_company-wrapper">
                <!-- <div class="c_company">
                    <a href="#">
                        <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203806155157504/hotel.jpg"
                            class="c_slider-image">
                    </a>
                    <div class="c_company-info">
                        <h6 style="margin-top: 10px;"><a href="#"> 집 나가면 개고생 호텔 부산점 </a></h6>
                        <div class="far fa-user" style="height:10%;"> 부산광역시 해운대구 헌팅로 65길 31-2 </div>
                    </div>
                </div> -->
                <c:forEach items="${usCpList }" var="i">
                  <div class="c_company">
                    <a href="#">
                    	<c:if test="${empty i.flGno }">
                      <img src="https://economist.co.kr/resources/images/error/noimage.gif"
                        class="c_slider-image">
                        </c:if>
                        <c:if test="${not empty i.flGno }">
                      <img style="border-radius: 10px;" src="${i.flGno }"
                        class="c_slider-image">
                        </c:if>
                    </a>
                    <div class="c_company-info" style="text-align: center;">
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
                        <h6 style="margin-top: 10px;"><a href="#"> 샴푸 전문집 </a></h6>
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
    </section>
    <!--리뷰-->
    <section id="section3">
        <div class="j_review" style="">
            <h3 class="j_title">
                고객 이용 후기
            </h3>
            <div class="j_review_swiper">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                저는 지우동을 이용하는 김뽀삐 입니다.
                                평소에 전화울렁증이 있어서 왕왕 짖곤했는데
                                덕분에 이제 더 이상 짖지 않고
                                편하게 예약할 수 있게 되었어요!
                            </span>
                            <p>김뽀삐</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                안녕하세요 애숙이에요
                                지우동 덕분에 월 매출이 무진장 올랐네요ㅎㅎ
                                감사합니다 ^^
                            </span>
                            <p>애숙이</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                너무 잘 사용하고있어요~!!
                                메뉴 찾기도 너무 쉽고 디자인도 깔끔하고 보기 좋아요!
                                지금 우리 동네는 화이팅!!!
                            </span>
                            <p>까꼬뽀꼬</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                지금 우리 동네는..
                                경쟁 업체지만 아주 잘만들어진 사이트네요..
                                분하다..ㅠㅠ
                            </span>
                            <p>박정환</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                지우동을 만나고..
                                지우동의 서비스를 이용할 수 있어서..
                                다행이다...
                            </span>
                            <p>전승희</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                지우동 덕분에 코시국에도 흔들리지 않았어요 ^^ 정말 최고의 사이트 !
                            </span>
                            <p>야놀래말래</p>
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </section>
    <script>
	//사업자 마이페이지로 이동
		    $("#bum_mypage_btn").click(function() {
		    	location.href="BumMainPage";
		    });		
	//사용자 마이페이지로 이동
			    $("#um_mypage_btn").click(function() {
		    	location.href="UserMypage";
		    });	
			
	</script>
	
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

		// 링크로 넘기기
		location.href = "MainpageNoticeDetail?ntNo=" + tdArr[0];
	});
	</script>
    
</body>
</html>