package kh.semi.jwd.bum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.jwd.bum.model.service.BumService;

/**
 * Servlet implementation class BumIdCheckContoroller
 */
@WebServlet("/bumNumCheck")
public class BumNumberCheckContoroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BumNumberCheckContoroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bu_num = request.getParameter("bu_num");


		PrintWriter out = response.getWriter();
		
		int result = new BumService().checkBuNum(bu_num);
		if (result == 0){
			System.out.println("이미 등록된 사업자번호 입니다");
		}else if(result == 0){
			System.out.println("사업자번호가 등록되었습니다.");
		}else{
			System.out.println("에러 발생!!!(-1)"); 
		}
//		out.println("<script language='javascript'>");
//		out.println("alert('정상적으로 등록하였습니다.'); location.href='userreviewlist'");
//		out.println("</script>");
		out.write(result + ""); // ajax 결과값인 result가 됨. 
		
		out.flush();

	}
}
