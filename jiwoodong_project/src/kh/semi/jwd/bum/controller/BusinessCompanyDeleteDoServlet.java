package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;
import kh.semi.jwd.bum.model.vo.CompanyVo;

/**
 * Servlet implementation class BusinessCompanyDeleteDoServlet
 */
@WebServlet("/bucpdeletedo")
public class BusinessCompanyDeleteDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusinessCompanyDeleteDoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int buNo = 5;
		int result = 0;
		int result2 = 0;

		BumVo vo = new BumVo();
		vo.setBuNo(buNo);


		CompanyVo cvo = new CompanyVo();
		cvo.setBuNo(buNo);

		result = new BumService().bumDelete(vo);
		System.out.println("사업자 사용여부:" + vo);
		
		
		if(result < 1) {
			System.out.println("회원 탈퇴 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('회원 탈퇴에 실패하였습니다.'); location.href='BumMainPage'");
			out.println("</script>");
			out.flush();
		} else {
			System.out.println("회원 탈퇴 성공!");
			result2 = new BumService().companyDelete(cvo);
			System.out.println("CompanyVo cvo:" + cvo);
			System.out.println("업체 사용여부:" + result2);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 회원 탈퇴 되었습니다.'); location.href='bucpdeleteresult'");
			out.println("</script>");
			out.flush();
		}
		
	}
}
