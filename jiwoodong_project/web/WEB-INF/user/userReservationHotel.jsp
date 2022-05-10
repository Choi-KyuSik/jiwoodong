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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<title>지우동 호텔 예약</title>
<style>
	.rstime{
		border: 1px solid black; 
		width: 80px; 
		height : 30px;
		text-align: center;
		margin: 5px 10px;
		font-size:20px;
	}
	.crstime{
		border: 1px solid black; 
		width: 80px; 
		height : 30px;
		text-align: center;
		margin: 5px 10px;
		font-size:20px;
	}
	.rstime input{
		display: none;
	}
</style>
    <script>
    $(function(){
    	 var totalprice = '';
    	/* 날짜선택 오늘날짜 */
    	var date = new Date();
    	$("#rsdate").attr("min",date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2));
    });
    </script>
</head>
<body>
	<div>
		<%@ include file="../view/user/user_header.jsp"%>
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
	</header> -->
	<section>
        <div id="main_box"
            style="width: 1200px; margin: 15px auto; background-color: rgb(241, 241, 241); border-radius: 15px;">
            <ul style="padding-top: 20px; padding-bottom: .5px;">
                <div style="width: 95%; background-color: white; border-radius: 15px; margin-left: 12px;">
                    <div style="padding: 45px 0 10px 40px; border-bottom: 2px solid silver;">
                        <p style="font-size: 1.7em; font-weight: bold;">${CpInfo[0].cpName } 예약</p>
                    </div>
                    <div style="margin: 30px;">
	                    <form action="UserReservationInsertHotel" method="post" id="frmrsinsert">
	                     <input type="hidden" value="${cpNo }" name="cpNo">
	                    <div style="float: left">
	                    	<label style="font-size: 20px;">날짜선택 : <input type="text" id="datepicker"  name="rsdate" required></label><br>
	                    	<label style="font-size: 20px; margin-top: 20px; float: left">시간선택 : </label>
	                    	<div id="timemenu" style="width: 200px; float:left; clear: both">
		            			<h4 style="margin-top: 30px; color: rgb(241, 77, 12)">★날짜 선택★</h4>
		                    </div>
		                    <div style="float: left; padding-left: 70px;">
		                    <input type="hidden" value="${umTel }" id="umTel" name="umTel"/>
		                    <input type="hidden" value="${umPostcode }" id="umPostcode" name="umPostcode"/>
		                    <input type="hidden" value="${umAddress }" id="umAddress" name="umAddress"/>
		                    <label style="font-size: 20px;">예약자명 : <input type="text" id="rsname"  name="rsname" value="${umName }" required></label><br>
		                    <label style="font-size: 20px; margin-top: 20px">전화번호 : <input type="text" id="rsphone"  name="rsphone" value="${umTel }" required></label><br>
		                    <label style="font-size: 20px; margin-top: 10px;">요청사항 : </label><br>
		                    <textarea rows="10" cols="30"  style="width:310px; margin: 10px 0 0 10px; resize: none; padding: 5px" id="rsrequire" name="rsrequire"></textarea><br>
		                    </div>
		                  </div>
		                  <div style="float: right; margin-right: 20px">
		                  <div style="border: 1px solid black;">
									<img src="https://missioninfra.net/img/noimg/noimg_4x3.gif" alt="메뉴사진" id="menuimg"  style="width: 330px; height:330px; object-fit: cover;" >
		                  </div>
		                  <textarea rows="2" cols="50"  style="width: 332px; resize: none; padding: 5px" readonly id="rsmenuexplain">메뉴설명</textarea><br>
		                    <label style="font-size: 20px; margin-top: 20px;">메뉴선택 : </label>
		                    	<select style="font-size: 20px; width: 225px" id="rsmenu" name="rsmenu">
		                    	<option value="none">메뉴를 선택해주세요</option>
		                    	<c:forEach items="${menu }" var="menu">
		                    		<option value="${menu.menuNo }" class="menuoption" style="display:none">${menu.menuName }</option>
		                    	</c:forEach>
		                    	</select><br>
		                    	<label style="font-size: 20px; margin-top: 20px; margin-bottom:20px">메뉴가격 : <input type="text" id="rsmenuprice"  name="rsmenuprice" readonly></label><br>
	                   	<input type="button" onclick="requestPay()" id="btnsubmit" value="예약하기" style="font-size:20px; padding: 10px; border-radius:10px; border: 1px solid black; background-color: rgb(13,110,253); color: white; margin-bottom: 20px; float: right">
	                   	</div>
	                   	<div id="h_menu" style="clear: both"></div>
	                   	<div id="h_totalprice"></div>
	                   </form>
                    </div>
                </div>
            </ul>
        </div>
    </section>
    <!-- 결제API : 손은진 -->
    <script>
       var IMP = window.IMP; // 생략 가능
      IMP.init("imp39204315") // 지우동 가맹점 식별코드
      
      function requestPay() {
            // IMP.request_pay(param, callback) 결제창 호출
            IMP.request_pay({ // param
                pg: "html5_inicis", // 이니시스 웹표준 결제창
                pay_method: "card", // 결제 방법
                merchant_uid: new Date().getTime() + "jwd", // 주문번호
                name: $("#rsmenu option:selected").text(), // 상품명
                amount: $("#rsmenuprice").val(), // 가격
                buyer_email: "dms102336@gmail.com", // 이메일
                /* 구매자 이름, 전화번호, 주소, 우편번호 로그인 한 사용자 정보로 가져오기 */
                buyer_name: $("#rsname").val(), // 이름
                buyer_tel: $("#rsphone").val(), // 전화번호
                buyer_addr: $("#umAddress").val(), // 주소
                buyer_postcode: $("#umPostcode").val() // 우편번호
            }, function (rsp) { // callback
               if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            	   var frmEl = $("#frmrsinsert");
                   alert("결제가 완료되었습니다.");
                   alert("예약이 완료되었습니다.");
                   frmEl.attr("action", "UserReservationInsertHotel");
                   frmEl.attr("method", "post");
                   frmEl.submit();

            	   /* let response = fetch("/payment", {
                       method: "post",
                       body : JSON.stringify(rsp),
                       headers: {
                          "Content-Type" : "application/json; charset=utf-8"
                       }
                    }); */
                } else {
                	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
                	if(rsp.error_msg == "사용자가 결제를 취소하셨습니다") {
                		alert("결제가 취소되었습니다. 메인페이지로 돌아갑니다.");
                		location.href="UserMypage";
                	}
                }
            });
          }
    </script>
    <!-- 데이더픽커  -->
     <script>
     // 데이터픽커 선언
        $(function () {
            $("#datepicker").datepicker();
        });
        
     //데이터필커 설정(운영구분 비교)
		if('${CpInfo[0].cpClassify}' == 'B'){
        $.datepicker.setDefaults({
        	  dateFormat: 'yy-mm-dd',
        	  prevText: '이전 달',
        	  nextText: '다음 달',
        	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        	  showMonthAfterYear: true,
        	  yearSuffix: '년', 
        	  minDate: 0,
        	  beforeShowDay: function(date){
      			var day = date.getDay();
      			return [(day != 0 && day != 6)];
      		}
        });
		} else {
			$.datepicker.setDefaults({
	        	  dateFormat: 'yy-mm-dd',
	        	  prevText: '이전 달',
	        	  nextText: '다음 달',
	        	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        	  showMonthAfterYear: true,
	        	  yearSuffix: '년', 
	        	  minDate: 0,
	        });
		}
    </script>
    <script>
		$("#datepicker").change(function(){
			var check = 0;
			$("option[value='none']").html("메뉴를 선택해주세요");
			$(".menuoption").show();
			$("#btnsubmit").show();
			var cpno = ${cpNo};
			var date = $(this).val();
			$.ajax({
				type : "post",
				url : "UserReservationHotelMenuCheck",
				data : {"date" : date, "cpno" : cpno},
				dataType : "json",
				success : function(data){
					$.each(data, function(i, item){
						$(".menuoption").each(function(a, atem){
						if(item.menu_no == $(atem).val()){
							 $(atem).hide();
						}
						})
						var $len = $(".menuoption").filter(function() {
						return $(this).css('display') == 'none';
						});
						var count = $len.length;
						if(count == $(".menuoption").length){
							$("option[value='none']").html("매진입니다"); 
							$("#btnsubmit").hide();
						}
					})
				}
			})
			
		});
    	$("#rsmenu").change(function(){
    		$("#rsmenucount").val("none");
    		var value = $(this).val();
    		if(value == "none"){
    			return;
    		}
    		$("#menuimg").attr("src", "https://missioninfra.net/img/noimg/noimg_4x3.gif");
    		$("#rsmenuprice").val('');
    		$("#rsmenuexplain").val('');
    		$.ajax({
    			type : "post",
    			url : "UserReservationMenuInfo",
    			data : {"menuNo" : value},
    			dataType : "json",
    			success : function(data){
    				$("#menuimg").attr("src",data[0].menuUrl);
    				$("#rsmenuprice").val(data[0].menuPrice);
    				$("#rsmenuexplain").val(data[0].menuExplain);
    			}
    		})
    	});
    	$("#btnsubmit").click(function(){
    		if($("#datepicker").val() == ""){
    			alert('날짜를 선택해주세요');
    			$("#rsdate").focus();
    			return;
    		} 
    		if($("#rsname").val() == ""){
    			alert('이름을 입력해주세요');
    			$("#rsname").focus();
    			return;
    		} 
    		if($("#rsphone").val() == ""){
    			alert('전화번호를 입력해주세요');
    			$("#rsphone").focus();
    			return;
    		} 
    		if($("#rsmenu").val() == "none"){
    			alert('메뉴를 선택해주세요');
    			$("#rsmenu").focus();
    			return;
    		} 
    		
                requestPay();
	    })
    </script>
    <script>
    $(document).on('click', '.rstime', function(){
			$(".rstime").css("background-color", "white").css("color", "black");
			$(this).css("background-color", "rgb(13,110,253)").css("color", "white");
		});
    </script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>