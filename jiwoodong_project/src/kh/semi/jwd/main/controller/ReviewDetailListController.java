package kh.semi.jwd.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.user.model.service.UserService;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/ReviewDetailList")
public class ReviewDetailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rvNo = 10;
		
		ArrayList<Map<String, Object>> rvDetailList = new UserService().rvDetailList(rvNo);
		
		System.out.println("rvDetailList : " + rvDetailList);
		
		request.setAttribute("rvDetailList", rvDetailList);
		
		System.out.println("잘 넘어 왔을까용 ? ? ? ? ?? ? ??  ?? doget ");
		request.getRequestDispatcher("WEB-INF/review/reviewDetailList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
