
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Random;

/**
 * Servlet implementation class register_validate
 */
public class register_validate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public register_validate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

//		response.getWriter().append("Served at: hello").append(request.getParameter("uname"));
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		byte[] array = new byte[6]; // length is bounded by 7
	    new Random().nextBytes(array);
	    String generatedString = new String(array, Charset.forName("UTF-8"));

	    System.out.println(generatedString);

		String name = request.getParameter("name");
		String password = request.getParameter("psw");
		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String ghichu = request.getParameter("ghichu");
//		String EPassword = request.getParameter("EnPsw");
		String role = request.getParameter("EnPsw");
		

		response.setContentType("text/json;charset=utf-8");

		HttpSession session = request.getSession();

		if (name.equals("")) {
			session.setAttribute("thongbaoName", "* Chưa nhập dữ liệu!");
		} else {
			session.setAttribute("thongbaoName", "");
		}
		if (username.equals("")) {
			session.setAttribute("thongbaoUname", "* Chưa nhập dữ liệu!");
		} else {
			session.setAttribute("thongbaoUname", "");
		}
		if (email.equals("")) {
			session.setAttribute("thongbaoEmail", "* Chưa nhập dữ liệu!");
		} else {
			session.setAttribute("thongbaoEmail", null);
		}
//		if (password.equals("")) {
//			session.setAttribute("thongbaoPwd", "* Chưa nhập dữ liệu!");
//		} else {
//			session.setAttribute("thongbaoPwd", "");
//		}
		/*
		 * if (EPassword.equals("")) { session.setAttribute("thongbaoEPwd",
		 * "* Chưa nhập dữ liệu!"); } else { if (EPassword.equals(password)) {
		 * session.setAttribute("thongbaoEPwd", ""); } else {
		 * session.setAttribute("thongbaoEpwd", "* Không trùng khớp!"); } }
		 */

		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
