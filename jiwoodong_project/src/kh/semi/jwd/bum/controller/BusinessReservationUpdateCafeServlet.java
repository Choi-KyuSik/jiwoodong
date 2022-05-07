package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BusinessReservationService;

/**
 * Servlet implementation class BusinessReservationUpdateServlet
 */
@WebServlet("/bursupdateCafe")
public class BusinessReservationUpdateCafeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationUpdateCafeServlet() {
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
		
		PrintWriter out = response.getWriter(); 
		String msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("bkNo", request.getParameter("bkno"));
			map.put("umId", request.getParameter("umid"));
			map.put("bkName", request.getParameter("bkname"));
			map.put("bkPhone", request.getParameter("bkphone"));
			map.put("bkDate", request.getParameter("bkdate"));
			map.put("bkTime", request.getParameter("bktime"));
			map.put("bkRequire", request.getParameter("bkrequire"));
			int cpNo = 14;
			int result = new BusinessReservationService().reservationUpdateCafe(map, cpNo);
			if(result < 0) {
				msg = "예약 수정 실패";
			} else {
				msg = "수정 성공";
			}
			out.println(msg);
			out.flush();
			out.close();
		
	}

}
