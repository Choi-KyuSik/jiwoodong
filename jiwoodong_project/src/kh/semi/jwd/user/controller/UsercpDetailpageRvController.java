package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UsercpDetailpageService;

/**
 * Servlet implementation class UsercpDetailpageRvController
 */
@WebServlet("/usercpdetailreview")
public class UsercpDetailpageRvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsercpDetailpageRvController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String cpNoStr = request.getParameter("cpNo");
//		int cpNo = Integer.parseInt(cpNoStr);
		int cpNo = (int) request.getSession().getAttribute("cpNo");
		System.out.println("cpNo : " + cpNo);
		
		ArrayList<Map<String, Object>> uscpRvList = new UsercpDetailpageService().uscpRvList(cpNo);
		request.setAttribute("uscprvlist", uscpRvList);
		System.out.println("리뷰 리스트 어디갔니 " + uscpRvList);
		request.getRequestDispatcher("WEB-INF/user/userCompanyDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
