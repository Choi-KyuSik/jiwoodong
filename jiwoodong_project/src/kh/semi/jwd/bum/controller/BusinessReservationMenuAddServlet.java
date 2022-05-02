package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.semi.jwd.bum.model.service.BusinessReservationService;

/**
 * Servlet implementation class BusinessReservationMenuAddServlet
 */
@WebServlet("/burmenuadd")
public class BusinessReservationMenuAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationMenuAddServlet() {
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
		int cpNo = 14;
		/*
		 * String directory = "C:/z_workspace/z_java/jiwoodong_project/web/upload"; int
		 * sizeLimit = 100*1024*1024; //100MB 제한
		 * 
		 * MultipartRequest multi = new MultipartRequest(request, directory, sizeLimit,
		 * "UTF-8", new DefaultFileRenamePolicy() );
		 */
		
		String menuName = request.getParameter("menuName");
		String menuPrice = request.getParameter("menuPrice");
		String menuExplain = request.getParameter("menuExplain");
		String fileUrl = request.getParameter("fileUrl");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuName", menuName);
		map.put("menuPrice", menuPrice);
		map.put("menuExplain", menuExplain);
		map.put("fileUrl", fileUrl);
		
		int result = new BusinessReservationService().reservationMenuInsert(map, cpNo);
		
		response.sendRedirect("burmenu");
		
		
	}

}
