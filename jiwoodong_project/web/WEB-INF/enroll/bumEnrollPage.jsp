    <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bum_enrollpage.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css"> 
<%@page import="java.sql.SQLException"%>
<%@page import="kh.semi.jwd.common.jdbc.JdbcDBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- google font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap');
    </style>


</head>
<body style="background: none;">
<section>
	<div id="bgcolor" style="background-image: url(https://cdn.discordapp.com/attachments/692994434526085184/970185730959749120/34234234324.png);">
	<header style="height: 150px;">
		<div class="p_main_top">
			<div id="p_main_logo_bar">
				<div id="p_main_logo">
					<a href="<%=request.getContextPath()%>"><img
						src="https://cdn.discordapp.com/attachments/958566133752016901/966262090698457108/logo.png"
						alt="지우동로고"></a>
				</div>
				<div id="p_main_bar">
					<ul class="nav justify-content-end" style="font-size: 1.1em;">
						<li class="nav-item"><a class="nav-link" href="/jwd/#about">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/jwd/#service">Service</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/jwd/#notice">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="enrollMain">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="adminLogin">관리자로그인</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>


<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto" style="margin-top: 0;">
            <h4 class="mb-3" id="s_tt"><strong>사업자 회원가입</strong></h4>
            <form id="frm" class="validation-form" name="bu_enroll" novalidate >
            
            <div class="row">
                  <div class="mb-3" style="display: inline-block; width: 100%; margin-left: 2%;"> 
                        <label for="bu_num" style="display: block;">사업자 번호</label> 
                        <input type="text" class="form-control" id="bu_num" name="bu_num" placeholder="000-00-00000" required="required" style="margin-bottom: 10px; margin-right: 5px;">
                        <div class="invalid-feedback"> 사업자번호를 조회해주세요.</div>
                        <input type="button" id="bu_num_btn" class="btn btn-primary" value="사업자 번호 조회" required="required">
                        <br><font id="checkbunum" size ="1"></font>
                    </div>
                    <div class="col-md-6 mb-3" style="margin-bottom: 20px;">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required="required">
                        <div class="invalid-feedback"> 이름을 입력해주세요.
                        </div>
                    </div>
					<div class="col-md-6 mb-3" style="margin-bottom: 20px;">
                        <label for="birth">생년월일</label> 
                        <input type="date" class="form-control" id="birth" name="birth" placeholder="YYYY/MM/DD" required="required">
                        <div class="invalid-feedback"> 생년월일를 입력해주세요. </div>
                    </div>
                    <div class="col-md-8 mb-3" style="margin-bottom: 20px;"> 
                        <label for="gender">성별</label> 
                        <select class="custom-select d-block w-100" style="font-size: 1em;" id="gender" name="gender" required="required">
                            <option value="F">여자</option>
                            <option value="M">남자</option>

                    </select>
                    <div class="invalid-feedback"> 성별을 선택해주세요. </div>
                </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone">핸드폰 번호</label> 
                        <input type="text" class="form-control" id="phone" placeholder="010-0000-0000" name="phone" required="required">
                        <div class="invalid-feedback"> 핸드폰번호를 입력해주세요. </div>
                    </div>
                </div>
                <div class="mb-3" style=" margin-bottom: 4px!important; "> 
                    <label for="email" style="display: block;">이메일</label> 
                    <input type="email" class="form-control" id="email" name="email" placeholder="email1@example.com"  required="required"  maxlength="30" style="width: 80%; margin-right: 5px;">
                    <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    <!-- <input type="button" id="email_btn" class="btn btn-primary" value="인증번호 발송" onsubmit="return email_btn()" onclick="return email_btn()" > -->
                </div>
                 
