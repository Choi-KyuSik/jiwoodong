<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/login.css"> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인</title>
<!-- google font -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
</head>
<body>
    <div id="j_loginform">
        <p><img id="j_logo_img" alt="지우동 로고" src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"></p>
        <form action="userLogin.lo" method="post" name="loginFrm" onsubmit="return validateForm(this);">
            <div id="j_loginform2">
                <fieldset id="j_loginform3" >
                    <legend style="color: #0f7bc3; font-size: large; font-weight: bolder;">사용자 로그인</legend>
                    <div id="j_id_div">
                    <label id="j_id" for="um_id" style="display: inline- block; color: #0f7bc3;"><strong>아이디</strong></label>
                    <input type="text" id="um_id" name="um_id" /><br />
                    </div>
                    <div id="j_pw_div">
                    <label id="j_password" for="password" style="display: inline- block; color: #0f7bc3;"><strong>비밀번호</strong></label>
                    <input type="password" id="password" name="password" /><br />
                    </div>
                </fieldset>
                <div id="j_loginform4">
                    <input type="submit" id="login_btn" value="로그인하기" /><br>
                    <input type="button" id="login_kakao_btn" value="카카오톡으로 시작하기">
                </div>
            </div>
        </form>
    </div>

  	<script>
    function validateForm(form) {
        if (!form.um_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.password.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
    </script>
</body>
</html>