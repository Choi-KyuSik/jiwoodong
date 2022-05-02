
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/enroll_main_page.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지우동 로그인 메인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	    <!-- google font -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Noto+Sans+KR:wght@500&display=swap');
    </style>
</head>
<body>
    <div id="join_div">
        <form>
        <table id="join">
            <tr id="join_tr">
                <td id="join_bu">
                   
                    <img alt="사업자 이미지" src="https://cdn.discordapp.com/attachments/958682757230366780/969685089632018574/e3362c1706dbf481.png"><br>
                    <input type="button" id="join_bu_btn" value="사업자로 로그인 하기"><br>
                    <input type="button" id="join_bu_kakao_btn" value="카카오톡으로 시작하기">
                </td>
                <td id="join_user">
                
                    <img alt="사용자 이미지" src="https://cdn.discordapp.com/attachments/958682757230366780/969684968735404133/23ff6546daa743f1.png"><br>

                    <input type="button" id="join_u_btn" value="사용자로 로그인 하기"><br>
                    <input type="button" id="join_u_kakao_btn" value="카카오톡으로 시작하기">
                 
                </td>
            </tr>

        </table>
    </form>
    
    </div>
       <script>
    //일반적인 회원가입
    $("#join_bu_btn").click(function() {

            location.href="bumLogin";
 
    });
    $("#join_u_btn").click(function() {
  
            location.href="userLogin";

    });
    </script>
</body>
</html>