<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kh.semi.jwd.bum.model.service.BumService"%>
<%@page import="kh.semi.jwd.bum.model.dao.BumDao"%>
<%@page import="kh.semi.jwd.bum.model.vo.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/userMypage.css">    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


</head>
<body>
            <div id="c_inner_info" style="width: 1000px">
              <p class="c_info_title">리뷰내역</p>
              <table class="table" style="width: 100%; margin-top: 40px;">
                <thead>
                  <tr>
					<th scope="col" class="s_center" style="width: 300px;">업체명</th>
					<th scope="col" class="s_center" style="width: 400px;">내용</th>
					<th scope="col" class="s_center" style="width: 100px;">평점</th>
					<th scope="col" class="s_center" style="width: 100px;">작성자</th>
					<th scope="col" class="s_center" style="width: 100px;">작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${userrvlist}" var="i">
					<tr class="s_tr_readList s_tr_modal">
						<th class="s_center" scope="row" class="s_ntNo">${i.cpName }</th>
						<td class="s_td_short">${i.rvContent}</td>
						<td class="s_td_short">${i.rvScore}</td>
						<td class="s_center">${i.umId}</td>
						<td class="s_center">${i.rvWriteDate }</td>
					</tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
	

</body> 
</html>