package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.jwd.bum.model.service.BusinessReservationService;
import kh.semi.jwd.bum.model.vo.BumReservationVo;

/**
 * Servlet implementation class BusinessReservationSelectStatus
 */
@WebServlet("/selectStatusDayHotel")
public class BusinessReservationSelectStatusDayHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationSelectStatusDayHotelServlet() {
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
//		response.setCharacterEncoding("UTF-8"); // 이건 필터가 하니까..  암튼.. gson을 쓰면 이 모든것 신경안써도 됨ㅎㅎㅎ
		response.setContentType("application/json");   // 보낼때 text.html이 아니라 json 형태다.. 티내주고 가는거에요 심플도 많이 쓰니까.. 이 어렵ㅂ고 힘든것도 해봐야 gson의 고마움을 알죠 ㅎㅎㅎㅎ그럼 전 이만
        PrintWriter out = response.getWriter();
		String date = request.getParameter("day");
		String status = request.getParameter("status");
		int cpNo = (int) request.getSession().getAttribute("cpNo");
		ArrayList<BumReservationVo> list = new BusinessReservationService().selectStatusHotel(date, cpNo, status);
Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		String list1 = gson.toJson(list);
		out.println(list1);
		out.flush();
		out.close();
	}

}
