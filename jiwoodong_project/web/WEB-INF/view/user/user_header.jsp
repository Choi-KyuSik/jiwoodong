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
        <a href="/jwd" id="k_logo"><img
            src="https://cdn.discordapp.com/attachments/958566133752016901/966263461803876422/22b75afde37f348d.png"
            width="80px" alt="logo"></a>
      </div>
      <div id="p_top_menu">
        <nav class="navbar navbar-expand-lg">
          <div class="container-fluid">
            <div class="collapse navbar-collapse">
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_cplist" href="#" role="button">
                    업체조회
                  </a>
                </li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown" id="c_maps" href="#" role="button">
                    주변검색
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
                  <a class="nav-link dropdown" id="c_mypage" href="#" role="button">
                    마이페이지
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
      <div style="float: right; margin: 0 30px 0 0;">
        <div class="dropdown text-end" id="p_top_profile">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
            data-bs-toggle="dropdown" style="text-align: right">
            <img src="https://cdn.discordapp.com/attachments/958682757230366780/969684968735404133/23ff6546daa743f1.png" alt="mdo"
              style="width: 60px;">
          </a>
          <p style="font-size: 12px; width: 150px; margin: 5px;">${usMemberListInfo.umId } 님 환영합니다.</p>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" id="c_us_info_edit" href="#">내 정보 수정</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="logout">로그아웃</a></li>
          </ul>
        </div>
      </div>
      <div style="clear: both;"></div>
    </div>
  </header>
  
  
  
  <script>
	$("#c_cplist").click(function () {
    	console.log("찍히냐? mypage");
      href="uscplist"
    });
    $("#c_maps").click(function () {
    	console.log("찍히냐? c_maps");
      $("#c_cplist_info").hide();
      $("#c_maps_info").show();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    });
    $("#c_bklist").click(function () {
    	console.log("찍히냐? c_bklist");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").show();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    });
    $("#c_reviewlist").click(function () {
    	console.log("찍히냐? c_reviewlist");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").show();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
      $(".s_row").hide();
    }); 
    $("#c_us_info_edit").click(function () {
    	console.log("찍히냐? c_us_info_edit");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      // $("#c_us_info_edit_info").show();
      $("#main_box").hide();
      $(".s_row").show();
    }); 
    $("#c_us_delete").click(function () {
    	console.log("찍히냐? c_us_delete");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").hide();
      $("#main_box").hide();
    });
    $("#s_row").click(function () {
    	console.log("찍히냐? s_row");
      $("#c_cplist_info").hide();
      $("#c_maps_info").hide();
      $("#c_bklist_info").hide();
      $("#c_reviewlist_info").hide();
      $("#c_us_info_edit_info").show();
      $("#main_box").hide();
    });
    $("#c_mypage").click(function () {
    	console.log("찍히냐? mypage");
    	href="UserMypage"
    });
    $("#c_mypage").click(function () {
    	console.log("찍히냐? mypage");
    	href="UserMypage"
    	/* location.reload(); */
    });
    
    
  </script>
  
</body>
</html>