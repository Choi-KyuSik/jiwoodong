package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

/**
 * Servlet implementation class AdminNoticeListController
 */
@WebServlet("/AdminNoticeList")
public class AdminNoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		final int pageSize = 15;
		final int pageBlock = 2;
		int totalCnt = 0;
		
		if(field == null || query == null) {
			// 검색결과가 없을 때
			totalCnt = countNoticeList();
		} else {
			// 검색결과가 있을 때
			totalCnt = countNoticeSearchList(field, query);
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
		
		
		ArrayList<AdminNoticeVo> noticeListDetailPaging = new AdminNoticeService().noticeListDetailPaging(startRnum, endRnum);
		ArrayList<AdminNoticeVo> noticeListSearch = new AdminNoticeService().noticeListDetailSearchPaging(field, query, startRnum, endRnum);
		
		System.out.println("noticeListSearch" + noticeListSearch);
		
		// System.out.println("여기불림 ? ");
		// System.out.println("noticeListDetailPaging" + noticeListDetailPaging);
		// System.out.println("여기확인중 : 시작 " + startPage + ", 끝 " + endPage);
		request.setAttribute("noticeListDetailPaging", noticeListDetailPaging);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("noticeListSearch", noticeListSearch);
		request.setAttribute("field", field);
		request.setAttribute("query", query);
		
		request.getRequestDispatcher("WEB-INF/admin/adminNoticeList.jsp").forward(request, response);
		
	}
	// 공지사항 검색 결과 카운트
	public int countNoticeSearchList(String field, String query) {
		int result = new AdminNoticeService().countNoticeSearchList(field, query);
		// System.out.println("결과 나옵니까 ? : " + result);
		return result;
	}
	
	// 공지사항 리스트 개수
	public int countNoticeList() {
		int result = new AdminNoticeService().countNoticeList();
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
