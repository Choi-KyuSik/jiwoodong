package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kh.semi.jwd.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminNoticeDetailReadController
 */
@WebServlet("/AdminBuDetailInfo")
public class AdminBuDetailInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuDetailInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cpNoStr = request.getParameter("cpNo");
		int cpNo = Integer.parseInt(cpNoStr);
//		AdminNoticeVo anvo = new AdminNoticeVo();
//		int ntNo = anvo.getNtNo();
		System.out.println("cpNo의 값은?" + cpNo);
		
		ArrayList<Map<String, Object>> adBuAccept = new AdminService().companyAcceptDetailRead(cpNo);
		
		request.setAttribute("adBuAccept", adBuAccept);
		System.out.println("adBuAccept" + adBuAccept);
		
		request.getRequestDispatcher("WEB-INF/admin/adminBuDetailInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}