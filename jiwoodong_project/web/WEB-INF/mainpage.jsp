<%@page import="java.sql.SQLException"%>
<%@page import="kh.semi.jwd.common.jdbc.JdbcDBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL, EL로 맞춰서 진행  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!-- 부트스트랩 + 수정 : css파일 / 일부쓸거다 : cdn / 직접 만들겠다 : css따로 만들기 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</head>
<body>
	안녕하세요 반갑습니다.<br><br>
	<button id="login">로그인</button>
	<button id="join">회원가입</button>
	<br><br>
	
	<script>
	$("#login").click(function() {
			// 페이지 이동
			// get방식으로 링크가 걸리는 것과 동일함
			location.href = "AdminLogin"; // a태그의 href와 동일 : get방식
		});
	
	$("#join").click(function() {
		// 페이지 이동
		// get방식으로 링크가 걸리는 것과 동일함
		location.href = "join"; // a태그의 href와 동일 : get방식
	});
	
	
	
	</script>
	
	<%
		Connection conn = null;
		try {
			conn = JdbcDBCP.getConnection();
			out.println("연결 성공 : " + conn + "<br>");
		} catch (NullPointerException e) {
			out.println("연결 실패 : " + e.getMessage() + "<br>");
		} finally {
			JdbcDBCP.close(conn);
		}
	
	%>
	
	
	<div>
		<%@ include file="./view/template_header.jsp"%>
	</div>
	<div>
		<%@ include file="./view/template_aside.jsp"%>
	</div>
	<div>
		<%@ include file="./view/template_content.jsp"%>
	</div>
	<div>
		<%@ include file="./view/template_footer.jsp"%>
	</div>
</body>
</html>