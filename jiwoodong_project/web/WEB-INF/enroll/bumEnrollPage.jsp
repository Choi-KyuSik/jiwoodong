    <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bum_enrollpage.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

</head>
<body>
<section>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3"><strong>사업자 회원가입</strong></h4>
            <form  id="frm" class="validation-form" name="bu_enroll" onsubmit="return check()" novalidate >
            
            <div class="row">
                  <div class="mb-3" style="display: inline-block; width: 100%; margin-left: 2%;"> 
                        <label for="bu_num" style="display: block;">사업자 번호</label> 
                        <input type="text" class="form-control" id="bu_num" name="bu_num" placeholder="000-00-00000" required="required">
                        <div class="invalid-feedback"> 사업자번호를 조회해주세요.</div>
                        <input type="button" id="bu_num_btn" value="사업자 번호 조회" required="required">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required="required">
                        <div class="invalid-feedback"> 이름을 입력해주세요.
                        </div>
                    </div>
					<div class="col-md-6 mb-3">
                        <label for="birth">생년월일</label> 
                        <input type="date" class="form-control" id="birth" name="birth" placeholder="YYYY/MM/DD" required="required">
                        <div class="invalid-feedback"> 생년월일를 입력해주세요. </div>
                    </div>
                    <div class="col-md-8 mb-3"> 
                        <label for="gender">성별</label> 
                        <select class="custom-select d-block w-100" id="gender" name="gender" required="required">
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
                <div class="mb-3" style=" margin-bottom: 4px!important;"> 
                    <label for="email">이메일</label> 
                    <input type="email" class="form-control" id="email" name="email" placeholder="email1@example.com"  required="required"  maxlength="30">
                    <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    <input type="button" id="email_btn" value="인증번호 발송" onsubmit="return email_btn()" onclick="return email_btn()" >
                </div>
                 
                <div class="mb-3" id="email_check" style="margin-left: 51%; margin-bottom: 4px!important;"> 
                    <label for="email_check">인증번호</label> 
                    <input type="email" class="form-control" id="email_check_no" name="email_check_no" required="required" maxlength="10" disabled="disabled">
                    <input type="button" id="email_check_btn" name="email_check_btn" value="인증" onclick="email_check_btn()"  disabled="disabled">
                    <input type="hidden" name="authPass" id="authPass" value="false">
                    <div class="invalid-feedback"> 인증번호를 입력해주세요. </div>
                    
                </div>
                <div class="mb-3">
                    <label for="bu_id" style="display: block;">아이디</label>
                    <input type="text" class="form-control" id="bu_id" name="bu_id" onkeyPress="winopen()" required="required">
                    <div class="invalid-feedback"> 아이디를 입력해주세요.
                    </div>
                    <input type="button" name="bu_id_check" id="bu_id_check" value="중복확인" onclick="winopen()" >
                </div>
                <div class="mb-3"> 
                    <label for="password">비밀번호</label> 
                    <input type="password" class="form-control" id="password" name="password" required="required">
                    <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                </div>
                <div class="mb-3"> 
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
	           
                <button id="j_bu_enroll_btn" class="btn btn-primary btn-lg btn-block" type="submit" >가입 완료</button>
                <button id="j_cancle_btn" class="btn btn-primary btn-lg btn-block" type="submit">취소하기</button>
            </form>
        </div>
    </div>
    </div>
    </section>>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2022 JIWOODONG</p>
    </footer>
    
    
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
    function check() {
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
		
	            
	    } 
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
		alert("사업자번호 입력란에는 000-00-00000 형식");
		$("#bu_num").focus();
		return false;
	}
	
	if($("#name").val() == '') {
		alert("이름 미작성");
		$("#name").focus();
		return false;
	}
	
	var email = $("#email").val().trim();
	var emailCheck= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if(!emailCheck.test(email)){
        alert("이메일 형식에 맞지 않습니다 ")
        $("#email").focus();
        return false;
    }
    
	
	var phone = $("#phone").val().trim();
	var regExpPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/; // 숫자3-숫자3,4-숫자4
	if(!regExpPhone.test(phone)){
		alert("전화번호 입력란에는 000-0000-0000 형식");
		$("#phone").focus();
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
		alert("패스워드 입력란에는 영문자, 숫자, 특수문자가 적어도 1개이상, 8~16글자");
		$("#password").focus();
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