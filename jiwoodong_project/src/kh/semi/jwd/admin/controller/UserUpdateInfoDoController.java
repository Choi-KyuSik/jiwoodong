package kh.semi.jwd.admin.controller;

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
 * Servlet implementation class UserUpdateInfoDoController
 */
@WebServlet("/UserUpdateInfoDo")
public class UserUpdateInfoDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateInfoDoController() {
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
		String umPwd = request.getParameter("umPwd_2");
		String umName = request.getParameter("umName");
		String umBirth = request.getParameter("umBirth");
		String umTel = request.getParameter("umTel");
		String umEmail = request.getParameter("umEmail");
		String umPostcode = request.getParameter("umPostcode");
		String umAddress = request.getParameter("umAddress");
		String umDetailAddress = request.getParameter("umDetailAddress");
		
		UserVo uvo = new UserVo();
		uvo.setUmId(umId);
		uvo.setUmPwd(umPwd);
		uvo.setUmName(umName);
		uvo.setUmBirth(umBirth);
		uvo.setUmTel(umTel);
		uvo.setUmEmail(umEmail);
		uvo.setUmPostode(umPostcode);
		uvo.setUmAddress(umAddress);
		uvo.setUmDetailAddress(umDetailAddress);
		
		// System.out.println("uvo : " + uvo);
		
		int result = new UserService().updateUmInfo(uvo);
		
		if(result < 1) {
			System.out.println("내 정보 수정 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('수정에 실패하였습니다.'); location.href='UserMypage");
			out.println("</script>");
			out.flush();
		} else {
			System.out.println("내 정보 수정 성공!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 수정되었습니다.'); location.href='UserMypage'");
			out.println("</script>");
			out.flush();
		}
		
	}

}
