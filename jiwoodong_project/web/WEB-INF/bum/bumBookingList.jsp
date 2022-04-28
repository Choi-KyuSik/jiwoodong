<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        .dropdown-toggle,
        .dropdown {
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
        td, th{
            text-align: center;
            vertical-align: middle;
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
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown" id="k_info_menu" href="#" role="button">
                                        내정보 관리
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown" id="k_review_menu" href="#" role="button">
                                        리뷰관리
                                    </a>

                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown" id="k_bu_eroll_menu" href="#" role="button">
                                        업체등록
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        예약관리
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu">
                                        <li><a class="dropdown-item" id="k_re_menu_enroll" href="#">예약메뉴등록</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" id="k_re_cu_menu" href="#">예약 조회/수정</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown" id="k_us_info_menu" href="#" role="button">
                                        회원정보조회
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div style="float: right; margin: 0 30px 0 0;">
                <div class="dropdown text-end" id="p_top_profile">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                        data-bs-toggle="dropdown">
                        <img src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
                            alt="mdo" width="60px">
                    </a>
                    <p style="font-size: 12px; width: 115px; margin: 5px;">환영합니다 사업자님</p>
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
    <content>
        <article>
            <div id="k_us_info_content">
                <p>예약 조회</p>
                <!-- 예약상태 선택-->
                <select style="width: 100px; height: 30px;">
                    <option value="1"  selected>전체</option>
                    <option value="2">예약</option>
                    <option value="2">취소</option>
                  </select>
                <!-- 날짜선택 -->
                <input type="date" id="todayDate" style="height: 30px;">
                <!-- 검색 -->
                <nav class="navbar navbar-light">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
                <!-- 예약추가-->
                <button type="button" class="btn btn-primary" id="booking_add" style="float: right;margin-top: 8px;" class="bookingList" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">예약추가</button>
                <table class="table table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">예약번호</th>
                            <th scope="col">예약자ID</th>
                            <th scope="col">이름</th>
                            <th scope="col">핸드폰번호</th>
                            <th scope="col">예약날짜</th>
                            <th scope="col">예약시간</th>
                            <th scope="col">메뉴</th>
                            <th scope="col">금액</th>
                            <th scope="col">요청사항</th>
                        </tr>
                    </thead>
                    <tbody style="cursor: pointer;">
                    	<c:forEach items="${reservation }" var="reservation">                    
	                        <tr class="bookingList" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
	                            <td class="l1"><c:out value="${reservation.bkNo }"/> </td>
	                            <td class="l2"><c:out value="${reservation.umId }"/> </td>
	                            <td class="l3"><c:out value="${reservation.bkName }"/></td>
	                            <td class="l4"><c:out value="${reservation.bkPhone }"/></td>
	                            <td class="l5"><c:out value="${reservation.bkDate}"/> </td>
	                            <td class="l6"><c:out value="${reservation.bkTime }"/></td>
	                            <td class="l7"><c:out value="${reservation.menuName }"/></td>
	                            <td class="l8"><c:out value="${reservation.menuPrice }"/> 원</td>
	                            
	                            <td class="l9"><c:out value="${empty reservation.bkRequire ? 'X' : 'O'}"/></td>
	                            <td  class="l10" style="display: none"><c:out value="${reservation.bkRequire}"/></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </article>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 5%;">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">예약정보</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form id="bookingForm">
                    <label for="bkno" style="margin: 10px;">예약번호 :</label><input type="text" id="bkno" name="bkno" value="asdad"readonly ><br>
                    <label for="umid" style="margin: 10px;">아이디 :</label><input type="text" id="umid"  name ="umid" readonly><br>
                    <label for="bkname" style="margin: 10px;">이름 :</label><input type="text" id="bkname" name="bkname"><br>
                    <label for="bkphone" style="margin: 10px;">핸드폰번호 :</label><input type="tel" id="bkphone" name="bkphone"><br>
                    <label for="bkdate" style="margin: 10px;">예약날짜 :</label><input type="date" id="bkdate" name="bkdate"><br>
                    <label for="bktime" style="margin: 10px;">예약시간 :</label><input type="time" id="bktime" name="bktime"><br>
                    <label for="bkMenuNo" style="margin: 10px;">메뉴 :</label>
                    <select id="bkMenuNo" onchange="bkPriceChange()">
                    	<c:forEach  items="${menulist }" var="menulist">  
                    		<option  value="${menulist.menuNo }">${menulist.menuName }</option>
                    	</c:forEach>
                    </select>
                    <label for="bkPrice" style="margin: 10px;">금액 :</label><input type="text" id="bkPrice" name="bkPrice" readonly="readonly"/>
                    <label for="bkrequire" style="margin: 10px;">요청사항 :</label><textarea cols="55" rows="10" id="bkrequire" style="padding: 10px;"></textarea>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" id="booking_delete" class="btn btn-secondary" style="background-color: rgb(241, 77, 12);">삭제</button>
                  <button type="button" id="booking_update" class="btn btn-primary">수정하기</button>
                  <button type="button" id="booking_insert" class="btn btn-primary" onclick="fnBookingSave()">추가하기</button>
                </div>
              </div>
            </div>
          </div>
    </content>
    <script>
    $(function(){
    	/* 날짜선택 오늘날짜 */
    	var date = new Date();
    	$("#todayDate").val(date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2));
    });
	/* 예약 추가 버튼 */
    	$("#booking_add").click(function(){
    		$("#bkMenuNo option").removeAttr("selected");
    			$("#bkno").prev().hide();
    			$("#bkno").next().hide();
    			$("#bkno").hide();
    			$("#umid").prev().hide();
    			$("#umid").next().hide();
    			$("#umid").hide();
    			$("#booking_delete").hide();
    			$("#booking_update").hide();
    			$("#booking_insert").show();
    			$(".modal-body").children().children().val("");
    	});
    	$(".bookingList").click(function(){
    		$("#bkMenuNo option").removeAttr("selected");
    		var bkMenuName=$(this).children('.l7').html();
    			$("#bkno").prev().show();
    			$("#bkno").next().show();
    			$("#bkno").show();
    			$("#umid").prev().show();
    			$("#umid").next().show();
    			$("#umid").show();

    			$("#bkno").val($(this).children('.l1').html());
    			$("#umid").val($(this).children('.l2').html());
    			$("#bkname").val($(this).children('.l3').html());
    			$("#bkphone").val($(this).children('.l4').html());
    			$("#bkdate").val($(this).children('.l5').html().replaceAll("/","-").trim());
    			$("#bktime").val($(this).children('.l6').html());
    			$("#bkMenuNo option").each(function (i,item){
    				if($("#bkMenuNo option").eq(i).text() == bkMenuName){
    					$("#bkMenuNo option").eq(i).attr("selected","selected");
    				}
    			});
    			$("#bkPrice").val($(this).children('.l8').html());
    			if($('.l9').html()== 'O'){
    				$("#bkrequire").val($(this).children('.l10').html());
    			} else {
    			$("#bkrequire").val($(this).children('.l9').html());
    			}
    			
    			
    			$("#booking_delete").show();
    			$("#booking_update").show();
    			$("#booking_insert").hide();
    	});
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
    	};
    	function fnBookingSave(){
   			$.ajax({
   				type :'post' ,
   				url :'bursaddAjax' ,
   				data : $("#bookingForm").serialize(),
   				success : function(data){
   					console.log(data);
   				},
   				error : function(){
   					alert("통신오류");
   				}
   			})
    	};
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>