package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class AdminBuInfoListController
 */
@WebServlet("/AdminBuInfoList")
public class AdminBuInfoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuInfoListController() {
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
		String field_ = "bu_id";
		if(field != null) {
			// 기본이 아이디가 선택되도록
			field = field_;
		}

		String query_ = "";
		if(query != null) {
			query = query_;
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
			// 검색 결과가 없을 때
			totalCnt = countBuMemberInfoList();
		} else {
			// 검색 결과가 있을 때
			totalCnt = countBuMemberInfoSearchList(field, query);
		}
		
		
		
		System.out.println("totalCnt" + totalCnt);
		
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
		
		
		ArrayList<BumVo> buMemberInfoList = new AdminService().buMemberInfoList(startRnum, endRnum);
		ArrayList<BumVo> buMemberInfoSearchList = new AdminService().buMemberInfoSearchList(field, query, startRnum, endRnum);
		request.setAttribute("buMemberInfoList", buMemberInfoList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("buMemberInfoSearchList", buMemberInfoSearchList);
		request.setAttribute("field", field);
		request.setAttribute("query", query);
		
		request.getRequestDispatcher("WEB-INF/admin/adminBuInfoList.jsp").forward(request, response);
	}
	
	// 사업자 정보 리스트 글 개수
	public int countBuMemberInfoList() {
		int result = new AdminService().countBuMemberInfoList();
		return result;
	}
	
	// 사업자 정보 리스트 검색 글 개수
	public int countBuMemberInfoSearchList(String field, String query) {
		int result = new AdminService().countBuMemberInfoSearchList(field, query);
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
