package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserVo;

/**
 * Servlet implementation class UserMypageController
 */
@WebServlet("/UserMypage")
public class UserMypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String umId = "apple";
		String umId = (String) request.getSession().getAttribute("um_id");
		System.out.println(" ============= ");
		System.out.println("umId : " + umId);
		
		UserVo usMemberListInfo = new UserService().usMemberListInfo(umId);
		ArrayList<CompanyVo> usCpList = new UserService().usCpList();
		ArrayList<Map<String, Object>> usBkList = new UserService().usBkList(umId);
		ArrayList<Map<String, Object>> usRvList = new UserService().usRvList(umId);
		//사용자가 작성한 리뷰리스트 : 승희
		ArrayList<Map<String, Object>> userrvlist = new UserService().userRvlist(umId);
		// System.out.println("usCpList : " + usCpList);
		
		ArrayList<Map<String, Object>> bklist_r = new UserService().usBkList_r(umId);
		System.out.println("bklist_r : " + bklist_r);
		
		request.setAttribute("usCpList", usCpList);
		request.setAttribute("usBkList", usBkList);
		request.setAttribute("usRvList", usRvList);
		request.setAttribute("userrvlist", userrvlist);
		request.setAttribute("bklist_r", bklist_r);
		request.setAttribute("umId", umId);
		
		request.setAttribute("usMemberListInfo", usMemberListInfo);
		
		// System.out.println("결과를 내놓아라!" + usMemberListInfo);
		
		//리뷰상세조회 페이지 사용자 - 전승희
//		String rvNoStr = request.getParameter("rvNo");
//		int rvNo = Integer.parseInt(rvNoStr);
//		
//		ArrayList<Map<String, Object>> userRvDetailList = new UserService().userRvDetailList(rvNo);
//		request.setAttribute("rvDetailList", userRvDetailList);
//		request.setAttribute("rvNo", rvNo);
		
		
		request.getRequestDispatcher("WEB-INF/user/userMypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
