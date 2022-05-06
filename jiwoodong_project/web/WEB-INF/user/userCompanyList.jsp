<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/userCpList.css">

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

<title>지우동 업체조회</title>
</head>
<body>
<body>
	<div>
		<%@ include file="../view/user/user_header.jsp" %>
	</div>
	<!-- <header>
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
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_info_menu" href="#" role="button"> 마이페이지 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_review_menu" href="#" role="button"> 공지사항 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_bu_eroll_menu" href="#" role="button"> 리뷰 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 사진 </a>
									<ul class="dropdown-menu dropdown-menu">
										<li><a class="dropdown-item" id="k_re_menu_enroll"
											href="#">예약메뉴등록</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" id="k_re_cu_menu" href="#">예약
												조회/수정</a></li>
									</ul></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_us_info_menu" href="#" role="button"> 지도 </a></li>
							</ul>
							<div>
								<form class="d-flex">
									<input class="form-control me-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-primary" type="submit">Search</button>
								</form>
							</div>
						</div>
					</div>
				</nav>
			</div>
			<div style="float: right; margin: 0 30px 0 0;">
				<div class="dropdown text-end" id="p_top_profile">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown"> <img
						src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
						alt="mdo" style="width: 60px;">
					</a>
					<p style="font-size: 12px; width: 115px; margin: 5px;">사용자ID</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
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
 -->
	<section style="height: 100%;">
        <div id="main_box"
            style="width: 1200px; margin: 15px auto 0; background-color: rgb(241, 241, 241); border-radius: 15px;">
            <ul style="padding-top: 20px;">
                <div style="width: 95%; background-color: white; border-radius: 15px; margin-left: 12px;">
                    <div style="padding: 45px 0 10px 40px; border-bottom: 2px solid silver;">
                        <h3 style="font-weight: 600;">지금 우리 동네는</h3>
                    </div>
					<!-- 	private String cpName;
							private String cpAddress;
							private String cpDTAdress;
							private String cpOpenTime;
							private String cpCloseTime;
							private String cpExplain;
							private int cpNo; -->
					<div style="padding-left: 35px;">
						<c:forEach items="${uscplist }" var="i">
	                    <li style="display: inline-block; width: 22%; margin: 20px 10px 40px 10px;">
	                        <div class="card">
	                            <img src="https://cdn.discordapp.com/attachments/958566133752016903/966709567109095484/hotel.jpg"
	                                class="card-img-top" alt="...">
	                            <table style="margin-top: 20px; margin-left: 10px;">
	                            	<tr>
	                            		<th colspan="3">
	                            			${i.cpName}
	                            		</th>
	                            	</tr>
	                            	<tr class="tr_list">
	                            		<td style="font-size: small;  padding-top: 15px;">${i.cpAddress} ${i.cpDTAddress} 
	                            		</td>
	                            		<td style="display: none;">${i.cpNo }</td>
	                            		<td>
                        			<input type="button" id="detailbtn" onclick="movepage()" class="btn btn-primary detailbtn" style="position: absolute; right: 15px; bottom: 15px;" value="자세히"/>
                        </td>
	                            	</tr>
	                            </table>
	                            <div class="card-body"  style=" height: 150px;">
	                            </div>
	                        </div>
	                    </li>
	                    </c:forEach>
	                </div>
                </div>
            </ul>
        </div>
    </section>
    
    <script>
    function movepage() {
    	
    	$(".tr_list").on("click", function(e){
    		/* location.href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=qbxlvnf11&logNo=221141017820"; */

    		// 배열 선언
    		var arr = new Array();
    		// 현재 클릭된 행(tr의 td)
    		var tr = $(this);
			console.log("tr : " + JSON.stringify(tr));
			console.log(tr);
			var td = tr.children();
			console.log("td : " + td.innertext);
			console.log(td);
			
    		
			// 반복문을 통해 배열에 값을 담아 사용
			td.each(function(i) {
				arr.push(td.eq(i).text().trim());
			});
			
			// td들이 배열에 담겨있는데 그 중 2번째가 필요
			console.log("arr : " + arr);
			console.log("arr[1] : " + arr[1]);
    		
			location.href="uscpdetail?cpNo=" + arr[1];
    	});
    }
    </script>

</body>
</body>
</html>