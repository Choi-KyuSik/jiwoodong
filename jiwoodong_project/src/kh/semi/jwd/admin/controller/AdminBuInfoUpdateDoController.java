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
@WebServlet("/AdminBuInfoUpdateDo")
public class AdminBuInfoUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuInfoUpdateDoController() {
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
		String buName = request.getParameter("buName");
		String buBirth = request.getParameter("buBirth");
		String buTel = request.getParameter("buTel");
		String buEmail = request.getParameter("buEmail");
		int buNo = Integer.parseInt(buNoStr);
		
		BumVo bvo = new BumVo();
		bvo.setBuNo(buNo);
		bvo.setBuName(buName);
		bvo.setBuBirth(buBirth);
		bvo.setBuTel(buTel);
		bvo.setBuEmail(buEmail);
		
		int result = new AdminService().updateBuInfo(bvo);
		
		if(result < 1) {
			System.out.println("사업자 정보 수정 실패!");
			request.getRequestDispatcher("AdminBuInfoList").forward(request, response);
		} else {
			System.out.println("사업자 정보 수정 성공!");
			// request.getSession().setAttribute("tabMenu", "3");
			response.sendRedirect("AdminBuInfoList");
		}
		
	}

}
