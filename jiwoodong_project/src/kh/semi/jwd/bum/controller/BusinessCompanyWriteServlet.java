package kh.semi.jwd.bum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;
import kh.semi.jwd.bum.model.vo.BumVo;

/**
 * Servlet implementation class BusinessCompanyWriteServlet
 */
@WebServlet("/bucompany")
public class BusinessCompanyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusinessCompanyWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();		   
		   //������ ���ǿ��� �Ӽ����� ���� ������ ���� �����ͼ� String ������ ����
		   String bu_id = (String)session.getAttribute("bu_id");
		   String password = (String)session.getAttribute("password");
		
		response.setContentType("text/html; charset=utf-8");
		BumVo bvo = new BumService().companyCheck(bu_id);
		request.setAttribute("bvo", bvo);
		request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
		
		
//		String result2 = new BumService().companyWriteCheck(buNo);
//		request.setAttribute("cpSignYn", result2);
//		//��ü��� �ߺ����� Ȯ��
//		System.out.println(result2);
//		if(result2.length() < 1) {
//			request.getRequestDispatcher("WEB-INF/bum/businessCompanyWritePage.jsp").forward(request, response);
//		} else {
//			request.setAttribute("msg", "�̹� ��ϵǾ��ų� ���� ������Դϴ�.");
//			response.sendRedirect(request.getContextPath()+"/BumMainPage?msg=a");
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
