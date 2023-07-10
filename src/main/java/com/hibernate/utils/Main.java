package com.hibernate.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.luv2code.springsecurity.entity.User;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.getCurrentSession();
	        Transaction transaction = null;
	        try {
	            transaction = session.beginTransaction();
	            User user = new User();
	            user.setUsername("ad");
	            user.setPassword("123");
	            user.setEnabled(1);
	            session.save(user);
	            transaction.commit();
	        } catch (Exception ex) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            System.out.print("lỗi");
	            ex.printStackTrace();
	        } finally {
	            session.close();
	        }
	}

}
