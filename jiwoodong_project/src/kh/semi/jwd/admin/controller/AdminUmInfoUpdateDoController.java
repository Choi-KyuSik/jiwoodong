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
@WebServlet("/AdminUmInfoUpdateDo")
public class AdminUmInfoUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUmInfoUpdateDoController() {
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
		String umName = request.getParameter("umName");
		String umBirth = request.getParameter("umBirth");
		String umTel = request.getParameter("umTel");
		String umEmail = request.getParameter("umEmail");
		String umPostcode = request.getParameter("umPostcode");
		String umAddress = request.getParameter("umAddress");
		String umDetailAddress = request.getParameter("umDetailAddress");
		
		AdminUserVo uvo = new AdminUserVo();
		uvo.setUmId(umId);
		uvo.setUmName(umName);
		uvo.setUmBirth(umBirth);
		uvo.setUmTel(umTel);
		uvo.setUmEmail(umEmail);
		uvo.setUmPostcode(umPostcode);
		uvo.setUmAddress(umAddress);
		uvo.setUmDetailAddress(umDetailAddress);
		
		int result = new AdminService().updateUmInfo(uvo);
		
		if(result < 1) {
			System.out.println("사용자 정보 수정 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('사용자 정보 수정에 실패하였습니다.'); location.href='AdminUsInfoList'");
			out.println("</script>");
			out.flush();
			// request.getRequestDispatcher("AdminMainPage").forward(request, response);
		} else {
			System.out.println("사용자 정보 수정 성공!");
			// request.getSession().setAttribute("tabMenu", "3");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('사용자 정보 수정이 정상처리되었습니다.'); location.href='AdminUsInfoList'");
			out.println("</script>");
			out.flush();
			// response.sendRedirect("AdminMainPage");
		}
		
	}

}
