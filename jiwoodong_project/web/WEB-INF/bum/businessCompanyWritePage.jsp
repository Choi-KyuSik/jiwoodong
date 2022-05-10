<!DOCTYPE html>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 주소 daum우편번호 API -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 이미지 등록 -->
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>사업자 업체등록</title>
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

#k_bu_eroll_content {
	width: 1200px;
	height: 1000px;
	padding: 30px;
	display: none;
	margin: 20px auto 0;
	background-color: rgb(241, 241, 241);
	border-radius: 15px;
}

/* 컨텐트안 제목 */
article>div>p {
	text-align: center;
	font-weight: bold;
	padding-top: 20px;
	font-size: large;
}

/* 내정보 관리 */
.k_company {
	font-weight: bold;
}

/* 업체등록 */
#k_bu_eroll_top {
	display: flex;
}

.k_essential_info {
	color: red;
	font-size: 0.7rem;
	margin: 0 0 10px 0;
}

/* 업체등록 : 손은진 */
.s_us_th {
	text-align: center;
	vertical-align: middle;
	width: 250px;
}

.s_row {
	width: 1200px;
	margin: 0 auto;
	padding-top: 30px;
	margin-top: 30px;
}

#s_us_info_btn {
	text-align: center;
	margin-top: 30px;
}

.border_none {
	border: 0;
}

#s_us_notice {
	vertical-align: middle;
	color: red;
}

#s_bu_pwd {
	width: 500px;
}

#s_id_style {
	display: inline-block;
	color: #0d6efd;
	font-weight: bold;
}

#s_us_push_right_btn {
	display: inline-block;
	color: gray;
	font-size: .8em;
}
/* 업체등록 - 주소 등록 부분 */
.table-light_add {
	width: 700px;
}

