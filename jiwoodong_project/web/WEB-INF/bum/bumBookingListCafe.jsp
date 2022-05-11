<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>사업자 예약조회</title>
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

a :hover() {
	color: blue;
}

li {
	list-style-type: none;
}
</style>
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
	padding: 30px;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
}

/* 컨텐트안 제목 */
article>div>p {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
	font-size: 25px;
}
/* 검색바 위치*/
.navbar-light {
	float: right;
	margin-bottom: 20px;
}

td, th {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="<%=request.getContextPath() %>/BumMainPage" id="k_logo"><img
					src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
					width="80px" alt="logo"></a>
			</div>
			<div id="p_top_menu">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_info_menu" href="#" role="button"> 내정보 관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_review_menu" href="#" role="button"> 리뷰관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_bu_eroll_menu" href="#" role="button"> 업체등록 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 예약관리 </a>
									<ul class="dropdown-menu dropdown-menu">
										<li><a class="dropdown-item" id="k_re_menu_enroll"
											href="<%=request.getContextPath()%>/burmenu">예약메뉴등록</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" id="k_re_cu_menu" href="<%=request.getContextPath()%>/burscheck">예약
												조회/수정</a></li>
									</ul></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_us_info_menu" href="#" role="button"> 회원정보조회 </a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div style="float: right; margin: 0 30px 0 0;">
				<div class="dropdown text-end" id="p_top_profile">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown"> <img
						src="https://media.discordapp.net/attachments/958566133752016901/973649744310202458/e3362c1706dbf481.png?width=676&height=676"
						alt="mdo" width="60px">
					</a>
					<p style="font-size: 12px; margin: 5px;">환영합니다
						<%= session.getAttribute("buName") %>님</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" id="k_pwdinfo" href="#">비밀번호 재설정</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</header>
	<content>
	<article>
		<div id="k_us_info_content">
			<p>카페 예약 조회</p>
			<!-- 예약상태 선택-->
			<select style="width: 100px; height: 30px;" id="bkStatus">
				<option value="전체" selected>전체</option>
				<option value="예약">예약</option>
				<option value="취소">취소</option>
				<option value="매장예약">매장예약</option>
			</select>
			<!-- 날짜선택 -->
			<input type="date" id="todayDate" style="height: 30px;">
			</nav>
			<!-- 예약추가-->
			<button type="button" class="btn btn-primary" id="booking_add"
				style="float: right; margin-top: 8px;" class="bookingList"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo">예약추가</button>
			<table class="table table table-hover">
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">예약자ID</th>
						<th scope="col">이름</th>
						<th scope="col">핸드폰번호</th>
						<th scope="col">예약상태</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약시간</th>
						<th scope="col">주문정보</th>
						<th scope="col">금액</th>
						<th scope="col">요청사항</th>
					</tr>
				</thead>
				<tbody id="reservationListTbody">
					<c:forEach items="${reservation }" var="reservation">
						<tr class="bookingList" data-bs-toggle="modal"
							data-bs-target="#exampleModal" data-bs-whatever="@mdo"
							style="cursor: pointer;">
							<td class="l1"><c:out value="${reservation.bkNo }" /></td>
							<td class="l2"><c:out value="${reservation.umId }" /></td>
							<td class="l3"><c:out value="${reservation.bkName }" /></td>
							<td class="l4"><c:out value="${reservation.bkPhone }" /></td>
							<td><c:choose>
									<c:when test="${reservation.bkStatus eq 'R'}">
										<c:out value="예약" />
									</c:when>
									<c:when test="${reservation.bkStatus eq 'C'}">
										<c:out value="취소" />
									</c:when>
									<c:when test="${reservation.bkStatus eq 'M'}">
										<c:out value="매장예약" />
									</c:when>
								</c:choose></td>
							<td class="l5"><c:out value="${reservation.bkDate}" /></td>
							<td class="l6"><c:out value="${reservation.bkTime }" /></td>
							<c:if test="${reservation.menuCount > 1}">
							<td class="l7" style="font-size:14px"><c:out value="${reservation.menuName } 외 ${reservation.menuCount -1}건" /></td>
							</c:if>
							<c:if test="${reservation.menuCount == 1}">
							<td class="l7"><c:out value="${reservation.menuName } " /></td>
							</c:if>
							<td class="l8"><c:out value="${reservation.bkTotalPrice }" />
								원</td>

							<td class="l9"><c:choose>
									<c:when test="${empty reservation.bkRequire}">X</c:when>
									<c:when test="${!empty reservation.bkRequire}">O</c:when>
								</c:choose></td>
							<td class="l10" style="display: none"><c:out
									value="${reservation.bkRequire}" /></td>
							<td class="l11" style="display: none"><c:out
									value="${reservation.bkStatus}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</article>
	</content>
	<!-- 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="top: 5%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">예약정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="bookingForm">
						<label for="bkno" style="margin: 10px;">예약번호 :</label><input
							type="text" id="bkno" name="bkno" value="asdad" readonly style="background-color: rgb(233,236,239); border: 1px solid black;"><br>
						<label for="umid" style="margin: 10px;">아이디 :</label><input
							type="text" id="umid" name="umid" readonly style="background-color: rgb(233,236,239); border: 1px solid black;"><br> <label
							for="bkname" style="margin: 10px;">이름 :</label><input type="text"
							id="bkname" name="bkname" placeholder="한글 이름 1~4자 이내"><br>
						<label for="bkphone" style="margin: 10px;">핸드폰번호 :</label><input
							type="tel" id="bkphone" name="bkphone"
							placeholder="###-####-####"><br> <label for="bkdate"
							style="margin: 10px;">예약날짜 :</label><input type="date"
							id="bkdate" name="bkdate"><br> <label for="bktime"
							style="margin: 10px;">예약시간 :</label><input type="time"
							id="bktime" name="bktime"><br> 
							<div id="menuName_Count">
							<label for="bkMenuNo" style="margin: 10px;">메뉴 :</label>
							<input type="text" readonly value="메뉴1" ><span> 수량 : </span><input type="text" readonly value="수량" style="width: 80px; background-color: rgb(233,236,239); border: 1px solid black;">
							</div>
							<label for="bkPrice" style="margin: 10px;">총 금액 :</label><input
							type="text" id="bkPrice" name="bkPrice" readonly="readonly" style="background-color: rgb(233,236,239); border: 1px solid black;"/><br> <label
							for="bkrequire" style="margin: 10px;">요청사항 :</label>
						<textarea cols="55" rows="5" id="bkrequire"
							style="padding: 10px;" name="bkrequire"></textarea>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="booking_delete" class="btn btn-secondary"
						onclick="fnBookingDelete()"
						style="background-color: rgb(241, 77, 12);">취소하기</button>
					<button type="button" id="booking_update" class="btn btn-primary"
						onclick="fnBookingUpdate()">수정하기</button>
					<button type="button" id="booking_insert" class="btn btn-primary"
						onclick="fnBookingAdd()">추가하기</button>
				</div>
			</div>
		</div>
	</div>
		<script>
	$(document).on("change",  "#bkname", function(){
			var regstr = /^[가-힣]{1,4}$/;
			if(!regstr.test($(this).val())){
				$(this).val("");
				$(this).focus();
				alert("이름을 4자 이내로 작성해주세요");
			}
		});
		$("#bkphone").keyup(function(){
			var regstr =  /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/
			if(!regstr.test($(this).val())){
				$(this).val("");
				$(this).focus();
				alert("전화번호를 잘못입력했습니다");
			}
		});
	</script>
	<script>
    $(function(){
    	/* 날짜선택 오늘날짜 */
    	var date = new Date();
    	$("#todayDate").val(date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2));
    	//현재시간
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1);
		var day = date.getDate();
		// 10이하 앞에 0 붙여주기
		if(month < 10){
			month = "0"+month;
		}
		if(day < 10){
			day = "0"+day;
		}
		var today = year +"-"+month+ "-" +day;
		
		$("#bkdate").attr("min", today);
    });
		/* 예약 추가 버튼  클릭시*/
    	$("#booking_add").click(function(){
    		/* 모달 추가, 상세정보 같이사용해서 selected 충돌 클릭시 초기화*/
    		$("#bkMenuNo option").removeAttr("selected");
    			/* 예약번호, 사용자아이디 숨김*/
    			$("#bkno").prev().hide();
    			$("#bkno").next().hide();
    			$("#bkno").hide();
    			$("#umid").prev().hide();
    			$("#umid").next().hide();
    			$("#umid").hide();
    			$("#menuName_Count").html("");
    			var html = '';
				html += '<label for="bkMenuName" style="margin: 10px;">메뉴 :</label>';
    			html += '<select id="bkMenuNo" name="bkMenuNo" style="width:190px;">';
				html +=	'<c:forEach items="${menulist }" var="menulist">';
				html +=	'<option value="${menulist.menuNo }">${menulist.menuName }</option>';
				html += '</c:forEach></select><span> 수량 : </span>';
				html += '<select name="menuCount" class="menuCount">';
				html +=	'<option value="none"></option>'
	        	html += '<c:forEach var="index" begin="1" end="10">'
	        	html +=	'<option value="${index }">${index }</option>'
	        	html += '</c:forEach>'
	       		html += '</select>'
				html += '<input type="button" id="btnAddMenu" style="width:30px; margin-left:20px;" value="+">'
				html += '<input type="button" id="btnMinusMenu" style="width:30px; margin-left:10px;" value="-">'
				$("#menuName_Count").append(html);
    			/* 버튼 반전*/
    			$("#booking_delete").hide();
    			$("#booking_update").hide();
    			$("#booking_insert").show();
    			$(".modal-body").children().children().val("");
    	});
    	/* 예약 리스트  클릭시*/
    	$(document).on('click', '.bookingList', function(){
    		/* 모달 추가, 상세정보 같이사용해서 selected 충돌 클릭시 초기화*/
    		$("#bkMenuNo option").removeAttr("selected");
    		var bkMenuName=$(this).children('.l7').html();
    		var statuscheck = $(this).children('.l11').html();
    		var bkrequire = $(this).children('.l9').html().trim();
    			/* 예약번호, 사용자아이디 표시*/
    			$("#bkno").prev().show();
    			$("#bkno").next().show();
    			$("#bkno").show();
    			$("#umid").prev().show();
    			$("#umid").next().show();
    			$("#umid").show();
    			/* 모달 input 값들 선택 행에서 정보 가져 옴 */
    			$("#bkno").val($(this).children('.l1').html());
    			$("#umid").val($(this).children('.l2').html());
    			$("#bkname").val($(this).children('.l3').html());
    			$("#bkphone").val($(this).children('.l4').html());
    			$("#bkdate").val($(this).children('.l5').html().replaceAll("/","-").trim());
    			$("#bktime").val($(this).children('.l6').html());
    			$("#bkPrice").val($(this).children('.l8').html());
    			var html = "";
    			$.ajax({
    				type : "post",
    				url : "bmenulistAjax",
    				data : {"bkno" : $("#bkno").val()},
    				dataType : "json",
    				success : function(data){
    					$.each(data, function(i, items){
    						console.log(items.menuName);
    						$("#menuName_Count").html("");
    						html += '<label for="bkMenuName" style="margin: 10px;">메뉴 :</label>';
							html += '<input type="text" id="bkMenuName" name="menuName" readonly value="'+items.menuName+'" style="background-color: rgb(233,236,239); border: 1px solid black;"><span> 수량 : </span><input type="text" readonly name="menuCount" value="'+items.bkmCount+'" style="width: 80px; background-color: rgb(233,236,239); border: 1px solid black;"><br>';
    						$("#menuName_Count").append(html);
    						
    						
    					})
    				}
    			})
    			

    			if(bkrequire == 'O'){
    				$("#bkrequire").val($(this).children('.l10').html());
    			} else {
    				$("#bkrequire").val(' ');
    			}
    			
    			/* 버튼 반전 조건(취소일때는 다 숨김)*/
    			if(statuscheck == 'C'){
    				$("#booking_delete").hide();
        			$("#booking_update").hide();
        			$("#booking_insert").hide();
    			} else {
    				$("#booking_delete").show();
        			$("#booking_update").show();
        			$("#booking_insert").hide();
    			}
    	});
    	// 예약 추가시 +버튼 클릭
    	$(document).on('click', '#btnAddMenu', function(){
    		var html = '';
    		html += '<div class="minusdiv">'
    		html += '<label for="bkMenuName" style="margin: 10px;">메뉴 :</label>';
    		html += '<select id="bkMenuNo" name="bkMenuNo" style="width:190px;">';
			html +=	'<c:forEach items="${menulist }" var="menulist">';
			html +=	'<option value="${menulist.menuNo }">${menulist.menuName }</option>';
			html += '</c:forEach></select><span> 수량 : </span>';
			html += '<select name="menuCount" class="menuCount">';
			html +=	'<option value="none"></option>'
        	html += '<c:forEach var="index" begin="1" end="10">'
        	html +=	'<option value="${index }">${index }</option>'
        	html += '</c:forEach>'
       		html += '</select>'
			html += '</div>'
			$("#menuName_Count").append(html);
    	})
    	// 예약 추가 수량 선택 시
    	$(document).on('change', '.menuCount', function(){
    		var menuNo = new Array;
    		var menuCount  = new Array;
    		$(".menuCount").each(function(i, item){
    			menuNo.push($(item).prev().prev().val());
    			menuCount.push($(item).val());
    			})
    			console.log(menuNo, menuCount);
    			
    			$.ajax({
    				type : "post",
    				url : "bursSelectMenuAjax",
    				traditional : true,
    				data : {"menuNo" : menuNo, "menuCount" : menuCount},
    				dataType : "json",
    				success : function(data){
    					$("#bkPrice").val(data);
    				}
    			})
    		})
    		
    	// 예약 추가시 -버튼 클릭
    	$(document).on('click','#btnMinusMenu', function(){
    		$(".minusdiv:last").remove();
    	})
