package com.fpltn.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.fpltn.dao.DanhMucDao;
import com.fpltn.entities.Danhmuc;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class DanhMucServlet
 */
public class DanhMucServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhMucServlet() {
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
		// Tạo 1 Hibernate Session từ HibernateUtil
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		DanhMucDao dmDao = new DanhMucDao();
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

			int iddm = Integer.parseInt(request.getParameter("iddm"));
			dmDao = new DanhMucDao();
			dmDao.delete(iddm);
			break;
		}
		case "create": {
			System.out.print("Create");
			List<Danhmuc> danhSachDanhMuc = dmDao.getDanhMuc();
			danhSachDanhMuc.forEach(s -> System.out.println(s.getTendm())); // Xuất thử ra console

			// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
			session.setAttribute("listDM", danhSachDanhMuc);

			break;
		}
		case "upform": {

			break;
		}
		case "up": {

			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
		List<Danhmuc> danhSachDanhMuc = dmDao.getDanhMuc();
//		danhSachDanhMuc.forEach(s -> System.out.println(s.getTendm())); // Xuất thử ra console

		// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
		session.setAttribute("listDM", danhSachDanhMuc);

		/* session.setAttribute("upForm", "false"); */
		response.sendRedirect("mgrDanhMuc.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");

		DanhMucDao dmDao = new DanhMucDao();
		List<Danhmuc> danhSachDanhMuc = dmDao.getDanhMuc();

		String action = request.getParameter("action");
		
		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session = request.getSession();
		switch (action) {
		case "create": {
			int iddm = danhSachDanhMuc.get(danhSachDanhMuc.size() - 1).getIddm() + 1;// Integer.parseInt(request.getParameter("iddm"));
			String tendm = request.getParameter("tendm");
			String mota = request.getParameter("mota");

			Danhmuc dm = new Danhmuc();
			dm.setIddm(iddm);
			dm.setTendm(tendm);
			dm.setMota(mota);

			System.out.print(dm.getTendm());
			// Tạo 1 Hibernate Session từ HibernateUtil
			Session hbsession = HibernateUtil.getSessionFactory().openSession();
			hbsession.beginTransaction();

			// Lưu danh mục đã tạo ở trên
			hbsession.save(dm);

			hbsession.getTransaction().commit();
			break;
		}
		case "upform": {
			int iddm = Integer.parseInt(request.getParameter("eiddm"));
			String tendm = request.getParameter("etendm");
			String mota = request.getParameter("emotadm");
//
//			Danhmuc dm = new Danhmuc();
//			dm.setIddm(iddm);
//			dm.setTendm(tendm);
//			dm.setMota(mota);

			Danhmuc dmuc = new Danhmuc();

			dmuc = DanhMucDao.findById(iddm);

			dmuc.setTendm(tendm);
			dmuc.setMota(mota);
			DanhMucDao.update(dmuc);

			break;
		}
		case "delete": {

			// Tạo 1 Hibernate Session từ HibernateUtil
			Session hbsession = HibernateUtil.getSessionFactory().openSession();
			hbsession.beginTransaction();

			int iddm = Integer.parseInt(request.getParameter("iddm"));
			dmDao = new DanhMucDao();
			dmDao.delete(iddm);

			break;
		}
		case "up": {

			break;
		}
		}

		danhSachDanhMuc = dmDao.getDanhMuc();
		session.setAttribute("listDM", danhSachDanhMuc);

		/*
		 * String action = request.getParameter("action"); System.out.print(action);
		 */
		doGet(request, response);

	}

}