#companyDtInfo {
	width: 100%;
	hight: 250px;
	resize: none;
}
</style>
</head>
<body>
	<c:if test="${list[0].cpSignyn eq 'N'}">
			<script>
			alert('현재 신청하신 업체등록 심사중입니다.'); 
			history.back();
			</script>
	</c:if>
	<c:if test="${list[0].cpSignyn eq 'Y'}">
			<script>
			alert('업체등록은 계정당 한번만 등록이 가능합니다.'); 
			history.back();
			</script>
	</c:if>
	<c:if test="${list[0].cpSignyn eq 'R'}">
			<script>
			alert('업체등록이 거절되었습니다. 업체등록을 다시 등록해주시길 바랍니다. 거절사유: ${list[0].cpRejectMsg}');
			</script>
	</c:if>
	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="BumMainPage" id="k_logo"><img
					src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
					width="80px" alt="logo"></a>
			</div>
			<div id="p_top_menu">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_info_menu" role="button"> 내정보 관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<input type="hidden" id="cpNo" name="cpNo" value="${cpNo }" />
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_review_menu" href="#" role="button"> 리뷰관리 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_bu_eroll_menu" href="bucompany" role="button"> 업체등록 </a></li>
							</ul>
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown"> 예약관리 </a>
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
									id="k_us_info_menu" href="#" role="button"> 회원정보 조회 </a></li>
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
					<p style="font-size: 12px; margin: 5px;">
						환영합니다
						<%= session.getAttribute("buName") %>님
					</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" id="k_pwdinfo">비밀번호 재설정</a></li>
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


	<article>
		<div class="s_row">
			<div id="c_us_info_edit_info">
				<form id="frm" method="post" action="">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4" style="font-size: 2em;">업체 등록</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none; background-color: var(- -bs-table-bg);">업체명
									<span class="k_essential_info">*필수</span>
								</th>
								<td colspan="3" class="table-light" id="s_us_no"><input
									type="text" class="form-control" name="cpName"
									placeholder="대표업체명을 입력해주세요." value="" /></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">업종을 선택<span
									class="k_essential_info">*필수</span></th>
								<td class="table-light" id="s_bu_pwd">
								<select name="cpCategory" class="form-control" id="selectCategory">
										<option value="cpCategory">업종을 선택해주세요.</option>
										<option value="미용실">미용실</option>
										<option value="카페">카페</option>
										<option value="호텔">호텔</option>
								</select></td>
								<td colspan="2" class="table-light" id="s_us_notice_1"><span
									id="s_bu_pwd_check_1" style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">상세설명</th>
								<td class="table-light"><textarea class="form-control"
										id="companyDtInfo" placeholder="우리업체를 고객들에게 자세히 설명해주세요."
										name="cpExplain"></textarea></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
							<tr>
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">업체 사진 추가</th>
								<td class="table-light" id="s_us_no">
									<!-- 업로드 버튼 1,2,3 --> 사진1:<input type="hidden"
									role="uploadcare-uploader"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" /> <br>
									<br> 사진2:<input type="hidden" role="uploadcare-uploader2"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" /> <br>
									<br> 사진3:<input type="hidden" role="uploadcare-uploader3"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" /> <!-- hidden input에 주소 url을 value로 받을거여서 같이 만듬 세트로 놔두면 편할 듯, 위에거가 파일등록 버튼 -->
									<input type="hidden" name="fileUrl1" id="fileUrl1"> <input
									type="hidden" name="fileUrl2" id="fileUrl2"> <input
									type="hidden" name="fileUrl3" id="fileUrl3">
								</td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>
							<tr id="hotelclose">
								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;">운영 구분<span
									class="k_essential_info">*필수</span></th>
								<td class="table-light">
								<input type="radio" name="cpClassify" value="n" checked style="display:none;">
								<input type="radio"
									class="form-check-input" id="k_everyday" value="B"
									name="cpClassify"> <label class="form-check-label"
									for="k_everyday" id="k_everyday">평일만 운영해요</label> <input
									type="radio" id="k_neveryday" value="A"
									class="form-check-input" name="cpClassify"> <label
									class="form-check-label" id="k_neveryday" for="k_neveryday">주말까지
										운영해요</label>
									<div id="k_Classify">
										<div id=k_everyday_content>
											<div>
												<hr>
												영업시작 시간: <input type="time" id="k_timebar" name="cpOpenTime">
												영업마감 시간: <input type="time" id="k_timebar"
													name="cpCloseTime">

											</div>
										</div>
										<div id=k_neveryday_content>
											<div>
												<hr>
												영업시작 시간: <input type="time" name="cpOpenTime"> 영업마감
												시간: <input type="time" name="cpCloseTime">
											</div>
										</div>
									</div></td>
								<td colspan="2" class="table-light"><span
									style="display: none;"></span></td>
							</tr>

							<tr>

								<th class="table-primary s_us_th"
									style="-bs-table-accent-bg: none;"><label for="addr">주소</label><span
									class="k_essential_info">*필수</span></th>
								<td class="table-light" colspan="3">
									<!-- 우편번호 -->
									<div>
										<input type="text" class="form-control" name="cpPostcode"
											id="postcode"
											style="width: 200px; display: inline-block; margin: 0 0 5px 10px;"
											value="" placeholder="우편번호" />
										<!-- 주소찾기 -->
										<input type="button"
											style="width: 80px; display: inline-block; color: white; font-size: 0.7rem; background-color: cornflowerblue;"
											class="form-control" id="postcode_btn" value="주소 찾기">
										<br>
									</div> <!-- 주소 --> <input type="text" class="form-control"
									id="roadAddress"
									style="width: 300px; display: inline-block; margin-left: 10px;"
									name="cpAddress" value="" placeholder="주소" /> <span id="guide"
									style="color: #999; display: none"></span> <!-- 상세주소 --> <input
									type="text" class="form-control" id="jibunAddress"
									style="display: inline-block; width: 400px; margin-left: 10px;"
									name="cpDtaddress" value="" placeholder="상세주소" />
								</td>
							</tr>

						</tbody>
					</table>
					<div id="s_us_info_btn">
						<input type="button" id="back_btn"
							class="btn btn-danger pull-right s_ad_nt_btn" value="취소하기">
						<input type="button" id="s_bu_check_btn"
							class="btn btn-primary pull-right s_ad_nt_btn" value="등록하기">
					</div>
					<hr>
				</form>
			</div>
		</div>
	</article>


	<c:if test="${list[0].cpSignyn eq 'R'}">
		<script>
			$("#s_bu_check_btn").attr("id", "s_bu_check_btn2");
			</script>
	</c:if>
	<%-- <content>
   <article>
      <div class="s_row">
         <div id="c_us_info_edit_info">
            <form id="frm" method="post" action="">
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <td colspan="3"><p id="s_id_style">${bvo.buId}</p>님의 정보를
                           안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th class="table-primary s_us_th"
                           style="-bs-table-accent-bg: none;">아이디</th>
                        <td colspan="2" class="table-light" id="s_us_no"><input
                           type="text" class="form-control border_none" name="buId"
                           maxlength="300" readonly="readonly" value="${bvo.buId}" /></td>
                     </tr>
                     <tr>
                        <th class="table-primary s_us_th"
                           style="vertical-align: middle;">비밀번호</th>
                        <td class="table-light" id="s_us_pwd"><input
                           type="password" class="form-control" name="buPwd"
                           maxlength="300" id="buPwd" value="" placeholder="비밀번호를 입력해주세요." /></td>
                        <td class="table-light" id="s_us_notice"><span
                           id="s_us_pwd_check" style="display: none;">현재 비밀번호가 일치하지
                              않습니다.</span></td>
                     </tr>
                  </tbody>
               </table>
               <div id="s_us_info_btn">
                  <input type="button" id="s_bu_check_btn"
                     class="btn btn-primary pull-right s_ad_nt_btn" value="확인">
                  <input type="button" id="back_btn"
                     class="btn btn-secondary pull-right s_ad_nt_btn" value="취소">
               </div>
            </form>
         </div>
      </div>
   </article>
   </content> --%>


	<script>
   	/* 운영구분에 따른 운영시간 구분 */
   	$("#selectCategory").change(function(){
   		if($(this).val() == '호텔'){
   			$("#hotelclose").hide();
   		} else {
   			$("#hotelclose").show();
   		}
   	})
   	
   
   
      $("#k_cancle_btn").click(function() {
         var result = confirm('메인페이지로 이동하시겠습니까?');
         if (result) {
            //yes 
            location.href = "BumMainPage";
         } else {
            //no 
         }
      });
		$("#s_bu_check_btn2").click(function() {
		         if (confirm("업체 등록은 수정이 불가능합니다 등록하시겠습니까?") == true) {
		            var frmEl = $("#frm");
		            frmEl.attr("action", "bucompanydoupdate");
		            frmEl.attr("method", "post");
		            frmEl.submit();
		         } else {
		            return;
		         }
		      });
      $("#s_bu_check_btn").click(function() {
         if (confirm("업체 등록은 수정이 불가능합니다 등록하시겠습니까?") == true) {
            var frmEl = $("#frm");
            frmEl.attr("action", "bucompanydo");
            frmEl.attr("method", "post");
            frmEl.submit();
         } else {
        	 return;
         }
      });

      $("#k_everyday").click(function() {
         $("#k_everyday_content").show();
         $("#k_neveryday_content").hide();
      });

      $("#k_neveryday").click(function() {
         $("#k_neveryday_content").show();
         $("#k_everyday_content").hide();
      });

      $(document).ready(function() {
         $("#k_neveryday_content").hide();
         $("#k_everyday_content").hide();
      });

      //주소찾기
      $("#postcode_btn")
            .click(
                  function sample4_execDaumPostcode() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                                 var extraRoadAddr = ''; // 참고 항목 변수

                                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                 }
                                 // 건물명이 있고, 공동주택일 경우 추가한다.
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                 if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' ('
                                          + extraRoadAddr + ')';
                                 }

                                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                 document.getElementById("postcode").value = data.zonecode;
                                 document
                                       .getElementById("roadAddress").value = roadAddr;
                                 /* document
                                       .getElementById("jibunAddress").value = data.jibunAddress; */

                                 var guideTextBox = document
                                       .getElementById("guide");
                                       
                                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                 /* if (data.autoRoadAddress) {
                                    var expRoadAddr = data.autoRoadAddress
                                          + extraRoadAddr;
                                    guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                          + expRoadAddr + ')';
                                    guideTextBox.style.display = 'block';

                                 } else if (data.autoJibunAddress) {
                                    var expJibunAddr = data.autoJibunAddress;
                                    guideTextBox.innerHTML = '(예상 지번 주소 : '
                                          + expJibunAddr + ')';
                                    guideTextBox.style.display = 'block';
                                 } else {
                                    guideTextBox.innerHTML = '';
                                    guideTextBox.style.display = 'none';
                                 }*/
                              } 
                           }).open();
                  });
      
      
         /*이미지등록1 */
         var singleWidget = uploadcare
               .SingleWidget('[role=uploadcare-uploader]');
   
         singleWidget.onUploadComplete(function(info) {
            $("#fileUrl1").val(info.cdnUrl);
         });
         /* 이미지등록2 */
         var singleWidget = uploadcare
               .SingleWidget('[role=uploadcare-uploader2]');
   
         singleWidget.onUploadComplete(function(info) {
            $("#fileUrl2").val(info.cdnUrl);
         });
         /* 이미지등록3 */
         var singleWidget = uploadcare
               .SingleWidget('[role=uploadcare-uploader3]');
   
         singleWidget.onUploadComplete(function(info) {
            $("#fileUrl3").val(info.cdnUrl);
         });

      $("#k_info_menu").click(function() {
         var frm = $("#frm");
         frm.attr("action", "buminfocheck");
         frm.attr("method", "post");
         frm.submit();
      });
    	//업체등록
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
	    	var frm = $("#frm");
				frm.attr("action", "buminfocheck");
				frm.attr("method", "post");
				frm.submit();
		});
		/* 리뷰페이지 */
		$("#k_review_menu").click(function() {
			var cpNo = $("#cpNo").val();
			console.log("cpNo ? : " + cpNo);
			console.log("cpNo 의 타입 ? : " + typeof(cpNo));
			location.href="bumreviewlist?cpNo=" + cpNo;
		});		
				
   </script>

	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>