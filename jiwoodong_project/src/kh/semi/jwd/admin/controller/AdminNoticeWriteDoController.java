package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;
import kh.semi.jwd.admin.model.vo.AdminVo;

/**
 * Servlet implementation class AdminNoticeWriteDoController
 */
@WebServlet("/AdminNoticeWriteDo")
public class AdminNoticeWriteDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeWriteDoController() {
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
		request.setCharacterEncoding("UTF-8");
		String ntTitle = request.getParameter("ntTitle");
		String ntContent = request.getParameter("ntContent");
		String flGno = request.getParameter("fileUrl");
		
		
		System.out.println("제목 : " + ntTitle + ", 내용 : " + ntContent);
		
//		AdminVo advo = (AdminVo) request.getSession().getAttribute("AdminNoticeVo");
//		id = advo.getAdId();
//		
//		System.out.println("관리자아이디 : " + id);
		
		AdminNoticeVo adnvo = new AdminNoticeVo();
//		adnvo.setNtNo(10);
		adnvo.setNtTitle(ntTitle);
		adnvo.setNtContent(ntContent);
		adnvo.setFlGno(flGno);
//		adnvo.setNtWriteDate(ntWriteDate);
//		adnvo.setNtCount(0);
//		adnvo.setFlGno(null);
		int result = new AdminNoticeService().insertNotice(adnvo);
		if(result < 1) {
			System.out.println("글등록 실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('글 등록에 실패하였습니다.'); location.href='AdminNoticeList'");
			out.println("</script>");
			out.flush();
		} else {
			System.out.println("글등록 성공!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정상적으로 등록하였습니다.'); location.href='AdminNoticeList'");
			out.println("</script>");
			out.flush();
			// response.sendRedirect("AdminNoticeList");
		}
		
	}

}
