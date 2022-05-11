package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

/**
 * Servlet implementation class AdminNoticeUpdateDoController
 */
@WebServlet("/AdminNoticeUpdateDo")
public class AdminNoticeUpdateDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateDoController() {
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
		String ntTitle = request.getParameter("ntTitle");
		String ntContent = request.getParameter("ntContent");
		String ntNoStr = request.getParameter("ntNo");
		int ntNo = Integer.parseInt(ntNoStr);
		String flGno = request.getParameter("fileUrl");
		// System.out.println("파일지앤오야!!!!! : " + flGno);
		
		System.out.println("제목 : " + ntTitle + ", 내용 : " + ntContent + ", 글번호 : " + ntNo);
		
		AdminNoticeVo adnvo = new AdminNoticeVo();
		adnvo.setNtTitle(ntTitle);
		adnvo.setNtContent(ntContent);
		adnvo.setNtNo(ntNo);
		adnvo.setFlGno(flGno);
		
		System.out.println("flGno : " + flGno);
		
		int result = 0;
		
		if(flGno != "") {
			result = new AdminNoticeService().updateNotice(adnvo);
		} else {
			result = new AdminNoticeService().updateNoticeNtNc(adnvo);
		}
		
		if(result < 1) {
			System.out.println("글수정 실패!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('글 수정에 실패하였습니다.'); location.href='AdminNoticeList'");
			out.println("</script>");
			// request.getRequestDispatcher("AdminNoticeList").forward(request, response);
//			response.sendRedirect("AdminMainPage");
		} else {
			System.out.println("글수정 성공!");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('글이 수정되었습니다.'); location.href='AdminNoticeList'");
			out.println("</script>");
			// request.getSession().setAttribute("tabMenu", "1");
			// response.sendRedirect("AdminNoticeList");
		}
	}

}
