package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserBookingListVo;

/**
 * Servlet implementation class UserBookingList_h_Controller
 */
@WebServlet("/UserBookingList_r")
public class UserBookingList_r_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBookingList_r_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String umId = (String) request.getSession().getAttribute("um_id");
		
		ArrayList<Map<String, Object>> bklist_r = new UserService().usBkList_r(umId);
		
		request.setAttribute("bklist_r", bklist_r);
		
		System.out.println("bklist_r 담겻니" + bklist_r);
		
//		request.getRequestDispatcher("WEB-INF/user/userCompanyDetail.jsp").forward(request, response);
//		request.getRequestDispatcher("WEB-INF/user/userCompanyList.jsp").forward(request, response);
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
