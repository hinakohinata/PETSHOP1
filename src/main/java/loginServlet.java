
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.fpltn.dao.UserDao;
import com.fpltn.entities.User;
import com.fpltn.util.EmailUtility;

/**
 * Servlet implementation class helloServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String generatedString = null;
	private User adUser;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
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
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}

		if (request.getParameter("action") == "check") {
			return;
		}
		String username = request.getParameter("uname");
		String password = request.getParameter("psw");
		System.out.println("username"+username+"password"+(password+username=="")+(password=="")+(username==""||password==""));
		int result = 0;
		if (username==""||password=="") {
			result = 5;
			request.setAttribute("thongbao", "Dữ liệu trống!");
		}
		System.out.println("username"+username+"password"+(password+username=="")+(password=="")+(username==""||password=="")+result);
		response.setContentType("text/json;charset=utf-8");
//		response.getWriter().append("Served at: hello").append(request.getParameter("uname"));
		HttpSession session = request.getSession();
		UserDao usDao = new UserDao();
		List<User> arrU = usDao.getUser();
		arrU.forEach(s -> System.out.println(s.getUsername())); // Xuất thử ra console
		session.setAttribute("listUS", arrU);

		User user = new User();

		for (User i : arrU) {
			if (i.getUsername().equals(username)) {
				if (i.getPassword().equals(password)) {
					result = 1;
					user = i;
					adUser = i;
				} else {
					result = 2;
				}
			}
		}
		switch (result) {

		case 2: {
			request.setAttribute("thongbao", "Mật khẩu không đúng!");
			break;
		}
		case 5: {
			request.setAttribute("thongbao", "Dữ liệu trống!");
			break;
		}
		case 0: {
			request.setAttribute("thongbao", "Tài khoản không đúng!");
			break;
		}
		case 1: {
			if (user.getUserrole().endsWith("Admin")) {

				int leftLimit = 97; // letter 'a'
				int rightLimit = 122; // letter 'z'
				int targetStringLength = 6;
				Random random = new Random();
				StringBuilder buffer = new StringBuilder(targetStringLength);
				for (int i = 0; i < targetStringLength; i++) {
					int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
					buffer.append((char) randomLimitedInt);
				}
				generatedString = buffer.toString();
				
				
				

		        ServletContext context = getServletContext();
		        String host = "smtp.gmail.com";
		        String port = "587";
		        String usermail = "bichnhung722@gmail.com";
		        String passmail = "vhdukxuohrrmargb";
		        // reads form fields
		        String recipient = user.getEmail();
		        String subject = "Mã xác thực đăng nhập";
		        String content = "Mã xác thực đăng nhập của bạn là "+generatedString+"\nChúc bạn 1 ngày vui vẻ!";
		 
		        String resultMessage = "";
		 
		        try {
					
					  EmailUtility.sendEmail(host, port, usermail, passmail, recipient, subject,
					  content);
		             resultMessage = "The e-mail was sent successfully";
					 
		        } catch (Exception ex) {
		            ex.printStackTrace();
		            resultMessage = "There were an error: " + ex.getMessage();
		        } finally {
		            request.setAttribute("Message", resultMessage);
		        }
	            System.out.println(resultMessage);
				
				
				
				
				
				
				
				

				System.out.println(generatedString);
				String eml = user.getEmail().substring(0, 4);
				String eml1 = user.getEmail().substring(user.getEmail().length() / 2);
//				System.out.println(eml+"   "+eml1+"   "+user.getEmail()+user.getEmail().length()/2+(user.getEmail().length()-user.getEmail().length()/2-1));
				String str = eml + "***" + eml1;
				session.setAttribute("useremail", str);
				response.sendRedirect("Result.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}

			return;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + result);
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (request.getParameter("action").equals("check")) {
			System.out.println("adUser.getUsername()    "+adUser.getUsername());
			if (request.getParameter("maCheck").equals(generatedString)) {
				session.setAttribute("userLogin", "true");
				session.setAttribute("username", adUser.getUsername());
				session.setAttribute("userid", adUser.getId());
				session.setAttribute("userrole", adUser.getUserrole());
				request.setAttribute("thongbao", "");
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				rd.forward(request, response);
			}
		}
		doGet(request, response);
	}

}
