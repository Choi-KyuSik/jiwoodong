<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/admin.css">
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
<title>관리자 메인페이지</title>
</head>
<body>
    
</head>

<body>
    <div>
		<%@ include file="../view/admin/admin_header.jsp" %>
	</div>

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
                <button type="button" id="s_notice_insert_btn" class="btn btn-primary" data-bs-dismiss="modal">글 등록</button>
                <!-- 검색 -->
                <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">서비스 점검 예정(4/20)</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>서버 안정화를 위해 서비스 점검이 진행됩니다.</p> 
                                <p>서버 안정화를 위해 서비스 점검이 진행됩니다.</p> 
                                <p>서버 안정화를 위해 서비스 점검이 진행됩니다.</p> 
                                <p>서버 안정화를 위해 서비스 점검이 진행됩니다.</p> 
                                <p>서버 안정화를 위해 서비스 점검이 진행됩니다.</p> 
                                <p>다들 나가주세요.</p>
                                <p>혼자있고 싶어요</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">수정</button>
                                <button type="button" class="btn btn-secondary">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
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
                        <tr class="s_tr_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <th scope="row">1</th>
                            <td>서비스 점검 예정(4/20)</td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr class="s_tr_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <th scope="row">2</th>
                            <td>지우동 주문 POS 위젯 장애 안내</td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr class="s_tr_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <th scope="row">3</th>
                            <td>잘 되는 매장의 전략 교육 OPEN!</td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr class="s_tr_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <th scope="row">4</th>
                            <td>서비스 점검 예정(4/20)</td>
                            <td>관리자</td>
                            <td>22/04/19</td>
                        </tr>
                        <tr class="s_tr_modal" data-bs-toggle="modal" data-bs-target="#exampleModal">
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
    <script>
    	$("#s_notice_insert_btn").click(function() {
    		location.href="AdminNoticeWrite";
    	}) 
    	
    </script>
</body>
</html>