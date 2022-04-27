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
    <!-- Bootstrap CSS --> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bum_enrollpage.css"> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body { 
    min-height: 100vh;
     background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); 
     background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); }


.input-form { 
    max-width: 680px;
    margin-top: 80px;
    padding: 32px;
    background: #fff;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px; 
    border-radius: 10px; 
    -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) 
    }

    .btn{
        padding-top: 0.5rem;
    }

    .col-md-8{
        max-width: 50%;
    }

    #email{
    display: inline-block;
    width: 70%;
    }
    #email_check, #email_check_no{
        display: inline-block;
        width: 40%;
    }
    #email_check_btn,#bu_num_btn{
        display: inline-block;

    }

    #email_check{
        display: inline-block;
        
        
    }
    #bu_id{
        display: inline-block;
        width: 78%;
    }

    #bu_num{
       display: inline-block;
       width: 74%;
    }

</style>
</head>
<body>
<section>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3"><strong>사업자 회원가입</strong></h4>
            <form class="validation-form" name="bu_enroll" onclick="" novalidate >
            
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
                        <input type="text" class="form-control" id="birth" placeholder="YYYY-MM-DD" name="birth" required="required">
                        <div class="invalid-feedback"> 생년월일를 입력해주세요. </div>
                    </div>
                    <div class="col-md-8 mb-3"> 
                        <label for="gender">성별</label> 
                        <select class="custom-select d-block w-100" id="gender" name="gender" required="required">
                            <option value="gender">여자</option>
                            <option value="gender">남자</option>

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
                    <input type="email" class="form-control" id="email" name="email" placeholder="email1@example.com" required="required">
                    <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    <input type="button" id="email_btn" value="인증번호 발송">
                </div>
                <div class="mb-3" id="email_check" style="margin-left: 51%; margin-bottom: 4px!important;"> 
                    <label for="email_check">인증번호</label> 
                    <input type="email" class="form-control" id="email_check_no" name="email_check_no" required="required">
                    <input type="button" id="email_check_btn" name="email_check_btn" value="확인">
                    <div class="invalid-feedback"> 인증번호를 입력해주세요. </div>
                    
                </div>
                <div class="mb-3">
                    <label for="bu_id" style="display: block;">아이디</label>
                    <input type="text" class="form-control" id="bu_id" name="bu_id" required="required">
                    <div class="invalid-feedback"> 아이디를 입력해주세요.
                    </div>
                    <input type="button" id="bu_id_check" value="중복확인" onclick="CheckId()" >
                </div>
                <div class="mb-3"> 
                    <label for="password">비밀번호</label> 
                    <input type="text" class="form-control" id="password" name="password" required="required">
                    <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                </div>
                <div class="mb-3"> 
                    <label for="password_check">비밀번호 재확인
                        <span class="text-muted"></span>
                    </label>
                    <input type="password" class="form-control" id="password_check" name="password_check" required="required"> </div>

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
				<input type="hidden" value="bu_signin" name="command"><br>
				<input type="hidden" value="" name="flag">            
                <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
            </form>
        </div>
    </div>
    </div>
    </section>>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2022 JIWOODONG</p>
    </footer>
    
    
    <script type="text/javascript">

	var frm = document.bu_enroll;
	frm.action = "bumenroll.lo";
	frm.method = "post";
	frm.submit();
</script>
</body>
</html>