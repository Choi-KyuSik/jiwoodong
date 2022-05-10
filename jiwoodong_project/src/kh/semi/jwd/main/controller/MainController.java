package kh.semi.jwd.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.admin.model.service.AdminNoticeService;
import kh.semi.jwd.admin.model.vo.AdminNoticeVo;
import kh.semi.jwd.bum.model.vo.CompanyVo;
import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // System.out.println("diur;");
		 ArrayList<AdminNoticeVo> adnolist = new AdminNoticeService().noticeList();
		 ArrayList<CompanyVo> usCpList = new UserService().usCpList();
		 // System.out.println("왜 이거 안찍혀 ? : " + adnolist);
		 
		 request.setAttribute("adnolist", adnolist);
		 request.setAttribute("usCpList", usCpList);
		 
		request.getRequestDispatcher("WEB-INF/mainpage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