<!--                 <div class="mb-3" id="email_check" style="margin-bottom: 4px!important; float: right; width: 230px;"> 
                    <label for="email_check" style="line-height: 80px;">인증번호</label> 
                    <input type="email" class="form-control" id="email_check_no" name="email_check_no" required="required" maxlength="10" disabled="disabled" style="margin: 0 5px;">
                    <input type="button" class="btn btn-primary" id="email_check_btn" name="email_check_btn" value="인증" onclick="email_check_btn()"  disabled="disabled">
                    <input type="hidden" name="authPass" id="authPass" value="false">
                    <div class="invalid-feedback"> 인증번호를 입력해주세요. </div>
                    
                </div> -->
                <div class="mb-3" style="clear: both; margin-bottom: 20px;">
                    <label for="bu_id" style="display: block; width: 100%;float: left;"">아이디</label>
                    <input type="text" class="form-control" id="bu_id" name="bu_id" required="required" style="margin-right: 5px; width: 80%;float: left;">
                    <div class="invalid-feedback"> 아이디를 입력해주세요.</div>
                    <input type="button" class="btn btn-primary" name="bu_id_check" id="bu_id_check" value="중복확인" >
                    <br><font id="checkId" size ="1"></font>
                </div>
                <div class="mb-3" style="margin-bottom: 20px;"> 
                    <label for="password">비밀번호</label> 
                    <input type="password" class="form-control" id="password" name="password" required="required">
                    <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                </div>
                <div class="mb-3" style="margin-bottom: 20px;"> 
                    <label for="password_check">비밀번호 재확인
                        <span class="text-muted"></span>
                    </label>
                    <input type="password" class="form-control" id="password_check" name="password_check" required="required">
                </div>

                <hr class="mb-4">
                <div id="clause">
                    <div class="custom-control custom-checkbox"> 
                        <input type="checkbox" class="custom-control-input" id="clause1" value="clause1" name="clause1" required="required"> 
                            <label class="custom-control-label" for="clause1">서비스 이용 약관에 동의합니다.(필수)</label> 
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="clause2" value="clause2" name="clause2" required="required">
                        <label class="custom-control-label" for="clause2">개인정보 수집 및 이용에 동의합니다.(필수)</label>
                    </div>
                    <div class="custom-control custom-checkbox"> 
                        <input type="checkbox" class="custom-control-input" id="clause3" value="clause3" name="clause3" >
                        <label class="custom-control-label" for="clause3">위치 정보 서비스 약관에 동의합니다.(선택)</label> 
                    </div>
                </div>
                <br>
	           	<div style="text-align: center;">
                <button id="j_cancle_btn" class="btn btn-danger" type="submit">취소하기</button>
                <button id="j_bu_enroll_btn" class="btn btn-primary" type="button" >가입 완료</button>
                </div>
            </form>
        </div>
    </div>
    </div>
    <div style="height: 80px;"></div>
    </div>
    </section>
        	<footer style="margin-top: 0px; background-color: #001020; color: white;">
        <div id="p_main_bottom">
            <div id="p_bottom_left">
                <h3>지금 우리 동네는</h3>
                <h5>간편하고 쉬운, 실시간예약 사이트</h5>
                <p>
                    (주)지우동 | 서울 강남구 테헤란로 14길 6 남동빌딩 2층, 3층 (우)06234 | OWNER. 손은진 | 호스팅사업자 : 올때마스크써조<br>
                    TEL. 02)123-4567 | E-MAIL. <a
                        href="https://github.com/dms873/jiwoodong.git">https://github.com/dms873/jiwoodong.git</a><br>
                    JIWOODONG CO.2022 All rights reserved.<br>
                </p>
            </div>
            <div id="p_bottom_right">
                <h4>고객지원</h4>
                <p>고객센터 : <a href="#">6612-1867</a></p>
            </div>
        </div>
    </footer>
    <!--사업자 번호 중복체크  -->
	<script type="text/javascript">
		$("#bu_num_btn").click(function(){
			var bu_num = $('#bu_num').val();
			console.log("bu_num: "+bu_num);
			
			$.ajax({
				url:"bumNumCheck",
				type:"post",
				data: {bu_num: bu_num},
				dataType: 'json',
				success: function(result){
					if(result ==0){
						$("#checkbunum").html('이미 등록된 사업자번호 입니다');
						$("#checkbunum").attr('color','red');
					}else{
						$("#checkbunum").html('사업자번호가 등록되었습니다.');
						$("#checkbunum").attr('color','blue');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			
			})
			
		});
	
	</script>   
    <!--ID 중복체크  -->
	<script type="text/javascript">
		$("#bu_id_check").click(function(){
			var bu_id = $('#bu_id').val();
			console.log("bu_id: "+bu_id);
			
			$.ajax({
				url:"bumIdCheck",
				type:"post",
				data: {bu_id: bu_id},
				dataType: 'json',
				success: function(result){
					if(result ==0){
						$("#checkId").html('이미 존재 하는 아이디 입니다.');
						$("#checkId").attr('color','red');
					}else{
						$("#checkId").html('사용 가능한 아이디 입니다.');
						$("#checkId").attr('color','blue');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			
			})
			
		});
	
	</script>
    <script type="text/javascript">
    $("#j_cancle_btn").click(function() {
        var result = confirm('메인페이지로 이동하시겠습니까?'); 
        if(result) { 
            //yes 
            location.href="MainPage";
            } else { 
            //no 
            }
    });
   /*  function check() {
		//빈칸 체크
		 		var f = document.bu_enroll; 
	    
		console.log("f.bu_id_check.value : " + f.bu_id_check.value);
		 
	    if ($("#name").val() == "") {
	        alert("아이디를 입력해주십시오");
	        f.bu_id.focus();
	        return false;
	    }
	    else if (f.bu_id_check.value == "") {
	        alert("아이디 중복체크를 해주십시오");
	        f.bu_id_check.focus();
	        return false;
	    }
	    else if (f.password.value == "") {
	        alert("비밀번호를 입력해주십시오");
	        f.password.focus();
	        
	        return false;
	    }

	    else if (f.name.value == "") {
	        alert("이름을 입력해주십시오");
	        f.name.focus();
	        return false;
	    }

	    else if (f.birth.value == "") {
	        alert("생년월일을 입력해주십시오");
	        f.birth.focus();
	        return false;
	    }

	    else if (f.phone.value == "") {
	        alert("핸드폰 번호를 입력해주십시오");
	        f.phone.focus();
	        return false;
	    }

	    else if (f.email.value == "") {
	        alert("이메일을 입력해주십시오");
	        f.email.focus();
	        return false;
	    }

	    else if (f.email_check_no.value == "") {
	        alert("인증번호를 입력해주십시오");
	        f.email_check_no.focus();
	        return false;
	    }


	    else if (f.clause1.value == "" || f.clause1.length==0) {
	        alert("이용약관에 동의 해주십시오");
	        f.clause1.focus();
	        return false;
	    }


	    else if (f.clause2.value == "" || f.clause2.length==0) {
	        alert("개인정보 수집및 이용약관에 동의해주십시오");
	        f.clause2.focus();
	        return false;
	    } 
		
	            
	    } */
    <!--생년월일 하이픈 정규식 DOM  -->
    $("#birth").on("input",function() {
                var target = document.getElementById("birth");
                target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{0,4})(\d{0,2})(\d{0,2})$/g,"$1-$2-$3").replace(/(-{1,2})$/g,"");
    }); 
    
    <!--전화번호 하이픈 정규식 DOM  -->
    $("#phone").on("input",function() {
                var target = document.getElementById("phone");
                target.value = target.value.replace(/[^0-9]/g,'').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(-{1,2})$/g,"");
    }); 
    <!--사업자 번호 하이픈 정규식 DOM  -->
    $("#bu_num").on("input",function() {
                var target = document.getElementById("bu_num");
                target.value = target.value.replace(/[^0-9]/g,'').replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, "$1-$2-$3").replace(/(-{1,2})$/g,"");
    }); 
        
	
	$("#j_bu_enroll_btn").click(function(){

		    
	//형식 체크
	var bu_num = $("#bu_num").val().trim();
	var regExpPhone = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/; // 숫자3-숫자3,4-숫자4
	if(!regExpPhone.test(bu_num)){
		alert("사업자번호 입력란에는 000-00-00000 형식으로 입력해주세요.");
		$("#bu_num").val('');
		$("#bu_num").focus();
		return false;
	}
	
	if($("#name").val() == '') {
		alert("이름을 입력해주십시오");
		$("#name").focus();
		return false;
	}
	
	/* var name = $("#name").val().trim();
	var regExpName = /^{1,6}$/; // 1~6글자
	if(!regExpPassword.test(name)){
		alert("이름은 6글자까지 가능합니다.");
		$("#name").val("");
		$("#name").focus();
		return false;
	} */
	
    if($("#birth").val() == '') {
    	alert("생년월일을 선택해주십시오");
    	$("#birth").focus();
    	return false;
    }
    
	var phone = $("#phone").val().trim();
	var regExpPhone = /^[0-1]{3}-[0-9]{3,4}-[0-9]{4}$/; // 숫자3-숫자3,4-숫자4
	if(!regExpPhone.test(phone)){
		alert("전화번호 입력란에는 000-0000-0000 형식으로 입력해주세요.");
		$("#phone").val('');
		$("#phone").focus();
		return false;
	}
	
	var email = $("#email").val().trim();
	var emailCheck= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if(!emailCheck.test(email)){
        alert("이메일 형식에 맞지 않습니다 ")
        $("#email").focus();
        return false;
    }
    
    if($("#bu_id").val() == '') {
		alert("아이디를 입력해주십시오");
		$("#bu_id").focus();
		return false;
	}
    
    if($("#password").val() == '') {
		alert("비밀번호를 입력해주십시오");
		$("#password").focus();
		return false;
	}
    
    if($("#password_check").val() == '') {
		alert("비밀번호를 한번 더 입력해주십시오");
		$("#password_check").focus();
		return false;
	}
    
	var password = $("#password").val().trim();
	if(!password || password != $("#password_check").val().trim()){
		alert("패스워드 입력란과 확인란이 같지 않습니다.");
		$("#password").val("");
		$("#password_check").val("");
		$("#password").focus();
		return false;
	}
	//var regExpPassword = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{8,16}$/; // 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자
	var regExpPassword = /^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/; // 영문자, 숫자가 적어도 1개이상, 8~16글자
	if(!regExpPassword.test(password)){
		alert("패스워드 입력란에는 영문자, 숫자가 적어도 1개이상, 8~16글자를 입력해주세요.");
		$("#password").val("");
		$("#password_check").val("");
		$("#password").focus();
		return false;
	}
	if($("#clause1").is(':checked') == false) {
		alert("필수 약관에 동의해주세요.");
		$("#clause1").focus();
		return false;
	}
	
	if($("#clause2").is(':checked') == false) {
		alert("필수 약관에 동의해주세요.");
		$("#clause2").focus();
		return false;
	}
	
	var frm = $("#frm");
		frm.attr("action","bumenroll.lo"); 
		frm.attr("method","post");
		frm.submit();
	});
	
	
  
	 //아이디 중복체크
