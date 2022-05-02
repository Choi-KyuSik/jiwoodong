<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user마이페이지 헤더</title>
</head>
<body>
	<header>
    <div id="p_main_top">
      <div id="p_top_logo">
        <a href="" id="k_logo"><img
            src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
            width="80px" alt="logo"></a>
      </div>
      <div id="p_top_menu">
        <nav class="navbar navbar-expand-lg">
          <div class="container-fluid">
            <div class="collapse navbar-collapse">
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_mypage" href="#" role="button">
                    업체조회
                  </a>
                </li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_notice" href="#" role="button">
                    공지사항
                  </a>

                </li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_bklist" href="#" role="button">
                    예약현황
                  </a>
                </li>
              </ul>

              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_reviewlist" href="#" role="button">
                    리뷰
                  </a>
                </li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown dropdown-toggle" href="#" role="button"
                                        data-bs-toggle="dropdown">
                    내 정보 관리
                  </a>
                  <ul class="dropdown-menu dropdown-menu">
                    <li><a class="dropdown-item" id="c_us_info_edit" href="#">내 정보 수정</a></li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" id="c_us_delete" href="#">회원 탈퇴</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
      <div style="float: right; margin: 0 30px 0 0;">
        <div class="dropdown text-end" id="p_top_profile">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
            data-bs-toggle="dropdown">
            <img src="https://media.discordapp.net/attachments/692994434526085184/965630874999730296/1.png" alt="mdo"
              style="width: 60px;">
          </a>
          <p style="font-size: 12px; width: 115px; margin: 5px;">사용자ID</p>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
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
</body>
</html>