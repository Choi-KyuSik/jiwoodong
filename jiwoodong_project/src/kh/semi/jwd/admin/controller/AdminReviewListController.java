package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminReviewListController
 */
@WebServlet("/AdminReviewList")
public class AdminReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("잘 넘어왔겠죠 ? ㅎㅎㅎㅎㅎ");
		
		// 검색
		String field = request.getParameter("f");
		String query = request.getParameter("q");

		System.out.println("field : " + field);
		System.out.println("query : " + query);

		// 사용자가 검색 전달을 안했을 때
		String field_ = "nt_title";
		if(field != null) {
			// 기본이 제목이 선택되도록
			field_ = field;
		}

		String query_ = "";
		if(query != null) {
			query_ = query;
		}

		String pageNumStr = request.getParameter("pageNum");
		System.out.println("pageNumStr:"+pageNumStr);
		int currentPage = 1;
		if(pageNumStr != null && !pageNumStr.equals(""))
			currentPage = Integer.parseInt(pageNumStr);
		System.out.println("currentPage:"+currentPage);
		final int pageSize = 10;
		final int pageBlock = 2;
		int totalCnt = 0;
		
		if(field == null || query == null) {
			totalCnt = countReviewList();
		} else {
			totalCnt = countReviewSearchList(field, query);
		}
		
		// paging 처리
		// 총 페이지 수
		int pageCnt = (totalCnt/pageSize) + (totalCnt%pageSize==0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		if(currentPage%pageBlock == 0) {
			startPage = ((currentPage/pageBlock)-1)*pageBlock + 1;
		} else {
			startPage = (currentPage/pageBlock)*pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		// System.out.println("paging" + startPage+"~"+endPage);

		// rownum 처리
		int startRnum = 0;
		int endRnum = 0;
		startRnum = (currentPage-1)*pageSize + 1;
		endRnum = startRnum + pageSize - 1;
		if(endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		
		
		ArrayList<Map<String, Object>> adRvList = new AdminService().adRvList(startRnum, endRnum);
		ArrayList<Map<String, Object>> adRvListSearch = new AdminService().adRvListSearch(field, query, startRnum, endRnum);
		
		request.setAttribute("adRvList", adRvList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("adRvListSearch", adRvListSearch);
		request.setAttribute("field", field);
		request.setAttribute("query", query);
		
		request.getRequestDispatcher("WEB-INF/admin/adminReviewList.jsp").forward(request, response);
		
	}
	// 리뷰 검색 결과 카운트
	public int countReviewSearchList(String field, String query) {
		int result = new AdminService().countReviewSearchList(field, query);
		return result;
	}

	// 리뷰 리스트 개수
	public int countReviewList() {
		int result = new AdminService().countReviewList();
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
