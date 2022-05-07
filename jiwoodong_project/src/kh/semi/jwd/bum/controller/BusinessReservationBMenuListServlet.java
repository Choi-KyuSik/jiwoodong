package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.semi.jwd.bum.model.service.BusinessReservationService;

/**
 * Servlet implementation class BusinessReservationBMenuListServlet
 */
@WebServlet("/bmenulistAjax")
public class BusinessReservationBMenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessReservationBMenuListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("bkno"));
		String bkno = request.getParameter("bkno");
		ArrayList<Map<String, Object>> list = new BusinessReservationService().bmenuList(bkno);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String result = gson.toJson(list);
		
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
	}

}
