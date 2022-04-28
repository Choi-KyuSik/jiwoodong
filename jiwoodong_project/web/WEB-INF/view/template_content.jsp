<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <!-- 이용 안내  -->
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
        <div style=" margin: 0 auto; width: 1200px; padding: 30px 50px;">
            <div>
                <span style="color: #0072bb; text-align: center; margin-bottom: 30px;display: block;">
                    <h3 style="font-size: 30px;">공지사항</h3>
                </span>
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
                        <tr>
                            <th scope="row">1</th>
                            <td><a href="#">서비스 점검 예정(4/20)</a></td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td><a href="#">지우동 주문 POS 위젯 장애 안내</a></td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td><a href="#">잘 되는 매장의 전략 교육 OPEN!</a></td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td><a href="#">서비스 점검 예정(4/20)</a></td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td><a href="#">서비스 점검 예정(4/20)</a></td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
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
                </div>
            </div>
        </div>
    </section>
    <!--리뷰-->
    <section>
        <div class="j_review" style="margin: 0 auto;">
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
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                안녕하세요 애숙이에요
                                지우동 덕분에 월 매출이 무진장 올랐네요ㅎㅎ
                                감사합니다 ^^
                            </span>
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                너무 잘 사용하고있어요~!!
                                메뉴 찾기도 너무 쉽고 디자인도 깔끔하고 보기 좋아요!
                                지금 우리 동네는 화이팅!!!
                            </span>
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                지금 우리 동네는..
                                경쟁 업체지만 아주 잘만들어진 사이트네요..
                                분하다..ㅠㅠ
                            </span>
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                지우동을 만나고..
                                지우동의 서비스를 이용할 수 있어서..
                                다행이다...
                            </span>
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                    <li class="swiper-slide">
                        <div class="j_comment">
                            <span>
                                저는 지우동을 이용하는 김뽀삐 입니다.
                                평소에 전화울렁증이 있어서 왕왕 짖곤했는데
                                덕분에 이제 더 이상 짖지 않고
                                편하게 예약할 수 있게 되었어요!
                            </span>
                            <p>작성자, 작성일</p>
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </section>
</body>
</html>