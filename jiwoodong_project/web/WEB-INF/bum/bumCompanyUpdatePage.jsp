<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
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
<script>
	$()
</script>
<body>
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
						src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png"
						alt="mdo" width="60px">
					</a>
					<p style="font-size: 12px; width: 115px; margin: 5px;">환영합니다
						사업자님</p>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
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
	<!-- 내정보 관리 -->
	<article>

		<div id="k_info_content">

			<nav id="k_bu_eroll_top">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_info_menu" href="#" role="button"> 기본정보 </a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a class="nav-link dropdown"
						id="k_info_menu" href="#" role="button"> 내정보 삭제 </a></li>
				</ul>
			</nav>
				<form action="<%=request.getContextPath() %>/bucpupdate" method="post">
				<div>
					<!-- 사업자번호 읽기만 -->
					사업자 번호
					<p>
						<input type="text" value="${bvo.buNumber}" readonly>
					</p>
				</div>
				<div>
					이름
					<p>
						<input type="text" value="${bvo.buName}" readonly>
					</p>
				</div>
				<div>
					생년월일
					<p>
						<input type="text" value="${bvo.buBirth}" readonly>
					</p>
				</div>
				<!-- 아이디 읽기만 -->
				<div>
					아이디
					<p>
						<input type="text" value="${bvo.buId}" readonly>
					</p>
				</div>
				<div>
					변경할 비밀번호
				</div>
					<p>
						<input type="password" name ="buPwd" value="${bvo.buPwd}">
					</p>
				
				 <div>
					변경할 비밀번호 확인
					<p>
						<input type="password" name ="buPwd" value="${bvo.buPwd}">
					</p>
				</div>
							
				<div>
					이메일 주소
					<p>
						<input type="text" name ="buEmail" value="${bvo.buEmail}">
					</p>
				</div>
				<div>
					핸드폰번호('-'없이 입력하여주세요)
					<p>
						<input type="text" name ="buTel" id="k_tel" value="${bvo.buTel}"
							placeholder="000-0000-0000" maxlength="13">
					</p>
				</div>
				<div>
					<input type="button" id="k_cancle_btn" value="취소하기">
					<input type="submit" value="수정하기">
				</div>
			</form>
		</div>

	</article>
</content>
	
        
        <script>
        $("#k_info_content").show();
        
		/* 취소하기 btn */
		$("#k_cancle_btn").click(function() {
        	var result = confirm('메인페이지로 이동하시겠습니까?'); 
        	if(result) { 
        		//yes 
        		location.href="BumMainPage";
        		} else { 
        		//no 
        		}            
        });
        
        //유효성체크
        //$("#mId").focusout(function(){});

       /*  $("#btnenroll").click(function(){
            var mId = $("#mId").val().trim();
            var regExpId = /[A-Za-z0-9]{6,20}$/; 
            //var regExpId = /^[A-Za-z][A-Za-z0-9!]{2,4}$/;   // 첫글자는 영문자, 영문자숫자!_으로 3-5자 입력가능
            if(!regExpId.test(mId)){
                alert("아이디 입력란에는 영문자, 숫자를 사용한 6자이상 20자이하");
                $("#mId").focus();
                return false;
            } */
            
            $("#update_btn").click(function(){           
            var password = $("#buPwd").val().trim();
            if(!password || password != $("#buPwd_re").val().trim()){
                alert("패스워드 입력란과 확인란이 같지 않습니다.");
                $("#buPwd").val("");
                $("#buPwd_re").val("");
                $("#buPwd").focus();
                return false;
            }
          //   var regExpPassword = /^(?=.[A-Za-z])(?=.[0-9])(?=.*[^A-Za-z0-9]).{8,16}$/; // 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자
           /* if(!regExpPassword.test(buPwd)){
                alert("패스워드 입력란에는 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자");
                $("#buPwd").focus();
                return false;
            } */
                               	
            var num = password.search(/[0-9]/g);
       	 	var eng = password.search(/[A-Za-z]/ig);
       	 	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	       	 if(password.length < 8 || password.length > 16){
	       	  alert("패스워드 입력란에는 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자.");
	       	  return false;
	       	 }else if(password.search(/\s/) != -1){
	       	  alert("비밀번호는 공백 없이 입력해주세요.");
	       	  return false;
	       	 }else if(num < 0 || eng < 0 || spe < 0 ){
	       	  alert("패스워드 입력란에는 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자.");
	       	  return false;
	       	 }else {
	       		console.log("통과"); 
	       	    return true;
	       	 }


       var phone = $("#buTel").val().trim();
       var regExpPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/; // 숫자3-숫자3,4-숫자4
       if(!regExpPhone.test(phone)){
           alert("전화번호 입력란에는 000-0000-0000 형식");
           $("#buTel").focus();
           return false;
       }else if(phone == null){   	   
    	   alert("전화번호 입력란에는 000-0000-0000 형식");
    	   return false;
       }
        
     });
	</script> 

	<script src="https://code.highcharts.com/modules/data.js"></script> <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>