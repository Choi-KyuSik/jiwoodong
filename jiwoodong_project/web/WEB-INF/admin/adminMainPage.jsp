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
                    <p class="p_title_style">업체 등록 요청 현황</p>
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
                    <p class="p_title_style">업체별 예약 현황</p>
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
                <div id="s_ad_notice">
                    <p class="p_title_style">공지사항</p>
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
        
        <!-- 리뷰 조회 : 전승희 -->
        <div>
            <div id="s_review_menu" class="tab_menu s_content">
                <p class="p_content_style">리뷰 Content~~~~~~~</p>
                <!-- 검색 -->
                <nav class="navbar navbar-light" style="float: right; margin-bottom: 20px;">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
                <div>
                	내용~ 들어가야지~~~~~~~~~~~~~~~~~~~~~~~~
                </div>
                <div>
                	내용~ 들어가야지~~~~~~~~~~~~~~~~~~~~~~~~
                </div>
                <div>
                	내용~ 들어가야지~~~~~~~~~~~~~~~~~~~~~~~~
                </div>
				<div id="pagingBox">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
            </div>
        </div>
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
    
    <!-- 메뉴버튼 눌렀을 때 이동할 페이지 -->
	<script>
    	$("#s_notice_menu").click(function() {
    		location.href="AdminNoticeList";
    	});
    	
    	$("#s_bu_accept_menu").click(function() {
    		location.href="AdminBuAcceptList";
    	});
    	
    	$("#s_bu_accept_result_approval_menu").click(function() {
    		location.href="AdminBuAcceptApprovalList";
    	});
    	
    	$("#s_bu_accept_result_reject_menu").click(function() {
    		location.href="AdminBuAcceptRejectList";
    	});
    	
    	$("#s_bu_info_menu").click(function() {
    		location.href="AdminBuInfoList";
    	});
    	
    	$("#s_bu_delete_menu").click(function() {
    		location.href="AdminBuInfoDeleteList";
    	});
    	
    	$("#s_us_info_menu").click(function() {
    		location.href="AdminUsInfoList";
    	});
    	
    	$("#s_us_delete_menu").click(function() {
    		location.href="AdminUsInfoDeleteList";
    	});
    </script>
    
    <!-- 메뉴별 content display변경 -->
    <!-- <script>
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
        			console.log("보여지는 애들");
        			console.log(elem);
        			$(elem).show();
        			console.log($(elem));
        		}else{
        			console.log("숨겨지는 애들");
        			$(elem).hide();
        		}
        	});
    	}
       $("#s_notice_menu").click(function () {
			tabMenu = 1;
       		showTabMenu();
       		console.log("몇 ? " + $("#main_box.tab_menu").length);
       		//location.href="AdminMainPage?tabMenu=" + tabMenu;

        });
        $("#s_bu_accept_menu").click(function () {
            tabMenu = 2;
            showTabMenu();
       		console.log($("#main_box.tab_menu"));
        });
        $("#s_bu_accept_result_approval_menu").click(function () {
            tabMenu = 3;
            showTabMenu();
        });
        $("#s_bu_accept_result_reject_menu").click(function () {
            tabMenu = 4;
            showTabMenu();
        });
        $("#s_bu_info_menu").click(function () {
            tabMenu = 5;
            showTabMenu();
        });
        $("#s_bu_delete_menu").click(function () {
            tabMenu = 6;
            showTabMenu();
        });
        $("#s_us_info_menu").click(function () {
            tabMenu = 7;
            showTabMenu();
        });
        $("#s_us_delete_menu").click(function () {
            tabMenu = 8;
            showTabMenu();
        });
        $("#s_review_menu").click(function () {
            tabMenu = 9;
            showTabMenu();
        });
        

    </script> -->
    
    
</body>
</html>