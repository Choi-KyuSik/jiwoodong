package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.dao.BumDao;
import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.ReviewVo;

/**
 * Servlet implementation class BumReviewListController
 */
@WebServlet("/reviewlist")
public class BumReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/review/reviewlist.jsp").forward(request, response);
		
//		BumService result = new BumService();
//		
//		// 사용자가 입력한 검색 조건을 Map에 저장
//		Map<String, Object> param = new HashMap<String, Object>(); 
//		String searchField = request.getParameter("searchField");
//		String searchWord = request.getParameter("searchWord");
//		if (searchWord != null) {
//		    param.put("searchField", searchField);
//		    param.put("searchWord", searchWord);
//		}
//		int totalCount = result.selectRvCount(param);  // 게시물 수 확인
//		List<ReviewVo> boardLists = result.selectRvList(param); // 게시물 목록 받기
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
