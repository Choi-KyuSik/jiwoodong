<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reset.css">
<!DOCTYPE html>
<html>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- aos css -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <!-- 스와이퍼 슬라이드 css-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <!--업체리스트 css-->
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

    <!-- google font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap');
    </style>
    
    <!-- reset.css가 안먹혀서 넣음ㅠㅠ -->
    <style>
	* {
		margin: 0;
		padding: 0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	a {
		text-decoration: none;
		text-align: center;
		color: black;
	}
	
	ul, li {
		list-style-type: none;
	}
	
	a:hover {
		color: blue;
	}
</style>
    
    <!--업체리스트 script-->
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
</head>
<body>
<%-- 	안녕하세요 반갑습니다.<br><br>
	<button id="login">로그인</button>
	<button id="join">회원가입</button>
	<br><br>
	
	<script>
	$("#login").click(function() {
			// 페이지 이동
			// get방식으로 링크가 걸리는 것과 동일함
			location.href = "AdminLogin"; // a태그의 href와 동일 : get방식
		});
	
	$("#join").click(function() {
		// 페이지 이동
		// get방식으로 링크가 걸리는 것과 동일함
		location.href = "join"; // a태그의 href와 동일 : get방식
	});
	
	
	
	</script>
	
	<%
		Connection conn = null;
		try {
			conn = JdbcDBCP.getConnection();
			out.println("연결 성공 : " + conn + "<br>");
		} catch (NullPointerException e) {
			out.println("연결 실패 : " + e.getMessage() + "<br>");
		} finally {
			JdbcDBCP.close(conn);
		}
	
	%> --%>
	
	
	<div>
		<%@ include file="./view/template_header.jsp"%>
	</div>
	<div>
		<%@ include file="./view/template_content.jsp"%>
	</div>
	<div>
		<%@ include file="./view/template_footer.jsp"%>
	</div>
	
	    <!-- Fixed -->
    <div id="p_fixed_btn">
        <a href="https://pf.kakao.com/_exjaDb" target="_blank"><img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjs1B8erTrv9n1OuRXSjoAvAfTFmPQBEB_og&usqp=CAU"
                alt="카톡상담"></a>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- section1 -aos 슬라이드  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <!-- 스와이퍼 초기화/옵션 -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
        const swiper = new Swiper('.j_review_swiper', {
            // Optional parameters
            direction: 'horizontal',
            loop: true,

            // If we need pagination
            pagination: {
                el: '.swiper-pagination',
            },

            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },

            // And if we need scrollbar
            scrollbar: {
                el: '.swiper-scrollbar',
            },
            autoplay: {
                //시간 1000 이 1초
                delay: 2000,
                disableOnInteraction: false,
            },


        });
    </script>
    <!--업체리스트 JS -->
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>