    <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user_enrollpage.css"> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@page import="java.sql.SQLException"%>
<%@page import="kh.semi.jwd.common.jdbc.JdbcDBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>사용자 회원가입 페이지</title>
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 주소 daum우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						<li class="nav-item"><a class="nav-link" href="#">관리자로그인</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>


<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto" style="margin-top: 0;">
            <h4 class="mb-3" id="s_tt"><strong>사용자 회원가입</strong></h4>
            <form id="frm" class="validation-form" name="bu_enroll" novalidate >
            
            <div class="row">
                    <div class="col-md-6 mb-3" style="margin-bottom: 20px;">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required="required">
                        <div class="invalid-feedback"> 이름을 입력해주세요.
                        </div>
                    </div>
					<div class="col-md-6 mb-3" style="margin-bottom: 20px;">
                        <label for="birth">생년월일</label> 
                        <input type="date" class="form-control" id="birth" name="birth" placeholder="YYYY/MM/DD" required="required">
                        <div class="invalid-feedback"> 생년월일을 입력해주세요. </div>
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
                <div class="mb-3" style=" margin-bottom: 4px!important; float: left;"> 
                    <label for="email" style="display: block;">이메일</label> 
                    <input type="email" class="form-control" id="email" name="email" placeholder="email1@example.com"  required="required"  maxlength="30" style="width: 200px; margin-right: 5px;">
                    <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    <input type="button" id="email_btn" class="btn btn-primary" value="인증번호 발송" onsubmit="return email_btn()" onclick="return email_btn()" >
                </div>
                 
                <div class="mb-3" id="email_check" style="margin-bottom: 4px!important; float: right; width: 230px;"> 
                    <label for="email_check" style="line-height: 80px;">인증번호</label> 
                    <input type="email" class="form-control" id="email_check_no" name="email_check_no" required="required" maxlength="10" disabled="disabled" style="margin: 0 5px;">
                    <input type="button" class="btn btn-primary" id="email_check_btn" name="email_check_btn" value="인증" onclick="email_check_btn()"  disabled="disabled">
                    <input type="hidden" name="authPass" id="authPass" value="false">
                    <div class="invalid-feedback"> 인증번호를 입력해주세요. </div>
                    
                </div>
                <div class="mb-3" style="clear: both; margin-bottom: 20px;">
                    <label for="bu_id" style="display: block;">아이디</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" required="required" style="margin-right: 5px; float: left; width: 86%; margin-bottom: 20px;">
                    <div class="invalid-feedback"> 아이디를 입력해주세요.
                    </div>
                    <input type="button" class="btn btn-primary" name="bu_id_check" id="bu_id_check" value="중복확인" onclick="winopen()" >
                </div>
                <div class="mb-3" style="margin-bottom: 20px; clear: both;"> 
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
                <div>
					<div class="mb-3" style="margin-bottom: 20px; font-weight: bold;">주소</div>
					<div style="margin-bottom: 5px;">
						<!-- 우편번호 -->
						<input type="text" class="form-control"
						 style="width: 100px; display: inline-block;" name="postcode" id="postcode"
						 value="${usMemberListInfo.umPostode }" /> 
						<!-- 주소찾기 -->
						<input type="button" class="btn btn-primary s_ad_nt_btn" id="postcode_btn" style="position: absolute; margin-left: 10px;" value="주소 찾기">
					</div>
					<!-- 주소 -->
					<input type="text" class="form-control" id="roadAddress"
					 style="width: 300px; display: inline-block; margin-right: 5px;"
					 name="address" value="${usMemberListInfo.umAddress }" />
					<!-- 상세주소 --> 
					<input type="text" class="form-control" id="jibunAddress"
					 style="width: 340px; display: inline-block;" placeholder="상세 주소를 입력해주세요."
					 name="detailAddress" value="${usMemberListInfo.umDetailAddress }" />
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

   <script type="text/javascript">
   //뒤로 가기
   $("#j_cancle_btn").click(function() {
        var result = confirm('메인페이지로 이동하시겠습니까?'); 
        if(result) { 
            //yes 
            location.href="MainPage";
            } else { 
            //no 
            }
    });
   <!--생년월일 하이픈 정규식 DOM  -->
   $("#birth").on("input",function() {
               var target = document.getElementById("birth");
               target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{0,4})(\d{0,2})(\d{0,2})$/g,"$1-$2-$3").replace(/(-{1,2})$/g,"");
   }); 
   
   <!--전화번호 하이픈 정규식 DOM  -->
   $("#phone").on("input",
           function() {
               var target = document.getElementById("phone");
               target.value = target.value.replace(/[^0-9]/g,'').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(-{1,2})$/g,"");
   }); 
   
   
   $("#j_user_enroll_btn").click(function(){
   
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
		var regExpPassword =/^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/;  // 영문자, 숫자가 적어도 1개이상, 8~16글자
		if(!regExpPassword.test(password)){
			alert("패스워드 입력란에는 영문자, 숫자가 적어도 1개이상, 8~16글자");
			$("#password").focus();
			return false;
		}
	 
	   
	var frm = $("#frm");
	frm.attr("action","userenroll.lo"); 
	frm.attr("method","post");
	frm.submit();
	});
   </script>
   
   <script>
	//주소찾기
	$("#postcode_btn").click(function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g
								.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("roadAddress").value = roadAddr;
				/* document.getElementById("jibunAddress").value = data.jibunAddress; */

				var guideTextBox = $("#guide");
				// document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.html('예상 도로명 주소 : ' + expRoadAddr);
					guideTextBox.css('display', 'block');

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.html('예상 지번 주소 : ' + expJibunAddr);
					guideTextBox.css('display', 'block');
				} else {
					console.log(guideTextBox);
					guideTextBox.html('');
					guideTextBox.css('display', 'none');
				}
			}
		}).open();
	});
	</script>
   
   <script>
		/* function check() {
				//빈칸 체크
				 
				var f = document.user_enroll; 
				    
					 
				    if (f.user_id.value == "") {
				        alert("아이디를 입력해주십시오");
				        f.user_id.focus();
				        return false;
				    }
				    else if (f.user_id_check.value == "") {
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

				    if (f.phone.value == "") {
				        alert("핸드폰 번호를 입력해주십시오");
				        f.phone.focus();
				        return false;
				    }

				    if (f.email.value == "") {
				        alert("이메일을 입력해주십시오");
				        f.email.focus();
				        return false;
				    }

				    if (f.email_check_no.value == "") {
				        alert("인증번호를 입력해주십시오");
				        f.email_check_no.focus();
				        return false;
				    }
				    if (f.postcode.value == "" || f.clause1.length==0) {
				        alert("주소를 입력해주세요");
				        f.clause1.focus();
				        return false;
				    }
				    if (f.clause1.value == "" || f.clause1.length==0) {
				        alert("이용약관에 동의 해주십시오");
				        f.clause1.focus();
				        return false;
				    }


				    if (f.clause2.value == "" || f.clause2.length==0) {
				        alert("개인정보 수집및 이용약관에 동의해주십시오");
				        f.clause2.focus();
				        return false;
				    }
			            
			    } */
			    
			    
			    $("#j_bu_enroll_btn").click(function(){

				    
			    	//형식 체크
			    	if($("#name").val() == '') {
			    		alert("이름을 입력해주십시오");
			    		$("#name").focus();
			    		return false;
			    	}
			    	
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
			        
			        if($("#user_id").val() == '') {
			    		alert("아이디를 입력해주십시오");
			    		$("#user_id").focus();
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
			    	
			    	if($("#postcode").val() == '') {
				    	alert("주소 찾기를 눌러주세요.");
			    		$("#postcode").focus();
			    		return false;
			    	}
			    
				    if($("#roadAddress").val() == '') {
				    	alert("주소 찾기를 눌러주세요.");
			    		$("#roadAddress").focus();
			    		return false;
			    	}
				    
				    if($("#jibunAddress").val() == '') {
				    	alert("상세 주소를 입력해주세요.");
			    		$("#jibunAddress").focus();
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
			    		frm.attr("action","userenroll.lo"); 
			    		frm.attr("method","post");
			    		frm.submit();
			    	});	    
			    
		 //아이디 중복체크
		 <!-- 아이디중복체크 -->
		 		function winopen(){
		 			//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		 			//1. 아이디가 없으면 알림창과 진행x
		 			//if(frm.user_id.value =="" || frm.user_id.value.length < 0){
		 				//alert("아이디를 먼저 입력해주세요")
		 				//frm.user_id.focus();
		 			//}else{
		 				//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		 				//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
 						frm.user_id.value="";	
		 				window.open("userIdCheck?user_id="+frm.user_id.value,"","width=500, height=300");
		 			
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