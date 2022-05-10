package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.admin.model.vo.AdminVo;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin.lo")
public class AdminLoginDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("WEB-INF/login/adminLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String adId = request.getParameter("id");
//		String adPw = request.getParameter("pwd");
//		System.out.println(adId + "님 로그인 되셨습니다. 비밀번호는 " + adPw + "이군요");
//		
//		// 한글깨짐현상 방지
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		
//		request.getRequestDispatcher("AdminMyPage");
		String ad_id = request.getParameter("ad_id");
		String password = request.getParameter("password");
		
		System.out.println("ad_id : " + ad_id);
		System.out.println("password : " + password);
		
		AdminVo vo = new AdminVo();
		vo.setAdId(ad_id);
		vo.setAdPw(password);
		vo.setAdNo(vo.getAdNo());
		AdminVo result = new AdminService().loginAdmin(vo);
		System.out.println("controller AdminVo :"+result);
		
		if(result != null && result.getAdId() !=null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("ad_id", result.getAdId());
			session.setAttribute("password", result.getAdPw());
			session.setAttribute("adNo", result.getAdNo());
			
			System.out.println("ad_id:"+ad_id);
			System.out.println("password:"+password);
			System.out.println("adno:"+result.getAdNo());
			
			System.out.println("관리자 로그인 성공");
			response.sendRedirect("AdminMainPage");
		}else {
			// 로그인 실패
			System.out.println("로그인 해주세요");
			//response.sendRedirect("userLogin");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디/비밀번호를 확인해주세요.'); location.href='AdminLogin';</script>");
			out.flush();
		}
	}

}
