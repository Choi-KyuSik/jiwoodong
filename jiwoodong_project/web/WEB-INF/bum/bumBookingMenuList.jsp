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
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<link rel="shortcut icon" href="#">
<title>사업자 메뉴등록</title>
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
</style>
</head>
<body>
	<header>
		<div id="p_main_top">
			<div id="p_top_logo">
				<a href="<%=request.getContextPath()%>/BumMainPage" id="k_logo"><img
					src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
					width="80px" alt="logo"></a>
			</div>
			<div id="p_top_menu">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a class="nav-link dropdown"
									id="k_info_menu" href="" role="button"> 내정보 관리 </a></li>
							</ul>
							<ul class="navbar-nav">
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
											href="<%=request.getContextPath()%>/burmenu">예약메뉴등록</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" id="k_re_cu_menu"
											href="<%=request.getContextPath()%>/burscheck">예약 조회/수정</a></li>
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
						<li><a class="dropdown-item" id="k_pwdinfo" href="">비밀번호 재설정</a></li>
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
		<div>
			<p>업체 메뉴</p>
			<button type="button" class="btn btn-primary"
				style="float: right; margin-right: 35px;" data-bs-toggle="modal"
				data-bs-target="#exampleModal" data-bs-whatever="@mdo">메뉴등록</button>
			<div
				style="clear: both; display: flex; flex-wrap: wrap; justify-content: space-around;">
				<c:forEach items="${MenuList }" var="list">
					<form action="burmenudelete" method="post" id="frmMenuDelete">
						<div style="margin: 3%;">
							<div class="card" style="width: 19rem; height: 410px">
								<c:if test="${empty list.fileUrl}">
									<img src="https://as.hanssem.com/images/quick/no_cnt.gif"
										class="card-img-top" alt="메뉴사진" height="300px">
								</c:if>
								<c:if test="${not empty list.fileUrl}">
									<img src="${list.fileUrl}" class="card-img-top" alt="${list.flRename }"
										style="height: 300px; overflow: hidden;">
								</c:if>
								<div class="card-body">
									<h5 class="card-title" style="float: left; font-weight: bold;">${list.menuName }</h5>
									<span
										style="float: right; margin-right: 3px; font-weight: bold; font-size: 17px;">${list.menuPrice }원</span>
									<p style="clear: both; height: 72px; overflow:"hidden;">${list.menuExplain }</p>
									<input type="hidden" value="${list.menuNo }" name="menuNo"> 
									<input type="button" class="btn btn-primary btn-sm menuDelete" value="메뉴삭제"
										style="background-color: rgb(241, 77, 12); float: right">
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
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
					<h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="burmenuadd" method="post" id="frmMenuAdd">
						<label for="menuName" style="margin: 10px;">메뉴 :</label> <input
							type="text" id="menuName" name="menuName" style="width: 250px"
							placeholder="10자 이내로 입력해 주세요"><br> <label
							for="menuPrice" style="margin: 10px;">가격 :</label> <input
							type="text" id="menuPrice" name="menuPrice" style="width: 250px"
							placeholder="숫자만 입력해 주세요"><br> <label
							for="menuExplain" style="margin: 10px;">메뉴설명 :</label>
						<textarea cols="55" rows="10" id="menuExplain"
							style="padding: 10px;" name="menuExplain"
							placeholder="50자 이내로 입력해 주세요"></textarea>
							<input
							    type="hidden"
							    role="uploadcare-uploader"
							    data-public-key="c545e991d9de45462444"
							    data-tabs="file camera url facebook gdrive gphotos"
							/>
						<input type="hidden" name="fileUrl" id="fileUrl">
						<!-- <input type="file" style="margin: 10px;" name="file"> -->
						<div class="modal-footer" style="margin-top: 10px">
							<input type="button" id="booking_insert" class="btn btn-primary menuAdd"
								value="추가하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	//정규표현식
		$("#menuName").keyup(function(){
			var regname = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{0,10}$/;
			var $str = $(this).val();
			 if(!regname.test($str)){
		            alert("10자 이내로 작성해주세요");
		            $("#menuName").val("");
		            $("#menuName").focus();
			 }
		});
		$("#menuPrice").keyup(function(){
			var regtest = /^[0-9]+$/ ;
			var $str = $(this).val();
			 if(!regtest.test($str)){
		            alert("숫자만 입력해주세요.");
		            $(this).val("")
		            $(this).focus();
			 }
		});
		$("#menuExplain").keyup(function(){
			var regtest = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{0,50}$/ ;
			var $str = $(this).val();
			 if(!regtest.test($str)){
		            alert("50자 이내로 작성해주세요.");
		            $(this).val("")
		            $(this).focus();
			 }
		});
	</script>
	<script>
    var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
    
    singleWidget.onUploadComplete(function(info){
    	$("#fileUrl").val(info.cdnUrl);
    });
</script>
	<script>
	$(".menuDelete").click(function(){
		if (confirm("삭제하시겠습니까?")){
			$(this).parent().parent().parent().parent().submit();
		} else {
			return;
		}
	})
	$(".menuAdd").click(function(){
		if (confirm("추가하시겠습니까?")){
			if($("#menuName").val() == ""){
				alert("메뉴명을 입력해주세요")
				return;
			} else if($("#menuPrice").val() == ""){
				alert("가격을 입력해주세요")
				return;
			}
			 
			$("#frmMenuAdd").submit();
		} else {
			return;
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