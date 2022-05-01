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

<title>사용자 마이페이지</title>
</head>
<body>
	<header>
            <div id="p_main_top">
              <div id="p_top_logo">
                <a href="" id="k_logo"><img
                    src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png" width="80px"
                    alt="logo">
                </a>
              </div>
              <div id="p_top_menu">
                <nav class="navbar navbar-expand-lg">
                  <div class="container-fluid">
                    <div class="collapse navbar-collapse">
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown" id="k_info_menu" href="#" role="button">
                            마이페이지
                          </a>
                        </li>
                      </ul>
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown" id="k_review_menu" href="#" role="button">
                            공지사항
                          </a>
        
                        </li>
                      </ul>
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown" id="k_bu_eroll_menu" href="#" role="button">
                            예약현황
                          </a>
                        </li>
                      </ul>
                      
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown" id="k_us_info_menu" href="#" role="button">
                            리뷰
                          </a>
                        </li>
                      </ul>
                      <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            내 정보 관리
                          </a>
                          <ul class="dropdown-menu dropdown-menu">
                            <li><a class="dropdown-item" id="k_re_menu_enroll" href="#">내 정보 수정</a></li>
                            <li>
                              <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" id="k_re_cu_menu" href="#">회원 탈퇴</a></li>
                          </ul>
                        </li>
                      </ul>
                <!-- 검색바
                    <div>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-primary" type="submit">Search</button>
                        </form>
                    </div> -->
                    </div>
                  </div>
                </nav>
              </div>
              <div style="float: right; margin: 0 30px 0 0;">
                <div class="dropdown text-end" id="p_top_profile">
                  <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                    data-bs-toggle="dropdown">
                    <img src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png" alt="mdo"
                      style="width: 60px;">
                  </a>
                  <p style="font-size: 12px; width: 115px; margin: 5px;">사용자ID</p>
                  <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
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
    
        <section>
            <div class="c_main_box">
                <div class="c_outline">
                    <div id="c_inner_info_l">
                        <p class="c_info_title">이용 매장</p>
                        <div class="c_company-slider">
                            <div class="fas fa-chevron-left c_prev">〈</div>
                            <div class="fas fa-chevron-right c_next">〉</div>
                            <div class="c_company-wrapper">
                                <div class="c_company">
                                    <a href="#">
                                        <img src="https://cdn.discordapp.com/attachments/958682757230366780/966203806155157504/hotel.jpg"
                                            class="c_slider-image">
                                    </a>
                                    <div class="c_company-info">
                                        <h6 style="margin-top: 10px;"><a href="#"> 집 나가면 개고생 호텔 부산점 </a></h6>
                                        <div class="far fa-user" style="height:10%;"> 부산광역시 해운대구 헌팅로 65길 31-2 </div>
                                    </div>
                                </div>
                                <div class="c_company">
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
                                </div>
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
                                <tr>
                                    <th scope="row">1</th>
                                    <td>2022-04-01</td>
                                    <td>투썸벅스</td>
                                    <td>이용완료</td>
                                </tr>
                                <tr>
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
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="c_inner_info">
                        <p class="c_info_title">즐겨찾기 리스트</p>
                        
                    </div>
                    <div id="c_inner_info_l">
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
                                <tr>
                                    <th scope="row">1</th>
                                    <td>제목</td>
                                    <td>리뷰내용</td>
                                    <td>아이디</td>
                                    <td>별점</td>
                                </tr>
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
                    </div>
                </div>
            </div>
        </section>

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
</body>
</html>