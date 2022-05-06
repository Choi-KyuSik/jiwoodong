package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminBuAcceptResultController
 */
@WebServlet("/AdminBuAcceptResult")
public class AdminBuAcceptResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBuAcceptResultController() {
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
		// System.out.println("여기까지 잘 넘어왔냥?");

		String cpNoStr = request.getParameter("cpNo");
		String rejectMsg = request.getParameter("rejectMsg");
		int cpNo = Integer.parseInt(cpNoStr);

		System.out.println("cpNo뭐야?" + cpNo + ", 거절메세지 뭐야?" + rejectMsg);

		if(rejectMsg == "" || rejectMsg == " ") {
			int cpacApproval = new AdminService().companyAcceptApproval(cpNo);
			// request.setAttribute("cpacApproval", cpacApproval);
			if(cpacApproval < 1) {
				System.out.println("승인 수락 실패");
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('승인에 실패하였습니다.'); location.href='AdminBuAcceptList'");
				out.println("</script>");
				out.flush();
			} else {
				System.out.println("승인 수락 성공");
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('정상적으로 승인되었습니다.'); location.href='AdminBuAcceptList'");
				out.println("</script>");
				out.flush();
			}
		} else {
			int cpacReject = new AdminService().companyAcceptReject(rejectMsg, cpNo);
			// request.setAttribute("cpacReject", cpacReject);
			if(cpacReject < 1) {
				System.out.println("승인 거절 실패");
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('승인 거절에 실패하였습니다.'); location.href='AdminBuAcceptList'");
				out.println("</script>");
				out.flush();
			} else {
				System.out.println("승인 거절 성공");
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('정상적으로 승인 거절되었습니다.'); location.href='AdminBuAcceptList'");
				out.println("</script>");
				out.flush();
			}
		}
		
		response.sendRedirect("AdminBuAcceptList");
	}

}
