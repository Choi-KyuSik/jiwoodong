<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admin.css">
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
<title>리뷰 상세 조회페이지</title>
<style>
#s_rv_section {
	width: 800px;
	height: 500px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 20px;
	background-color: #f8f9ff;
	margin: 0 auto;
	margin-bottom: 20px;
}

#s_rv_id {
	font-size: 1.2em;
	font-weight: bold;
}

#s_rv_love {
	margin: 10px 0;
}

#s_rv_date {
	color: gray;
	font-size: .9em;
}

#s_rv_content {
	margin-bottom: 10px;
	word-break: break-all;
	width: 500px;
}

#s_rv_title {
	text-align: center;
	font-size: 2em;
	font-weight: bold;
	margin: 20px;
}

#s_rv_main_box {
	margin: 0 auto;
	width: 1200px;
}

#s_rv_btn_box {
	clear: both;
	text-align: center;
	padding-top: 30px;
	line-height: 4;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
    font-size: 19px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #0074ba;
}
</style>
</head>
<body>

	<div>
		<%@ include file="../view/admin/admin_header.jsp"%>
	</div>
	
	<section id="contents">

		<div id="s_rv_main_box">
			<div id="s_rv_title">리뷰 상세 조회</div>
			<form id="frm" method="post" action="#">
				<c:forEach items="${rvDetailList }" var="i">
					<section id="s_rv_section">
						<article style="float: left;">
							<div>
								<div id="s_rv_id">${i.umId }</div>
								<div id="s_rv_love">${i.rvScore }</div>
								<div id="s_rv_date">${i.rvWriteDate }</div>
							</div>
						</article>
						<article style="float: right;">
							<div id="s_rv_content">${i.rvContent }</div>
							<c:if test="${empty i.flGno }">
							<div style="padding-top: 10px; width: 300px; height: 300px;">
								
							</div>
							</c:if>
							<c:if test="${not empty i.flGno }">
							<div style="padding-top: 10px; width: 300px; height: 300px;">
								<img style="width: 300px; height: 300px; border-radius: 10px;"
									src="${i.flGno }">
							</div>
							</c:if>
						</article>
						<div id="s_rv_btn_box">
							<input type="button" id="back_btn"
								class="btn btn-secondary pull-right" value="뒤로가기"> <input
								type="button" id="s_update_btn"
								class="btn btn-primary pull-right" data-bs-toggle="modal" data-bs-target="#exampleModal"value="수정하기"> 
								<input type="button" id="s_delete_btn"
								class="btn btn-danger pull-right" value="삭제하기">
						</div>
					</section>
				</c:forEach>
			</form>
			<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">리뷰 수정</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<div style="width: 466px;border: 1px solid lightgray; border-radius: 3px; margin-bottom: 5px; padding-left: 10px;">
				      		<div style="line-height: 1; margin: 10px 0; vertical-align: middle;">
					      		<p id="rating_ct" style="display: inline-block; color: dimgray; margin-bottom: 0;">수정할 별점을 선택해주세요 : </p>
						      	<p class="star_rating" style="display: inline-block; margin-bottom: 0;">
								    <a href="1" class="on">♥</a>
								    <a href="2" class="on">♥</a>
								    <a href="3" class="on">♥</a>
								    <a href="4" class="on">♥</a>
								    <a href="5" class="on">♥</a>
								</p>
							</div>
						</div>
						<input type="hidden" name="rvNo" id="rvNo" value="${rvNo }" />
				        <input type="text" class="form-control" name="rvContent" id="rvContent" placeholder="수정할 내용을 입력하세요." style="margin-bottom: 5px;"/>
				        <input type="hidden"
									role="uploadcare-uploader"
									data-public-key="c545e991d9de45462444"
									data-tabs="file camera url facebook gdrive gphotos" />
					<!-- hidden input에 주소 url을 value로 받을거여서 같이 만듬 세트로 놔두면 편할 듯, 위에거가 파일등록 버튼 -->
									<input type="hidden" name="fileUrl" id="fileUrl">
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
				        <button type="button" id="s_rv_update_btn" class="btn btn-primary">수정하기</button>
				      </div>
				    </div>
				  </div>
				</div>
		</div>
	</section>
	<script>
		/* 이미지등록 */
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	
		singleWidget.onUploadComplete(function(info) {
			$("#fileUrl").val(info.cdnUrl);
		});
	</script>
	 <!-- onclick="statusChange(this)" -->
	
	<script>
		$("#back_btn").click(function() {
			// location.replace('AdminReviewList');
			history.back();
		});
		
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			console.log($(this).attr('href'));
			var obj = $(this);
			console.log(obj.attr('href'));
			//console.log("this가 뭔데?" + JSON.Stringfy(thisVal));
			return false;
		});
		
		// console.log("div 값 : " + $("#s_rv_love").text());
		
		// var divTxt = $("#s_rv_love").text();
		// console.log("divTxt : " + divTxt);
		// $("#rating_ct").text(divTxt);
		
		/* $(".on").click(function() {
			statusChange(this);
		});
		
		function statusChange(item) {
			console.log($(item));
			var strText = $(item).text();
			if($(item).text() == '🤍') {
				strText = $(item).text('💙');
			} else {
				strText = $(item).text('🤍');
			}
			console.log("strText : " + strText);
		} */

		/* $("#s_rv_update_btn").click(function() {
			if (confirm("정말 수정하시겠습니까?") == true) {
				var val = $(".on").last().attr('href');
				console.log("마지막자식의 값 : " + val.attr('href'));
				var rvContent = $("#rvContent").val();
				var fileUrl = $("#fileUrl").val();
				var rvNo = $("#rvNo").val();
				console.log("rvNo : " + rvNo);
				
				// location.href="AdminReviewUpdateDo?rvScore=" + val + "&rvContent=" + rvContent + "&fileUrl=" + fileUrl + "&rvNo=" + rvNo;
				
				// var frmEl = $("#frm");
				// frmEl.attr("action", "#");
				// frmEl.attr("method", "get");
				// frmEl.submit();
			} else {
				history.back();
			}
		}); */
		
		
		$("#s_rv_update_btn").click(function() {
			if(confirm("정말 수정하시겠습니까?") == true) {
				
				if($.trim($("#rvContent").val()) == '') {
					console.log("비어이따");
					alert("수정할 내용을 입력해주세요.");
					$("#rvContent").val('');
					$("#rvContent").focus();
					return;
				}
				
				var val = $(".on").last();
				var rvScore = val.attr('href');
				console.log("rvScore : " + rvScore);
				console.log("마지막자식의 값 : " + val.attr('href'));
				var rvContent = $("#rvContent").val();
				var fileUrl = $("#fileUrl").val();
				var rvNo = $("#rvNo").val();
				console.log("rvNo : " + rvNo);
				
				$.ajax({
					url: "AdminReviewUpdateDo",
					type: "post",
					data: {"rvScore": rvScore, "rvContent": rvContent, "fileUrl": fileUrl, "rvNo": rvNo},
					dataType : "text",
					success: function(result) {
						console.log("전달 성공");
						alert(result);
						location.href="AdminReviewDetailList?rvNo=" + rvNo;
					}
				});
			} else {
				history.back();
			}
		});

		$("#s_delete_btn").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				
				var rvNo = $("#rvNo").val();
				console.log("rvNo : " + rvNo);
				
				$.ajax({
					url: "AdminReviewDeleteDo",
					type: "post",
					data: {"rvNo": rvNo},
					dataType : "text",
					success: function(result) {
						console.log("전달 성공");
						alert(result);
						location.href="AdminReviewList";
					}
				});
				
				
			} else {
				history.back();
			}
		})
	</script>
	
	<!-- 메뉴버튼 눌렀을 때 이동할 페이지 -->
	<script>
    	$("#s_notice_menu").click(function() {
    		location.href="AdminNoticeList";
    	});
    	
    	$("#s_bu_accept_menu").click(function() {
    		location.href="AdminBuAcceptList";
    	});
    	
    	$("#s_bu_accept_result_approval_menu").click(function() {
    		location.href="AdminBuAcceptApprovalList";
    	});
    	
    	$("#s_bu_accept_result_reject_menu").click(function() {
    		location.href="AdminBuAcceptRejectList";
    	});
    	
    	$("#s_bu_info_menu").click(function() {
    		location.href="AdminBuInfoList";
    	});
    	
    	$("#s_bu_delete_menu").click(function() {
    		location.href="AdminBuInfoDeleteList";
    	});
    	
    	$("#s_us_info_menu").click(function() {
    		location.href="AdminUsInfoList";
    	});
    	
    	$("#s_us_delete_menu").click(function() {
    		location.href="AdminUsInfoDeleteList";
    	});

    	$("#s_review_menu").click(function() {
    		location.href="AdminReviewList";
    	});
    </script>
</body>
</html>