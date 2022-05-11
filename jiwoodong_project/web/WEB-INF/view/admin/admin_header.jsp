<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header style="margin-top: 10px;">
        <div id="p_main_top">
            <div style="float: right;">
                <p id="p_welcome_msg">환영합니다 <%= session.getAttribute("ad_id") %>님</p>
                <a id="s_logout" href="logout" style="">로그아웃</a>
            </div>
            <div id="p_top_logo">
                <a href="<%=request.getContextPath()%>/AdminMainPage"><img
                        src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
                        width="80px" alt="logo" id="logo"></a>
            </div>
            <div style="float: left; margin: 15px 0 0 0;">
                <nav class="navbar navbar-expand-lg">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" id="s_notice_menu" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        공지사항 관리
                                    </a>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown dropdown-toggle" id="s_bu_menu" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        사업자관리
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu">
                                        <li><a class="dropdown-item" href="#" id="s_bu_accept_menu">업체 신청 내역</a></li>
                                        
                                        <li><a class="dropdown-item" href="#" id="s_bu_accept_result_approval_menu">업체 승인 수락 리스트</a></li>
                                        <li><a class="dropdown-item" href="#" id="s_bu_accept_result_reject_menu">업체 승인 거절 리스트</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" id="s_bu_info_menu">사업자 회원 정보 조회</a></li>
                                        <li><a class="dropdown-item" href="#" id="s_bu_delete_menu">사업자 탈퇴 회원 조회</a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown">
                                        사용자관리
                                    </a>
									<ul class="dropdown-menu dropdown-menu">
										<li><a class="dropdown-item" href="#" id="s_us_info_menu">사용자 회원 정보 조회</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" id="s_us_delete_menu">사용자 탈퇴 회원 조회</a></li>
									</ul>
								</li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" role="button" id="s_review_menu" data-bs-toggle="dropdown"
                                        id="s_review_menu">
                                        리뷰관리
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div style="float: right; margin-top: 10px;">
                <div style="text-align: center;">
                    <img src="https://media.discordapp.net/attachments/958566133752016901/973806816339312650/f8988b1aff3ea07c.png?width=671&height=671"
                        alt="프사" width="60px">
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </header>
</body>
</html>