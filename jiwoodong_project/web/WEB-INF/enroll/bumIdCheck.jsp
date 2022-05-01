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
<title>아이디 중복 체크</title>
</head>
<body>
 <h2>아이디 중복 체크</h2>


<fieldset>
	
	<form action="bumIdCheck" method="get" id="wfr">
		ID : <input type="text" name="bu_id" >
	<input type="submit" value="중복 확인" onclick="">
	<input type="button" value="아이디 사용하기" action="" onclick="result();">	 
	</form>
</fieldset>

 <script type="text/javascript">

    function result(){
    	//팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
    	//팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
    	//alert("팝업창의 id값"+document.wfr.userid.value + ", 회원가입창의 id값 : " +opener.document.fr.id.value)
    	//6-1. 회원가입페이지의 id값에 아이디중복으로 선택된 id값을 대입.
    	//opener.document.bu_enroll.bu_id.value = document.wfr.bu_id.value;
    	window.opener.document.getElementById("bu_id").value = document.getElementById("bu_id").value

    	
    	//6-3. 회원가입창 제어
    	//readonly 속성제어
    	opener.document.bu_enroll.bu_id.readOnly=true;
    	
    	//6-2. 창닫기
    	window.close();
    }

    </script> 
</body>
</html>