package kh.semi.jwd.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class AdminBuInfoDetailListController
 */
@WebServlet("/AdminBuInfoDetailList")
public class AdminBuInfoDetailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBuInfoDetailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cpNoStr = request.getParameter("cpNo");
		int cpNo = Integer.parseInt(cpNoStr);
		
		System.out.println("업체등록번호 내놔 : " + cpNo);
		
		BumVo buMemberDetail = new AdminService().buMemberDetailInfo(cpNo);
		// ArrayList<BumVo> buMemberDeleteList = new AdminService().buMemberDeleteList();
		
		System.out.println("======================");
		System.out.println("buMemberDetail : " + buMemberDetail);
		
		request.setAttribute("buMemberDetail", buMemberDetail);
		// request.setAttribute("buMemberDeleteList", buMemberDeleteList);
		
		request.getRequestDispatcher("WEB-INF/admin/adminBuInfoDetailList.jsp").forward(request, response);
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
