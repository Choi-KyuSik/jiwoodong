<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>사업자 메인페이지</title>
<!--header-->
<style>
header {
	margin-top: 10px;
}

#p_main_top {
	width: 1200px;
	margin: 0 auto;
	border-bottom: 2px solid silver;
}

#p_top_logo {
	float: left;
	margin-left: 30px;
}

#p_top_menu {
	float: left;
	margin: 15px 0 0 10px;
}

#p_top_profile {
	float: left;
}

.navbar-nav {
	margin-right: 20px;
}

.dropdown-toggle, .dropdown {
	font-weight: bold;
}

#dropdownUser1 {
	padding-right: 10px;
}
</style>

<!--content-->
<style>
/* 컨텐트 */
content>article>div {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
}

/* 컨텐트안 제목 */
article>div>p {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
	font-size: large;
}

/* 검색바 위치*/
.navbar-light {
	float: right;
	margin-bottom: 20px;
}

/* 내정보 관리 */
.k_company {
	font-weight: bold;
}

/* 업체등록 */
#k_bu_eroll_top {
	display: flex;
}

.k_company_info {
	resize: none;
}
</style>

</head>

<body>
    <header>
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
                                <li class="nav-item dropdown"><a class="nav-link dropdown" id="k_info_menu"
                                        role="button"> 내정보 관리 </a></li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown"><a class="nav-link dropdown" id="k_review_menu" href="#"
                                        role="button"> 리뷰관리 </a></li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown"><a class="nav-link dropdown" id="k_bu_eroll_menu" href="#"
                                        role="button"> 업체등록 </a></li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown"> 예약관리 </a>
                                    <ul class="dropdown-menu dropdown-menu">
                                        <li><a class="dropdown-item" id="k_re_menu_enroll" href="#">예약메뉴등록</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" id="k_re_cu_menu" href="#">예약
                                                조회/수정</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown"><a class="nav-link dropdown" id="k_us_info_menu" href="#"
                                        role="button"> 회원정보조회 </a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div style="float: right; margin: 0 30px 0 0;">
                <div class="dropdown text-end" id="p_top_profile">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                        data-bs-toggle="dropdown"> <img
                            src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
                            alt="mdo" width="60px">
                    </a>
                    <p style="font-size: 12px; width: 115px; margin: 5px;">환영합니다
                        사업자님</p>
                    <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#">비밀번호 재설정</a></li>
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
    
   <body>
    <content>
            <!-- 업체등록 -->
            <article>
            <form action="<%=request.getContextPath() %>/bucompany" method="post">
                <div id="k_bu_eroll_content">
                    <div>
                        <div class="k_company">
                            <strong>업체명을 입력해주세요.<span class="k_essential_info">*필수</span></strong>
                            <p>
                                <input type="text" name="cpName" value="" placeholder="대표업체명을 입력해주세요.">
                            </p>
                        </div>
                        <div class="k_company">
                            <strong>업종을 선택해주세요.<span class="k_essential_info">*필수</span></strong>
                            <p>
                                <select name="cpCategory">
                                    <option value="cpCategory">업종을 선택해주세요</option>
                                    <option value="미용실">미용실</option>
                                    <option value="카페">카페</option>
                                    <option value="호텔">호텔</option>
                                </select>
                            </p>
                        </div>

                        <div class="k_company">
                            상세설명을 입력해주세요
                            <p>
                                <textarea class="k_company_info" name="cpExplain"></textarea>
                            </p>
                        </div>
                        <!-- TODO -->
                        <div class="k_company">
                        업체 사진을 추가해 주세요
                        </div>
                        <div class="k_company">
                            운영 구분
                            <p>
                                <label>모든 영업일이 같아요<input type="radio" value="A" name="cpClassify"></label>
                                <label>평일/주말이 달라요<input type="radio" value="B" name="cpClassify"></label>
                            </p>
                        </div>
                 
                        <div class="k_company">
                            <strong>주소를 입력해주세요<span class="k_essential_info">*필수</span></strong>
                            <div>
                                <input type="text" name="cpAddress">                               
                            </div>
                            <p>
                             <input type="text" name="cpPostcode">
                            </p>
                            <p>
                                <span>찾아오는 길 설명이 필요하신가요?</span>

                            <p>
                                <input type="text" placeholder="예)" class="k_company_info" name="cpDtaddress">                      
                            </p>
                          

                            <button>취소하기</button>
                            <input type="submit" value="등록하기"></input>
                        </div>
                    </div>                   
                </div>
               </form>
            </article>
    </content>
   </body>
    <script>
        $("#k_bu_eroll_content").show();
    </script>

    <!--전화번호 하이픈 정규식 DOM  -->
    <script>
        $("#k_tel").on(
            "input",
            function () {
                var target = document.getElementById("k_tel");
                target.value = target.value.replace(/[^0-9]/g, '').replace(
                    /^(\d{0,4})(\d{0,4})$/g, "$1-$2")
                    .replace(/(\-{1})$/g, "");

            });
    </script>

    <script src="https://code.highcharts.com/modules/data.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>