package kh.semi.jwd.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import kh.semi.jwd.user.model.service.UserService;
import kh.semi.jwd.user.model.vo.UserVo;

/**
 * Servlet implementation class UserEnrollController
 */
@WebServlet("/userenroll.lo")
public class UserEnrollDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEnrollDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/enroll/userEnrollPage.jsp").forward(request, response);
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
	
		UserVo vo = new UserVo();
		vo.setUmName(name);
		vo.setUmBirth(birth);
		vo.setUmGender(gender);
		vo.setUmTel(phone);
		vo.setUmEmail(email);
		vo.setUmId(user_id);
		vo.setUmPwd(password);
		vo.setUmPostode(postcode);
		vo.setUmAddress(address);
		vo.setUmDetailAddress(detailAddress);
		
		System.out.println("UserEnrollcontroller vo: "+ vo);
		
		int result = new UserService().insertUserMember(vo);
		
		System.out.println("UserEnrollcontroller result : "+result);
		
		if(result == 0) {
			//회원가입 실패
			System.out.println("회원가입 실패=======");
			
		} else {
			System.out.println("회원가입 성공!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('지우동에 오신걸 환영합니다.'); location.href='/jwd'");
			out.println("</script>");
			out.flush();
			// response.sendRedirect(request.getContextPath());
		}
	}

}
