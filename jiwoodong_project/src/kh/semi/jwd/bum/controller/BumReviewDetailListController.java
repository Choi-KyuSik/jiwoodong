package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;

/**
 * Servlet implementation class BumReviewDetailListController
 */
@WebServlet("/bumReviewDetailList")
public class BumReviewDetailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumReviewDetailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNoStr = request.getParameter("rvNo");
		int rvNo = Integer.parseInt(rvNoStr);
		
		ArrayList<Map<String, Object>> bumRvDetailList = new BumService().bumRvDetailList(rvNo);
		request.setAttribute("rvDetailList", bumRvDetailList);
		request.setAttribute("rvNo", rvNo);
		
		request.getRequestDispatcher("WEB-INF/review/bumreviewdetail.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
