    <!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user_enrollpage.css"> 
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
	<script>
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
	</script>
</head>
<body>
<header>
    
</header>
<section>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3"><strong>사용자 회원가입</strong></h4>
            <form id="frm" name="user_enroll"  method="post" class="validation-form" onsubmit="return check()"  novalidate>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" required="required">
                        <div class="invalid-feedback"> 이름을 입력해주세요.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="birth">생년월일</label> 
                        <input type="date" class="form-control" id="birth" placeholder="YYYY/MM/DD" name="birth" required="required">
                        <div class="invalid-feedback"> 생년월일를 입력해주세요. </div>
                    </div>
                    <div class="col-md-8 mb-3"> 
                        <label for="gender">성별</label> 
                        <select class="custom-select d-block w-100" name="gender" id="gender" required="required">
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
                    <input type="email" class="form-control" id="email" name="email" placeholder="email1@example.com" required >
                    <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    <input type="button" id="email_btn" value="인증번호 발송">
                </div>
                <div class="mb-3" id="email_check" style="margin-left: 51%; margin-bottom: 4px!important;"> 
                    <label for="email_check">인증번호</label> 
                    <input type="email" class="form-control" id="email_check_no" required="required">
                    <input type="button" id="email_check_btn" value="확인">
                    <div class="invalid-feedback"> 인증번호를 입력해주세요. </div>
                    
                </div>
                <div class="mb-3">
                    <label for="user_id" style="display: block;">아이디</label>
                    <input type="text" class="form-control" name="user_id" id="user_id" required="required">
                    <div class="invalid-feedback"> 아이디를 입력해주세요.
                    </div>
                    <input type="button" id="user_id_check" value="중복확인">
                </div>
                <div class="mb-3"> 
                	<label for="password">비밀번호</label> 
                	<input type="password" class="form-control" id="password" name="password" required="required">
                    <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                </div>
                <div class="mb-3"> 
                    <label for="password_check">비밀번호 재확인<span class="text-muted"></span></label>
                    <input type="password" class="form-control" id="password_check" name="password_check" placeholder="">
                </div>
                <div class="mb-3">
                	<label for="addr">주소</label><br>
	                <input type="text" id="postcode" name="postcode" placeholder="우편번호">
					<input type="button" id="postcode_btn" value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" name="address" placeholder="도로명주소" size="60" ><br>
					<input type="hidden" id="jibunAddress" name="address" placeholder="지번주소"  size="60">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"  size="60"><br>
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
                <button id="j_user_enroll_btn" class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
            </form>
                <button id="j_cancle_btn" class="btn btn-primary btn-lg btn-block" type="submit">뒤로 가기</button>
       </div>
     </div>
    </div>
    </section>>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2022 JIWOODONG</p>
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
		$("#postcode_btn").click(function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postcode").value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	         
	                       
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    });

		 function check() {
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
			            
			    }
		 //아이디 중복체크
		 <!-- 아이디중복체크 -->
		 		function winopen(){
		 			//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		 			//1. 아이디가 없으면 알림창과 진행x
		 			if(frm.user_id.value =="" || frm.user_id.value.length < 0){
		 				alert("아이디를 먼저 입력해주세요")
		 				frm.user_id.focus();
		 			}else{
		 				//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		 				//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		 				window.open("userIdCheck?user_id="+frm.user_id.value,"","width=500, height=300");
		 			
		 			
		 			}
		 		}
	</script>
</body>
</html>