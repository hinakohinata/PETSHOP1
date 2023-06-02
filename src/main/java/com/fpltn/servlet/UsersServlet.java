package com.fpltn.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import org.hibernate.Session;

import com.fpltn.dao.DanhMucDao;
import com.fpltn.dao.UserDao;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.User;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class UsersServlet
 */
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Tạo 1 Hibernate Session từ HibernateUtil
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		UserDao dmDao = new UserDao();
		String action = request.getParameter("action");

		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session = request.getSession();

		switch (action) {
		case "loadData": {

			break;
		}
		case "delete": {

			// Tạo 1 Hibernate Session từ HibernateUtil
//			Session hbsession = HibernateUtil.getSessionFactory().openSession();
//			hbsession.beginTransaction();

			int iduser = Integer.parseInt(request.getParameter("iduser"));
			dmDao = new UserDao();
			dmDao.delete(iduser);
			break;
		}
		case "create": {
			List<User> danhSachDanhMuc = dmDao.getUser();
//			danhSachDanhMuc.forEach(s -> System.out.println(s.getUsername())); // Xuất thử ra console

			// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
			session.setAttribute("listUser", danhSachDanhMuc);

			break;
		}
		case "upform": {
			List<User> danhSachDanhMuc = dmDao.getUser();
//			danhSachDanhMuc.forEach(s -> System.out.println(s.getUsername())); // Xuất thử ra console

			// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
			session.setAttribute("listUser", danhSachDanhMuc);

			break;

		}
		case "up": {

			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
		List<User> danhSachDanhMuc = dmDao.getUser();
//		danhSachDanhMuc.forEach(s -> System.out.println(s.getTendm())); // Xuất thử ra console

		// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
		session.setAttribute("listUser", danhSachDanhMuc);

		/* session.setAttribute("upForm", "false"); */
		response.sendRedirect("mgrUsers.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");

		UserDao dmDao = new UserDao();
		List<User> danhSachDanhMuc = dmDao.getUser();

		String action = request.getParameter("action");
		
		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session = request.getSession();
		switch (action) {
		case "create": {
			//int iddm = danhSachDanhMuc.get(danhSachDanhMuc.size() - 1).getId() + 1;// Integer.parseInt(request.getParameter("iddm"));
			int id = danhSachDanhMuc.get(danhSachDanhMuc.size() - 1).getId() + 1;
			String uname = request.getParameter("uname");
			String epsw = request.getParameter("psw");
			String ename = request.getParameter("name");
			String email = request.getParameter("email");
			String erole = request.getParameter("role");
			String eghichu = request.getParameter("ghichu");
			System.out.println(erole);
			int check=0;
			for(User i:danhSachDanhMuc) {
				if(i.getUsername().equals(uname)) {
					session.setAttribute("thongbaoErU", "Username đã tồn tại!");
					check=1;
					break;
				}else {
					session.setAttribute("thongbaoErU", null);
				}
			}
			if(check==0) {

				User dmuc = new User();
				dmuc.setId(id);;
				dmuc.setUsername(uname);
				dmuc.setPassword(epsw);
				dmuc.setFullname(ename);
				dmuc.setEmail(email);
				dmuc.setUserrole(erole);
				dmuc.setGhichu(eghichu);
				// Tạo 1 Hibernate Session từ HibernateUtil
				Session hbsession = HibernateUtil.getSessionFactory().openSession();
				hbsession.beginTransaction();

				hbsession.save(dmuc);
				hbsession.getTransaction().commit();
			}

			break;
		}
		case "upform": {
			int id = Integer.parseInt(request.getParameter("eid"));
			String uname = request.getParameter("euname");
			String epsw = request.getParameter("epsw");
			String ename = request.getParameter("ename");
			String eemail = request.getParameter("eemail");
			String erole = request.getParameter("erole");
			String eghichu = request.getParameter("eghichu");
			System.out.println("erole "+erole+ "uname "+uname);

			User dmuc = new User();

			dmuc = UserDao.findById(id);

			dmuc.setUsername(uname);
			dmuc.setPassword(epsw);
			dmuc.setFullname(ename);
			dmuc.setEmail(eemail);
			
			dmuc.setUserrole(erole);
			dmuc.setGhichu(eghichu);
			
			System.out.println(dmuc.getUsername());
			UserDao.update(dmuc);

			break;
		}
		case "delete": {
			// Tạo 1 Hibernate Session từ HibernateUtil
			Session hbsession = HibernateUtil.getSessionFactory().openSession();
			hbsession.beginTransaction();

			int iddm = Integer.parseInt(request.getParameter("id"));
			dmDao = new UserDao();
			dmDao.delete(iddm);

			break;
		}
		case "up": {

			break;
		}
		}

		doGet(request, response);
	}

}
