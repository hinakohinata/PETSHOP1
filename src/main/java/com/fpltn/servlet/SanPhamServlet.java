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
import com.fpltn.dao.SanPhamDao;
import com.fpltn.dao.UserDao;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Sanpham;
import com.fpltn.entities.User;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class SanPhamServlet
 */
public class SanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SanPhamServlet() {
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

		SanPhamDao dmDao = new SanPhamDao();
		DanhMucDao dmucDao = new DanhMucDao();
		String action = request.getParameter("action");

		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session = request.getSession();

		System.out.print(action);
		switch (action) {
		case "create": {

		}
		case "loadData": {
			List<Sanpham> danhSach = dmDao.getSanpham();
			List<Danhmuc> danhSachdm = dmucDao.getDanhMuc();
			danhSach.forEach(s -> System.out.println(s.getTensp())); // Xuất thử ra console

			// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
			session.setAttribute("listSP", danhSach);
			session.setAttribute("listDM", danhSachdm);

			break;
		}
		case "delete": {

			// Tạo 1 Hibernate Session từ HibernateUtil
//			Session hbsession = HibernateUtil.getSessionFactory().openSession();
//			hbsession.beginTransaction();

			int idsp = Integer.parseInt(request.getParameter("idsp"));
			dmDao = new SanPhamDao();
			dmDao.delete(idsp);
		}
		case "upform": {
			List<Sanpham> danhSach = dmDao.getSanpham();
			List<Danhmuc> danhSachdm = dmucDao.getDanhMuc();
			danhSach.forEach(s -> System.out.println(s.getTensp())); // Xuất thử ra console

			// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
			session.setAttribute("listSP", danhSach);
			session.setAttribute("listDM", danhSachdm);

			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}

		/* session.setAttribute("upForm", "false"); */
		response.sendRedirect("mgrSanPham.jsp");
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

		SanPhamDao spDao = new SanPhamDao();
		List<Sanpham> danhSach = spDao.getSanpham();

		String action = request.getParameter("action");

//		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		jakarta.servlet.http.HttpSession session = request.getSession();
		switch (action) {
		case "create": {
			int iduser = danhSach.get(danhSach.size() - 1).getId() + 1;// Integer.parseInt(request.getParameter("iddm"));
			String masp = request.getParameter("masp");
			String tensp = request.getParameter("tensp");
			String mota = request.getParameter("mota");
			String giaban = request.getParameter("giaban");
			String hinhanh = request.getParameter("hinhanh");
			int danhmuc = Integer.parseInt(request.getParameter("danhmuc"));
			String soluong = request.getParameter("soluong");
			String daban = request.getParameter("daban");
			String ghichu = request.getParameter("ghichu");
			int check = 0;

			for (Sanpham i : SanPhamDao.getSanpham()) {
				if (i.getMasp().equals(masp)) {
					session.setAttribute("thongbaoErU", "Mã sản phẩm '" + masp + "' đã tồn tại!");
					check = 1;
					break;
				} else {
					session.setAttribute("thongbaoErU", null);
				}
			}
			if (check == 0) {
				Sanpham sp = new Sanpham();
				sp.setId(iduser);
				sp.setMasp(masp);
				sp.setTensp(tensp);
				sp.setMotangan(mota);
				sp.setGiaban(Double.parseDouble(giaban));
				sp.setHinhanh(hinhanh);
				for (Danhmuc i : DanhMucDao.getDanhMuc()) {
					if (danhmuc == i.getIddm()) {
						sp.setDanhmuc(i);
					}
				}

				sp.setSoluong(Integer.parseInt(soluong));
				sp.setDaban(Integer.parseInt(daban));
				sp.setGhichu(ghichu);

//			dm.setIddm(iddm);
//			dm.setTendm(tendm);
//			dm.setMota(mota);

//			System.out.print(dm.getFullname());
				// Tạo 1 Hibernate Session từ HibernateUtil
				Session hbsession = HibernateUtil.getSessionFactory().openSession();
				hbsession.beginTransaction();

				// Lưu danh mục đã tạo ở trên
				hbsession.save(sp);

				hbsession.getTransaction().commit();
			}
			break;
		}
		case "upform": {
			int iduser = Integer.parseInt(request.getParameter("eid"));
			String masp = request.getParameter("emasp");
			String tensp = request.getParameter("etensp");
			String mota = request.getParameter("emota");
			String giaban = request.getParameter("egiaban");
			String hinhanh = request.getParameter("ehinhanh");
			int danhmuc = Integer.parseInt(request.getParameter("edanhmuc"));
			String soluong = request.getParameter("esoluong");
			String daban = request.getParameter("edaban");
			String ghichu = request.getParameter("eghichu");
//
//			Danhmuc dm = new Danhmuc();
//			dm.setIddm(iddm);
//			dm.setTendm(tendm);
//			dm.setMota(mota);

			Sanpham sp = new Sanpham();

			sp = SanPhamDao.findByIdsp(iduser);

//			sp.setId(iduser);
//			sp.setMasp(masp);
			sp.setTensp(tensp);
			sp.setMotangan(mota);
			sp.setGiaban(Double.parseDouble(giaban));
			sp.setHinhanh(hinhanh);
			for (Danhmuc i : DanhMucDao.getDanhMuc()) {
				if (danhmuc == i.getIddm()) {
					sp.setDanhmuc(i);
				}
			}

			sp.setSoluong(Integer.parseInt(soluong));
			sp.setDaban(Integer.parseInt(daban));
			sp.setGhichu(ghichu);
			SanPhamDao.update(sp);

			break;
		}
//		case "delete": {
//
//			// Tạo 1 Hibernate Session từ HibernateUtil
//			Session hbsession = HibernateUtil.getSessionFactory().openSession();
//			hbsession.beginTransaction();
//
//			int iddm = Integer.parseInt(request.getParameter("iddm"));
//			dmDao = new UserDao();
//			dmDao.delete(iddm);
//
//			break;
//		}
//		case "up": {
//
//			break;
//		}
		}
//
//		danhSach = dmDao.getUser();
//		session.setAttribute("listUser", danhSach);
		doGet(request, response);
	}

}
