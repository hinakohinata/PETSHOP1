package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fpltn.entities.User;
import com.fpltn.util.HibernateUtil;

public class UserDao {
	// Tạo hàm thêm
			public static void saveUser(User user) {
				Transaction transaction = null;
				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
					// start a transaction
					transaction = session.beginTransaction();
					// save the user object
					session.save(user);
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
			public static List<User> getUser() {
				try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
					return session.createQuery("select user from User as user", User.class).list();
				}
			}

			//Lấy user theo id
			public static User findById(int id) {	
				try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {		
					User dm = session.load(User.class, id);
					System.out.print(dm);
					return dm;
				} 
			}
			
			//xóa user theo ID
			public static void delete(int id) {
				Transaction transaction = null;
				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
					// start a transaction
					transaction = session.beginTransaction();
					
					User dm = session.load(User.class, id);
					session.delete(dm);
					
					
					// commit transaction
					transaction.commit();
				} catch (Exception e) {
					if (transaction != null) {
						transaction.rollback();
					}
					e.printStackTrace();
				}
			}
			
			//Cập nhật user
			public static void update(User dm) {
				
				Transaction transaction = null;
				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
					// start a transaction
					transaction = session.beginTransaction();
					
					
					session.update(dm);			
					
					// commit transaction
					transaction.commit();
				} catch (Exception e) {
					if (transaction != null) {
						transaction.rollback();
					}
					e.printStackTrace();
				}
				
			  
			  }
}
