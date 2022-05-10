package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class UserReviewDetailController
 */
@WebServlet("/userRvDetailList")
public class UserReviewDetailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewDetailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("안녕 rvNo?");
		String rvNoStr = request.getParameter("rvNo");
		int rvNo = Integer.parseInt(rvNoStr);
		
		
		System.out.println("rvNo?"+rvNo);
		ArrayList<Map<String, Object>> userRvDetailList = new UserService().userRvDetailList(rvNo);
		request.setAttribute("rvDetailList", userRvDetailList);
		request.setAttribute("rvNo", rvNo);
		
		request.getRequestDispatcher("WEB-INF/review/reviewdetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
