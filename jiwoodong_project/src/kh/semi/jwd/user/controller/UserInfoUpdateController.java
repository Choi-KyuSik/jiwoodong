package kh.semi.jwd.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserVo;

/**
 * Servlet implementation class UserUpdateInfoController
 */
@WebServlet("/UserInfoUpdate")
public class UserInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umId = "apple";
		
		UserVo usMemberListInfo = new UserService().usMemberListInfo(umId);
		request.setAttribute("usMemberListInfo", usMemberListInfo);
		
		request.getRequestDispatcher("WEB-INF/user/userInfoUpdate.jsp").forward(request, response);
	}

}
