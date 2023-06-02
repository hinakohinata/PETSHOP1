package com.fpltn.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.fpltn.dao.DanhMucDao;
import com.fpltn.dao.SanPhamDao;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Sanpham;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class LoadDataServlet
 */
public class LoadDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadDataServlet() {
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
		response.setContentType("text/json; charset=UTF-8");
		
		// Tạo 1 Hibernate Session từ HibernateUtil
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		DanhMucDao dmDao = new DanhMucDao();
		SanPhamDao spDao = new SanPhamDao();

		List<Danhmuc> danhSachDanhMuc = dmDao.getDanhMuc();
		List<Sanpham> danhSachSanPham = spDao.getSanpham();
		danhSachDanhMuc.forEach(s -> System.out.println(s.getTendm())); // Xuất thử ra console
		danhSachSanPham.forEach(s -> System.out.println(s.getTensp()+s.getDanhmuc().getIddm())); // Xuất thử ra console

		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session =  request.getSession();

		// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
		session.setAttribute("listDM", danhSachDanhMuc);
		session.setAttribute("listSP", danhSachSanPham);
		response.sendRedirect("index.jsp");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
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
