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
<script src="https://code.highcharts.com/highcharts.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>관리자 메인페이지</title>
</head>
<body>
    
</head>

<body>
    <div>
		<%@ include file="../view/admin/admin_header.jsp" %>
	</div>

    <section>
        <div id="main_box" class="tab_menu">
            <div class="nav_tab_div">
                <div id="s_bu_accept_list">
                    <p style="margin-top: 10px; font-weight: bold;">업체 등록 요청 현황</p>
                    <div>
                        <table class="table table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">사업자번호</th>
                                    <th scope="col">업종</th>
                                    <th scope="col">업체명</th>
                                    <th scope="col">신청일자</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cpAccept }" var="i">
                                <tr>
                                    <th scope="row">${i.rownum}</th>
                                    <td>${i.buNumber}</td>
                                    <td>${i.cpCategory}</td>
                                    <td>${i.cpName}</td>
                                    <td>${i.cpWriteDate}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="s_bu_statistics">
                    <p style="margin-top: 10px; font-weight: bold;">업체별 예약 현황</p>
                    <div>
                        <!-- 통계 -->
                        <figure class="highcharts-figure">
                            <div id="container"></div>
                            <p class="highcharts-description" style="font-size: small;">
                                2022년 누적 기준
                            </p>
                        </figure>
                    </div>
                </div>
                <!-- 
                	private int ntNo;
					private String ntTitle;
					private String ntContent;
					private Timestamp ntWriteDate;
					private int ntCount;
					private String flGno;
                
                 -->
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
                            	<c:forEach items="${adnolist }" var="i">
                                <tr>
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
            </div>
        </div>
        <article>
            <div id="s_notice_content" class="tab_menu"
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
                <table class="table table table-hover" style="clear: both; table-layout: fixed;">
                    <thead>
                        <tr>
                            <th scope="col" style="width: 100px;">글번호</th>
                            <th scope="col" style="width: 300px;">제목</th>
                            <th scope="col" style="width: 450px;">내용</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    
                    <tbody style="cursor: pointer;">
                        <c:forEach items="${adnoDetailList }" var="i">
                                <tr class="s_tr_readList" class="s_tr_modal">
                                    <th scope="row" class="s_ntNo">${i.ntNo}</th>
                                    <td style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${i.ntTitle}</td>
                                    <td style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${i.ntContent}</td>
                                    <td>관리자</td>
                                    <td>${i.ntDate}</td>
                                </tr>
                            	</c:forEach>
                    </tbody>
                    <tfoot>
                    <!-- <nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item disabled">
					      <a class="page-link">Previous</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#">Next</a>
					    </li>
					  </ul>
					</nav> -->
                    </tfoot>
                </table>
            </div>
        </article>
        <article>
            <div id="s_bu_accept_content" class="tab_menu"
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
            <div id="s_bu_info_content" class="tab_menu"
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
            <div id="s_us_info_content" class="tab_menu"
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
            <div id="s_review_content" class="tab_menu"
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
	let tabMenu = '${tabMenu}';
    	console.log("tabMenu: "+tabMenu);
    	if(tabMenu == ''){
    		tabMenu = 0;
    	}
    	showTabMenu();
    	function showTabMenu(){
       		console.log(tabMenu);
    		$(".tab_menu").each(function(index, elem){
        		console.log(index);
        		console.log(elem);
        		if(index == tabMenu){
        			console.log("show");
        			console.log(elem);
        			$(elem).show();
        		}else{
        			$(elem).hide();
        		}
        	});
    	}
        $("#s_notice_menu").click(function () {
		tabMenu = 1;
        	showTabMenu();
/*            $("#s_notice_content").show();
            $("#s_bu_accept_content").hide();
            $("#s_bu_info_content").hide();
            $("#s_us_info_content").hide();
            $("#s_review_content").hide();
            $("#main_box").hide(); */
        });
        $("#s_bu_accept_menu").click(function () {
            tabMenu = 2;
            showTabMenu();
        });
        $("#s_bu_info_menu").click(function () {
            tabMenu = 3;
            showTabMenu();
        });
        $("#s_us_info_menu").click(function () {
            tabMenu = 4;
            showTabMenu();
        });
        $("#s_review_menu").click(function () {
            tabMenu = 5;
            showTabMenu();
        });

    </script>
    <script>
    	$("#s_notice_insert_btn").click(function() {
    		console.log("등록버튼 눌리니?");
    		location.href="AdminNoticeWrite";
    	});
    	$(".s_tr_readList").click(function() {
    		// 배열 선언
    		var tdArr = new Array();
    		// 현재 클릭된 행(tr의 td)
    		var tr = $(this);
    		var td = tr.children();
    		
    		// 반복문을 통해 배열에 값을 담아 사용
    		td.each(function(i) {
    			tdArr.push(td.eq(i).text());
    		})
    		// td들이 배열에 담겨있는데 그 중 1번째가 필요
    		console.log("배열에 담긴 값 : " + tdArr[0]);
    		
    		// 링크로 넘기기
    		location.href="AdminNoticeDetailRead?ntNo=" + tdArr[0];
    	});
    </script>
</body>
</html>