/*     //사업자 해당 메뉴 가격 불러오기
    	function bkPriceChange(){
    		$.ajax({
   				type :'post' ,
   				url :'priceSelectAjax' ,
   				data : {"bkMenuNo" : $("#bkMenuNo").val()},
   				success : function(data){
   					$("#bkPrice").val(data);
   				},
   				error : function(){
   					alert("통신오류");
   				}
   			})
    	}; */
    	/* 사업자 예약 직접 추가 ajax */
    	function fnBookingAdd(){
    		if (confirm("매장 예약 추가시 직접 결제를 받아 주세요. 추가하기겠습니까??")){    //확인
    			/* 정규표현식 */
        		var phoneReg = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
        		/* 추가시 입력 체크 */
        		if($("#bkname").val() == ''){
        			alert("이름을 입력하세요")
            		return;
        		} else if(!phoneReg.test($("#bkphone").val())){
            		alert("핸드폰번호 확인하세요")
            		$("#bkphone").val("").focus();
            		return;
            	} else if(($("#bkdate").val()) == ''){
            		alert("날짜를 선택하세요")
            		return;
            	} else if(($("#bktime").val()) == ''){
            		alert("시간을 선택하세요")
            		return;
            	} else if(($("#bkPrice").val()) == ''){
            		alert("메뉴를 선택하세요")
            		return;
            	}
    			$.ajax({
       				type :'post' ,
       				url :'bursaddAjaxCafe' ,
       				data : $("#bookingForm").serialize(),
       				success : function(data){
       					alert(data); 
       					location.href = "burscheck";
       				}
       			})
    		}else{   //취소
    		    return;
    		}	
    	};
    	/* 사업자 예약 직접 취소 ajax */
    	function fnBookingDelete(){
    		if (confirm("취소하시겠습니까?")){    //확인
    			$.ajax({
        			type : 'post',
        			url : 'burscancleAjax ',
        			data : $("#bookingForm").serialize(),
        			success : function(data){
        				alert(data);
        				location.href = "burscheck";
        			}
        		})
    		}else{   //취소
    		    return;
    		}	
    	}
    	function fnBookingUpdate(){
    		if (confirm("수정하시겠습니까?")){    //확인
    			/* 정규표현식 */
        		var phoneReg = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
        		/* 추가시 입력 체크 */
        		if($("#bkname").val() == ''){
        			alert("이름을 입력하세요")
            		return;
        		} else if(!phoneReg.test($("#bkphone").val())){
            		alert("핸드폰번호 확인하세요")
            		$("#bkphone").val("").focus();
            		return;
            	} else if(($("#bkdate").val()) == ''){
            		alert("날짜를 선택하세요")
            		return;
            	} else if(($("#bktime").val()) == ''){
            		alert("시간을 선택하세요")
            		return;
            	} else if(($("#bkPrice").val()) == ''){
            		alert("메뉴를 선택하세요")
            		return;
            	}
    			$.ajax({
        			type : 'post',
        			url : 'bursupdateCafe',
        			data : $("#bookingForm").serialize(),
        			success : function(data){
        				alert(data);
        				location.href = "burscheck";
        			}
        		})
    		}else{   //취소
    		    return;
    		}	
    	}
    </script>
	<script>
		/* 상단 예약상태 select 부분 선택 시 */
    	$("#bkStatus").change(function(){
    		var status = $(this).val();
    		if($(this).val() == '전체'){
    			$.ajax({
    				type : 'post',
        			url : 'allStatusCafe',
        			data : {"day": $("#todayDate").val()},
        			dataType : "json",
    				success : function(list){
    					var html = '';
    					for(var i =0 ;  i <list.length;i++){
    						html += "<tr class='bookingList' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='@mdo'  style='cursor: pointer''>"
                            html += "<td class='l1'>"+list[i].bkNo+"</td>"
                            html += "<td class='l2'>"+list[i].umId+"</td>"
                            html += '<td class="l3">'+list[i].bkName+'</td>'
                            html += '<td class="l4">'+list[i].bkPhone +'</td>'
                            html += '<td>'
                           if(list[i].bkStatus == 'R'){
                        	   html +="예약"
                            } else if(list[i].bkStatus == 'C'){
                            	 html +="취소"
                            } else if(list[i].bkStatus == 'M'){
                            	 html +="매장예약"
                            }
                            html += '</td>'
                            html += '<td class="l5">'+list[i].bkDate+'</td>'
                            html += '<td class="l6">'+list[i].bkTime+'</td>'
                            if(list[i].menuCount == 1){
                            	html += '<td class="l7">'+list[i].menuName+'</td>'
                            } else {
                            	html += '<td class="l7"  style="font-size:14px">'+list[i].menuName+' 외 '+(list[i].menuCount-1)+'건'+'</td>'
                            }
                            html += '<td class="l8">'+list[i].bkTotalPrice+'원</td>'
                            html += '<td class="l9">'
                            if(list[i].bkRequire == null){
                            	 html +="X"
                            } else {
                            	 html +="O"
                            }
                            html += '</td>'
                            html += '<td  class="l10" style="display: none">'+list[i].bkRequire+'</td>'
                            html += ' <td  class="l11"   style="display: none">'+list[i].bkStatus+'</td>'
                            html += '</tr>'
    					};
    					$("#reservationListTbody").children().remove()
    					$("#reservationListTbody").append(html);
    				}
    			})
    		} else {
    			$.ajax({
    				type : 'post',
        			url : 'selectStatusDayCafe ',
        			data : {"day": $("#todayDate").val(), "status": $("#bkStatus").val()},
        			dataType : "json",
    				success : function(list){
    					var html = '';
    					for(var i =0 ;  i <list.length;i++){
    							html += "<tr class='bookingList' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='@mdo'  style='cursor: pointer''>"
                                html += "<td class='l1'>"+list[i].bkNo+"</td>"
                                html += "<td class='l2'>"+list[i].umId+"</td>"
                                html += '<td class="l3">'+list[i].bkName+'</td>'
                                html += '<td class="l4">'+list[i].bkPhone +'</td>'
                                html += '<td>'
                               if(list[i].bkStatus == 'R'){
                            	   html +="예약"
                                } else if(list[i].bkStatus == 'C'){
                                	 html +="취소"
                                } else if(list[i].bkStatus == 'M'){
                                	 html +="매장예약"
                                }
                                html += '</td>'
                                html += '<td class="l5">'+list[i].bkDate+'</td>'
                                html += '<td class="l6">'+list[i].bkTime+'</td>'
                                if(list[i].menuCount == 1){
                                	html += '<td class="l7">'+list[i].menuName+'</td>'
                                } else {
                                	html += '<td class="l7"  style="font-size:14px">'+list[i].menuName+' 외 '+(list[i].menuCount-1)+'건'+'</td>'
                                }
                                html += '<td class="l8">'+list[i].bkTotalPrice+'원</td>'
                                html += '<td class="l9">'
                                if(list[i].bkRequire == null){
                                	 html +="X"
                                } else {
                                	 html +="O"
                                }
                                html += '</td>'
                                html += '<td  class="l10" style="display: none">'+list[i].bkRequire+'</td>'
                                html += ' <td  class="l11"   style="display: none">'+list[i].bkStatus+'</td>'
                                html += '</tr>'
    					}
    					$("#reservationListTbody").children().remove()
    					$("#reservationListTbody").append(html);
    				}
    			})
    		}
    	})
    	/* 상단 날짜 선택시 조회 */
    	$("#todayDate").change(function(){
    		if($("#bkStatus").val() == '전체'){
    			$.ajax({
    				type : 'post',
        			url : 'allStatusCafe',
        			data : {"day": $("#todayDate").val()},
        			dataType : "json",
    				success : function(list){
    					var html = '';
    					for(var i =0 ;  i <list.length;i++){
    						html += "<tr class='bookingList' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='@mdo'  style='cursor: pointer''>"
                                html += "<td class='l1'>"+list[i].bkNo+"</td>"
                                html += "<td class='l2'>"+list[i].umId+"</td>"
                                html += '<td class="l3">'+list[i].bkName+'</td>'
                                html += '<td class="l4">'+list[i].bkPhone +'</td>'
                                html += '<td>'
                               if(list[i].bkStatus == 'R'){
                            	   html +="예약"
                                } else if(list[i].bkStatus == 'C'){
                                	 html +="취소"
                                } else if(list[i].bkStatus == 'M'){
                                	 html +="매장예약"
                                }
                                html += '</td>'
                                html += '<td class="l5">'+list[i].bkDate+'</td>'
                                html += '<td class="l6">'+list[i].bkTime+'</td>'
                                if(list[i].menuCount == 1){
                                	html += '<td class="l7">'+list[i].menuName+'</td>'
                                } else {
                                	html += '<td class="l7"  style="font-size:14px">'+list[i].menuName+' 외 '+(list[i].menuCount-1)+'건'+'</td>'
                                }
                                html += '<td class="l8">'+list[i].bkTotalPrice+'원</td>'
                                html += '<td class="l9">'
                                if(list[i].bkRequire == null){
                                	 html +="X"
                                } else {
                                	 html +="O"
                                }
                                html += '</td>'
                                html += '<td  class="l10" style="display: none">'+list[i].bkRequire+'</td>'
                                html += ' <td  class="l11"   style="display: none">'+list[i].bkStatus+'</td>'
                                html += '</tr>'
    					}
    					$("#reservationListTbody").children().remove()
    					$("#reservationListTbody").html(html);
    				}
    			})
    		} else {
    		$.ajax({
				type : 'post',
    			url : 'selectStatusDayCafe',
    			data : {"day": $("#todayDate").val(), "status": $("#bkStatus").val()},
    			dataType : "json",
				success : function(list){
					var html = '';
					for(var i =0 ;  i <list.length;i++){
						html += "<tr class='bookingList' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='@mdo'  style='cursor: pointer''>"
                            html += "<td class='l1'>"+list[i].bkNo+"</td>"
                            html += "<td class='l2'>"+list[i].umId+"</td>"
                            html += '<td class="l3">'+list[i].bkName+'</td>'
                            html += '<td class="l4">'+list[i].bkPhone +'</td>'
                            html += '<td>'
                           if(list[i].bkStatus == 'R'){
                        	   html +="예약"
                            } else if(list[i].bkStatus == 'C'){
                            	 html +="취소"
                            } else if(list[i].bkStatus == 'M'){
                            	 html +="매장예약"
                            }
                            html += '</td>'
                            html += '<td class="l5">'+list[i].bkDate+'</td>'
                            html += '<td class="l6">'+list[i].bkTime+'</td>'
                            if(list[i].menuCount == 1){
                            	html += '<td class="l7">'+list[i].menuName+' '+list[i].bkmCount+'개'+'</td>'
                            } else {
                            	html += '<td class="l7"  style="font-size:14px">'+list[i].menuName+' 외 '+(list[i].menuCount-1)+'건'+'</td>'
                            }
                            html += '<td class="l8">'+list[i].bkTotalPrice+'원</td>'
                            html += '<td class="l9">'
                            if(list[i].bkRequire == null){
                            	 html +="X"
                            } else {
                            	 html +="O"
                            }
                            html += '</td>'
                            html += '<td  class="l10" style="display: none">'+list[i].bkRequire+'</td>'
                            html += ' <td  class="l11"   style="display: none">'+list[i].bkStatus+'</td>'
                            html += '</tr>'
					}
					$("#reservationListTbody").children().remove()
					$("#reservationListTbody").html(html);
				}
			})
    		}
    	})
    	
    			/* 내정보 관리 이동 */
		    	$("#k_info_menu").click(function() {
		    	location.href="buminfocheck";
		    	});		
						
			/* 업체등록 */
			$("#k_bu_eroll_menu").click(function() {			
				location.href="bucompany";
			});
			
			//예약관리 - 예약 조회/수정
			$("#k_re_cu_menu").click(function() {
				location.href = "<%=request.getContextPath()%>/burscheck";
			});
			
			/* 예약관리 - 예약 메뉴 등록 */
			$("#k_re_menu_enroll").click(function() {
				location.href = "<%=request.getContextPath()%>/burmenu";
			});
			
			/* 토글 - 비밀번호 변경 */
		  	$("#k_pwdinfo").click(function() {
		  		location.href="buminfocheck";
			});
    
		</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>