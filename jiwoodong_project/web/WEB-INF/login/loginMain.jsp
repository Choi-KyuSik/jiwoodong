
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/enroll_main_page.css"> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css"> 
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
<body style="background: none;">
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
						<li class="nav-item"><a class="nav-link" href="AdminLogin">관리자로그인</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
    <div id="join_div" style="margin-bottom: 80px;">
        <form>
            <h4 class="mb-3" id="s_tt" style="margin-top: 0;">로그인</h4>
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
                 
                </td>
            </tr>

        </table>
    </form>
    
    </div>
    
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