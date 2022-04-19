<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>관리자 메인페이지</title>
</head>
<body>
    <!--기본 set-->
    <style>
        * {
            padding: 0;
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
        }

        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            color: blue;
        }

        li {
            list-style-type: none;
        }
    </style>
        <!--header-->
    <style>
        .navbar-nav {
            margin-left: 30px;
            padding-bottom: 20px;
        }

        .dropdown-toggle,
        .dropdown {
            font-weight: bold;
        }
    </style>
    <!--section-->
    <style>
        #main_box {
            width: 1200px;
            height: 1000px;
            margin: 0 auto;
            margin-top: 20px;
            /* background-color: rgb(228, 226, 226); */
        }

        #s_bu_statistics,
        #s_bu_accept_list {
            text-align: center;
            width: 550px;
            height: 500px;
            background-color: white;
            border-radius: 30px;
            margin: 40px 10px;
            padding: 20px 30px;
        }

        #s_ad_notice {
            text-align: center;
            width: 1120px;
            height: 500px;
            background-color: white;
            border-radius: 30px;
            margin: 10px;
            padding: 20px 30px;
            margin: 10px 10px 40px;
        }

        .nav_tab_div {
            background-color: rgba(241, 241, 241);
            width: 1200px;
            margin: 10px 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            border-radius: 15px;
        }
    </style>
    <!-- 통계 -->
    <style>
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 320px;
            max-width: 660px;
            margin: 1em auto;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>
</head>

