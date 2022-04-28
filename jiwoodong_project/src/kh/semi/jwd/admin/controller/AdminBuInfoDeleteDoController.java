package kh.semi.jwd.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class AdminBuInfoUpdateDoController
 */
@WebServlet("/AdminBuInfoDeleteDo")
public class AdminBuInfoDeleteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuInfoDeleteDoController() {
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
		String buNoStr = request.getParameter("buNo");
		int buNo = Integer.parseInt(buNoStr);
		
		BumVo bvo = new BumVo();
		bvo.setBuNo(buNo);
		
		int result = new AdminService().deleteBuInfo(bvo);
		
		if(result < 1) {
			System.out.println("사업자 회원 탈퇴 실패!");
			request.getRequestDispatcher("AdminMainPage").forward(request, response);
		} else {
			System.out.println("사업자 회원 탈퇴 성공!");
			// request.getSession().setAttribute("tabMenu", "3");
			response.sendRedirect("AdminMainPage");
		}
		
	}

}