<!-- 아이디중복체크 -->
		function winopen(){
			//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
			//1. 아이디가 없으면 알림창과 진행x
			//if(frm.bu_id.value =="" || frm.bu_id.value.length < 0){
				//alert("아이디를 먼저 입력해주세요")
				//frm.bu_id.focus();
			//}else{
				//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
				//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
				frm.bu_id.value="";						
				window.open("bumIdCheck?bu_id="+frm.bu_id.value,"","width=500, height=300");
			
			
			//}
		}
		//이메일..
		//onclick="emailAuthentication()" -인증번호발송 +중복확인
		function email_btn(){
			if (!emailValCheck()){
		    	return false;
		    }
			//var url = "bumemailcheck.lo?email=" + frm.email.value;
			//open(url, "confirm","toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
			window.open("bumemailcheck.lo?email="+frm.email.value,"confirm","width=500, height=300");
		}
		
		//이메일 형식 유효성검사
		const form = document.bu_enroll;

		function emailValCheck(){
			var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = form.email.value;
			if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
				return false;
			}
		    return true;
		}
		
		function check(pattern, taget, message) {
			if(pattern.test(taget)) {
		    	return true;
		    }
		    alert(message);
		    taget.focus();
		    return false;
		}
		
		//onclick="authCodeCheck()" 인증버튼
		function authCodeCheck(){
			var url = "authCodeCheck.jsp?inputedCode=" + frm.email_check_no.value;
			open(url, "confirm",
					"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
		}
		
		
		//유효성검사
		window.addEventListener('load',() => { 
			const forms = document.getElementsByClassName('validation-form');
			Array.prototype.filter.call(forms, (form) => {
				form.addEventListener('submit', function (event) { 
					if (form.checkValidity() === false) { 
						event.preventDefault(); 
						event.stopPropagation(); 
						} 
							form.classList.add('was-validated'); 
						}, 	false); 
				}); 
			}, false);

</script>
</body>
</html>