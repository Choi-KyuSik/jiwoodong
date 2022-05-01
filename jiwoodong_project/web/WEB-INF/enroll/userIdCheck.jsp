<%@page import="kh.semi.jwd.bum.model.service.BumService"%>
<%@page import="kh.semi.jwd.bum.model.vo.BumVo"%>
<%@page import="static kh.semi.jwd.common.jdbc.JdbcDBCP.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="kh.semi.jwd.bum.model.dao.BumDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>아이디 중복 체크</h2>

	
<fieldset>
	
	<form action="userIdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="user_id" >
	<input type="submit" value="중복 확인">	 
	</form>
</fieldset>
	<form action="" method="post">
	 <input type="button" value="아이디 사용하기" onclick="result();">
	 </form>

 <script type="text/javascript">
    function result(){
    	//팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
    	//팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
    	//alert("팝업창의 id값"+document.wfr.userid.value + ", 회원가입창의 id값 : " +opener.document.fr.id.value)
    	//6-1. 회원가입페이지의 id값에 아이디중복으로 선택된 id값을 대입.
    	opener.document.user_enroll.user_id.value = document.wfr.user_id.value;
    	
    	//6-3. 회원가입창 제어
    	//readonly 속성제어
    	opener.document.user_enroll.user_id.readOnly=true;
    	
    	//6-2. 창닫기
    	window.close();
    }

    </script> 
</body>
</html>