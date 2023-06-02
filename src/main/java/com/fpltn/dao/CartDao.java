package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.fpltn.entities.*;
import com.fpltn.util.HibernateUtil;

public class CartDao {

	// Tạo hàm thêm
	public static void saveCart(Cartlist Sanpham) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the Sanpham object
			session.save(Sanpham);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// Tạo hàm lấy dữ liệu
	public static List<Cartlist> getCartlist() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select Cartlist from Cartlist as Cartlist", Cartlist.class).list();
		}
	}
//			public static List<Cart> getCartByUser() {
//				try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
//					return session.createQuery("select Cart from Cart as Cart", Cart.class).list();
//				}
//			}

	public static List<Cartlist> getCartByUser(int id) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			Query query = (Query)session.createQuery(
					"select Sanpham from cartlist  Sanpham "
			+ "where Sanpham.usid = :iddanhmuc ", Cartlist.class);
			query.setParameter("iddanhmuc", id);
			return query.list();
		}
	}

	// Lấy Sanpham theo id
//	public static Cartlist findByIdsp(int id) {
//		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
//			Cartlist dm = session.load(Cartlist.class, id);
//			System.out.print(dm);
//			return dm;
//		}
//	}
	// Lấy Sanpham theo iddm
//			public static List<Cart> findSPByIddm(Danhmuc id) {	
//				try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {		
//					Query query = session.createQuery(
//							  "select Cart from Cart as Cart "
//					  		+ "where Cart.iddanhmuc = :iddanhmuc ", Cart.class);
//					  query.setParameter("iddanhmuc",  id.getIddm() );
//					  return query.list();
//				} 
//			}

	// xóa Sanpham theo ID
//			public static void delete(int id) {
//				Transaction transaction = null;
//				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//					// start a transaction
//					transaction = session.beginTransaction();
//					
//					Sanpham dm = session.load(Sanpham.class, id);
//					session.delete(dm);
//					
//					
//					// commit transaction
//					transaction.commit();
//				} catch (Exception e) {
//					if (transaction != null) {
//						transaction.rollback();
//					}
//					e.printStackTrace();
//				}
//			}

	// Cập nhật Sanpham
//			public static void update(Sanpham dm) {
//				
//				Transaction transaction = null;
//				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//					// start a transaction
//					transaction = session.beginTransaction();
//					
//					
//					session.update(dm);			
//					
//					// commit transaction
//					transaction.commit();
//				} catch (Exception e) {
//					if (transaction != null) {
//						transaction.rollback();
//					}
//					e.printStackTrace();
//				}
//				
//			  
//			  }

	// Tìm kiếm và Phân trang dữ liệu
//				public static List<Sanpham> timKiem(String tuKhoa) {
//					try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
//					  Query query = session.createQuery(
//							  "select sanpham from Sanpham as sanpham "
//					  		+ "where sanpham.tensp LIKE :tensp ", Sanpham.class);
//					  query.setParameter("tensp", "%" + tuKhoa + "%");
//					  return query.list();
//					}
//				}
}
