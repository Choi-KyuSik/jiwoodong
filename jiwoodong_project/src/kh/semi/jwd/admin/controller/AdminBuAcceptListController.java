package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminBuAcceptListController
 */
@WebServlet("/AdminBuAcceptList")
public class AdminBuAcceptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuAcceptListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNumStr = request.getParameter("pageNum");
		System.out.println("pageNumStr:"+pageNumStr);
		int currentPage = 1;
		if(pageNumStr != null && !pageNumStr.equals(""))
		  currentPage = Integer.parseInt(pageNumStr);
		System.out.println("currentPage:"+currentPage);
		final int pageSize = 3;
		final int pageBlock = 3;
		int totalCnt = countBuAcceptList();
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
		System.out.println("startRnum" + startRnum);
		System.out.println("endRnum" + endRnum);
		
		ArrayList<Map<String, Object>> cpacDetailList = new AdminService().companyAcceptDetailList(startRnum, endRnum);
		// ArrayList<Map<String, Object>> cpaclist = new AdminService().companyAcceptList();
		// request.setAttribute("cpAccept", cpaclist);
		System.out.println("cpacDetailList : " + cpacDetailList);
		request.setAttribute("cpacDetailList", cpacDetailList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("currentPage", currentPage);
		
		request.getRequestDispatcher("WEB-INF/admin/adminBuAcceptList.jsp").forward(request, response);
	}
	
	// 업체 신청 리스트 카운트 만들기
	public int countBuAcceptList() {
		int result = new AdminService().countBuAcceptList();
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub doGet(request, response); }
	 */

}
