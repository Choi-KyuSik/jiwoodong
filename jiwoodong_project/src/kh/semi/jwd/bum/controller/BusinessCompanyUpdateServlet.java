package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BusinessCompanyUpdateServlet
 */
@WebServlet("/bucpupdate")
public class BusinessCompanyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessCompanyUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		   
		   //가져온 세션에서 속성명을 통해 데이터 값을 가져와서 String 변수에 저장
		   String bu_id = (String)session.getAttribute("bu_id");
		   String password = (String)session.getAttribute("password");

		String buNumber = request.getParameter("buNumber");
		String buId = request.getParameter("buId");
		String buPwd = request.getParameter("buPwd_2");
		String buName = request.getParameter("buName");
		String buBirth = request.getParameter("buBirth");
		String buEmail = request.getParameter("buEmail");
		String buTel = request.getParameter("buTel");

		BumVo vo = new BumVo();
		vo.setBuNumber(buNumber);
		vo.setBuId(buId);
		vo.setBuPwd(buPwd);
		vo.setBuName(buName);
		vo.setBuBirth(buBirth);
		vo.setBuEmail(buEmail);
		vo.setBuTel(buTel);

		int result = new BumService().companyUpdate(bu_id, vo);

		if (result < 1) {
			System.out.println("내 정보 수정 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('수정에 실패하였습니다.'); location.href='BumMainPage");
			out.println("</script>");
			out.flush();
		} else {
			System.out.println("내 정보 수정 성공!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 수정되었습니다.'); location.href='BumMainPage'");
			out.println("</script>");
			out.flush();
		}

	}

}
