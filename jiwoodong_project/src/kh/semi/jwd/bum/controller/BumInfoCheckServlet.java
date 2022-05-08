package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BumInfoCheckServlet
 */
@WebServlet("/buminfocheck")
public class BumInfoCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumInfoCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */	
		protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			   
			   //가져온 세션에서 속성명을 통해 데이터 값을 가져와서 String 변수에 저장
			   String bu_id = (String)session.getAttribute("bu_id");
			   String password = (String)session.getAttribute("password");

			   BumVo bvo = new BumService().companyCheck(bu_id);
			request.setAttribute("bvo", bvo);
			
			request.getRequestDispatcher("WEB-INF/bum/bumInfoCheckPage.jsp").forward(request, response);

		}


	}


