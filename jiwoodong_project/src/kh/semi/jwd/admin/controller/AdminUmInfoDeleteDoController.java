package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.user.model.vo.AdminUserVo;

/**
 * Servlet implementation class AdminBuInfoUpdateDoController
 */
@WebServlet("/AdminUmInfoDeleteDo")
public class AdminUmInfoDeleteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUmInfoDeleteDoController() {
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
		String umId = request.getParameter("umId");
		
		AdminUserVo uvo = new AdminUserVo();
		uvo.setUmId(umId);
		
		int result = new AdminService().deleteUmInfo(uvo);
		
		if(result < 1) {
			System.out.println("사용자 회원 탈퇴 실패!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('사용자 회원 탈퇴에 실패하였습니다.'); location.href='AdminUsInfoList'");
			out.println("</script>");
			// request.getRequestDispatcher("AdminUsInfoList").forward(request, response);
		} else {
			System.out.println("사용자 회원 탈퇴 성공!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('사용자 회원 탈퇴가 정상 처리되었습니다.'); location.href='AdminUsInfoList'");
			out.println("</script>");
			// request.getSession().setAttribute("tabMenu", "3");
			// response.sendRedirect("AdminUsInfoList");
		}
		
	}

}
