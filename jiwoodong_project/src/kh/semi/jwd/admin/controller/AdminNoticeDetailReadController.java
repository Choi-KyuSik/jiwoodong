package kh.semi.jwd.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;

/**
 * Servlet implementation class AdminNoticeDetailReadController
 */
@WebServlet("/AdminNoticeDetailRead")
public class AdminNoticeDetailReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ntNoStr = request.getParameter("ntNo");
		int ntNo = Integer.parseInt(ntNoStr);
//		AdminNoticeVo anvo = new AdminNoticeVo();
//		int ntNo = anvo.getNtNo();
		System.out.println("ntNo의 값은?" + ntNo);
		
		AdminNoticeVo adnvoList = new AdminNoticeService().readNotice(ntNo);
		
		request.setAttribute("adnvoList", adnvoList);
		
		request.getRequestDispatcher("WEB-INF/admin/adminNoticeDetailRead.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