<body>
    <header style="margin-top: 10px;">
        <div id="p_main_top" style="width: 1200px; margin: 0 auto; border-bottom: 2px solid silver;">
            <div style="float: right;">
                <p style="font-size: 10px; margin: 25px 30px 0 10px;">환영합니다 손은진님</p>
                <a href="" style="font-size: 14px; margin: 0 0 0 30px; color: red; font-weight: bold;">로그아웃</a>
            </div>
            <div id="p_top_logo" style="float: left; margin: 0 0 0 30px;">
                <a href=""><img
                        src="https://media.discordapp.net/attachments/958566133752016901/960910113219178597/1.png"
                        width="80px" alt="logo" id="logo"></a>
            </div>
            <div style="float: left; margin: 15px 0 0 0;">
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" id="s_notice_menu" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        공지사항 관리
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        사업자관리
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu">
                                        <li><a class="dropdown-item" href="#" id="s_bu_accept_menu">업체 승인</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" id="s_bu_info_menu">사업자 정보 조회</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown" href="#" role="button" id="s_us_info_menu">
                                        사용자관리
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
                                        id="s_review_menu">
                                        리뷰관리
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div style="float: right; margin-top: 10px;">
                <div style="text-align: center;">
                    <img src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
                        alt="프사" width="60px">
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>

    </header>

    <section>
        <div id="main_box">
            <div class="nav_tab_div">
                <div id="s_bu_accept_list">
                    <p style="margin-top: 10px; font-weight: bold;">업체 등록 요청 현황</p>
                    <div>
                        <table class="table table table-hover">
                            <thead>
                              <tr>
                                <th scope="col">NO</th>
                                <th scope="col">업체명</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">신청일자</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">1</th>
                                <td>빡빡미러</td>
                                <td>010-5678-1234</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">2</th>
                                <td>카페인충전소</td>
                                <td>010-5678-5324</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">3</th>
                                <td>야놀래말래</td>
                                <td>010-1234-1234</td>
                                <td>22/04/19</td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                </div>
                <div id="s_bu_statistics">
                    <p style="margin-top: 10px; font-weight: bold;">업체별 예약 현황</p>
                    <div>
                        <!-- 통계 -->
                        <script src="https://code.highcharts.com/highcharts.js"></script>
                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <p class="highcharts-description" style="font-size: small;">
                                2022년 누적 기준
                            </p>
                        </figure>
                    </div>
                </div>
                <div id="s_ad_notice">
                    <p style="margin-top: 10px; font-weight: bold;">공지사항</p>
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
                              <tr>
                                <th scope="row">1</th>
                                <td>서비스 점검 예정(4/20)</td>
                                <td>관리자</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">2</th>
                                <td>지우동 주문 POS 위젯 장애 안내</td>
                                <td>관리자</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">3</th>
                                <td>잘 되는 매장의 전략 교육 OPEN!</td>
                                <td>관리자</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">4</th>
                                <td>서비스 점검 예정(4/20)</td>
                                <td>관리자</td>
                                <td>22/04/19</td>
                              </tr>
                              <tr>
                                <th scope="row">5</th>
                                <td>서비스 점검 예정(4/20)</td>
                                <td>관리자</td>
                                <td>22/04/19</td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <article>
            <div id="s_notice_content"
                style="width: 1200px; height: 1000px; display: none; margin: 0 auto; background-color: rgb(241, 241, 241); margin-top: 20px; padding: 30px; border-radius: 15px;">
                <p style="text-align: center; font-weight: bold; padding-top: 20px; font-size: large;">공지사항 조회</p>
                <!-- 검색 -->
                <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
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
                        <td>서비스 점검 예정(4/20)</td>
                        <td>관리자</td>
                        <td>22/04/19</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>지우동 주문 POS 위젯 장애 안내</td>
                        <td>관리자</td>
                        <td>22/04/19</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>잘 되는 매장의 전략 교육 OPEN!</td>
                        <td>관리자</td>
                        <td>22/04/19</td>
                      </tr>
                      <tr>
                        <th scope="row">4</th>
                        <td>서비스 점검 예정(4/20)</td>
                        <td>관리자</td>
                        <td>22/04/19</td>
                      </tr>
                      <tr>
                        <th scope="row">5</th>
                        <td>서비스 점검 예정(4/20)</td>
                        <td>관리자</td>
                        <td>22/04/19</td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </article>
        <article>
            <div id="s_bu_accept_content"
                style="width: 1200px; height: 1000px; display: none; margin: 0 auto; background-color: rgb(241, 241, 241); margin-top: 20px; padding: 30px; border-radius: 15px;">
                업체 승인 content 내용 들어갑니다 ~~~~~~~~~
                <!-- 검색 -->
                <nav class="navbar navbar-light">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </article>
        <article>
            <div id="s_bu_info_content"
                style="width: 1200px; height: 1000px; display: none; margin: 0 auto; background-color: rgb(241, 241, 241); margin-top: 20px; padding: 30px; border-radius: 15px;">
                사업자 정보 content 내용 들어갑니다 ~~~~~~~~~
                <!-- 검색 -->
                <nav class="navbar navbar-light">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </article>
        <article>
            <div id="s_us_info_content"
                style="width: 1200px; height: 1000px; display: none; margin: 0 auto; background-color: rgb(241, 241, 241); margin-top: 20px; padding: 30px; border-radius: 15px;">
                사용자 관리 content 내용 들어갑니다 ~~~~~~~~~
                <!-- 검색 -->
                <nav class="navbar navbar-light">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </article>
        <article>
            <div id="s_review_content"
                style="width: 1200px; height: 1000px; display: none; margin: 0 auto; background-color: rgb(241, 241, 241); margin-top: 20px; padding: 30px; border-radius: 15px;">
                리뷰 관리 content 내용 들어갑니다 ~~~~~~~~~
                <!-- 검색 -->
                <nav class="navbar navbar-light">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </article>
    </section>
    <!-- 통계 -->
    <script>
        // Create the chart
        Highcharts.chart('container', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '지우동'
            },
            subtitle: {
                text: '호텔 / 미용실 / 카페'
            },

            accessibility: {
                announceNewData: {
                    enabled: true
                },
                point: {
                    valueSuffix: '%'
                }
            },

            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y:.1f}%'
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },

            series: [
                {
                    name: "Browsers",
                    colorByPoint: true,
                    data: [
                        {
                            name: "호텔",
                            y: 45,
                        },
                        {
                            name: "",
                        },
                        {
                            name: "미용실",
                            y: 32,
                        },
                        {
                            name: "카페",
                            y: 23,
                        }
                    ]
                }
            ]
        });
    </script>
    <!-- 메뉴별 content display변경 -->
    <script>
        $("#s_notice_menu").click(function () {
            $("#s_notice_content").show();
            $("#s_bu_accept_content").hide();
            $("#s_bu_info_content").hide();
            $("#s_us_info_content").hide();
            $("#s_review_content").hide();
            $("#main_box").hide();
        });
        $("#s_bu_accept_menu").click(function () {
            $("#s_notice_content").hide();
            $("#s_bu_accept_content").show();
            $("#s_bu_info_content").hide();
            $("#s_us_info_content").hide();
            $("#s_review_content").hide();
            $("#main_box").hide();
        });
        $("#s_bu_info_menu").click(function () {
            $("#s_notice_content").hide();
            $("#s_bu_accept_content").hide();
            $("#s_bu_info_content").show();
            $("#s_us_info_content").hide();
            $("#s_review_content").hide();
            $("#main_box").hide();
        });
        $("#s_us_info_menu").click(function () {
            $("#s_notice_content").hide();
            $("#s_bu_accept_content").hide();
            $("#s_bu_info_content").hide();
            $("#s_us_info_content").show();
            $("#s_review_content").hide();
            $("#main_box").hide();
        });
        $("#s_review_menu").click(function () {
            $("#s_notice_content").hide();
            $("#s_bu_accept_content").hide();
            $("#s_bu_info_content").hide();
            $("#s_us_info_content").hide();
            $("#s_review_content").show();
            $("#main_box").hide();
        });

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</body>
</html>