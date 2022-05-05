<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email 확인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%! String email = ""; %>
<% email = request.getParameter("email"); %>

<script type="text/javascript">

	function cancel() {
		self.close();
	}

	function requestAuthEamil(){
		var url = "requestAuthEmail?email=" + "<%=email%>";
		window.open(url, "authEmailSend","toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
</script>

</head>
<body>
	<c:set var="emailDupleCheck" value="${emailDupleCheckResult}" />
	<c:choose>
		<c:when test="${emailDupleCheckResult == 'useable' }">
			<a>인증메일을 전송중입니다. 팝업창을 허용해주세요.</a>
			<script type="text/javascript">requestAuthEamil();</script>
		</c:when>
		<c:otherwise>
			<h4> ${email}은 사용 불가능한 email입니다.</h4>
		</c:otherwise>
	</c:choose>
	<br><br>
	<button type="button" onclick="cancel()" class="btnCancel">확인</button>
</body>
</html>