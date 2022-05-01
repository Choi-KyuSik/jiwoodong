<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 로그인</title>
</head>
<body>
	
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
     <%
    if (session.getAttribute("bu_id") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
	사업자 로그인
    <form action="BumMainPage" method="get" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="bu_id" /><br />
        패스워드 : <input type="password" name="password" /><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("bu_id") %> 회원님, 로그인하셨습니다.<br />
        <a href="#">[로그아웃]</a>
        
    <%
    }
    %>
  	<script>
    function validateForm(form) {
        if (!form.bu_id.value) {
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