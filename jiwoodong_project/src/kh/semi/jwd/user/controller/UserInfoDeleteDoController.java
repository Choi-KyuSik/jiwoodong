package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserVo;

/**
 * Servlet implementation class UserInfoDeleteDoController
 */
@WebServlet("/UserInfoDeleteDo")
public class UserInfoDeleteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoDeleteDoController() {
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
		System.out.println("umId : " + umId);
		
		UserVo uvo = new UserVo();
		uvo.setUmId(umId);
		
		int result = new UserService().deleteUmInfo(uvo);
		
		if(result < 1) {
			System.out.println("회원 탈퇴 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('회원 탈퇴에 실패하였습니다.'); location.href='UserMypage'");
			out.println("</script>");
			out.flush();
		} else {
			System.out.println("회원 탈퇴 성공!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 회원 탈퇴 되었습니다.'); location.href='UserInfoDeleteResult'");
			out.println("</script>");
			out.flush();
		}
		
	}

}
