package kh.semi.jwd.user.controller;

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

import kh.semi.jwd.user.model.service.UserReservationService;

/**
 * Servlet implementation class UserReservationMenuInfoServlet
 */
@WebServlet("/UserReservationMenuInfo")
public class UserReservationMenuInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReservationMenuInfoServlet() {
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
		String menuNo = request.getParameter("menuNo");
		ArrayList<Map<String, Object>> map = new UserReservationService().menuInfo(menuNo);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		PrintWriter out = response.getWriter();
		out.println(gson.toJson(map));
		out.flush();
		out.close();
	}

}
