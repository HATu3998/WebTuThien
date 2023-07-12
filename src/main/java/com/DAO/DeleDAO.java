package com.DAO;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.query.Query;
import com.luv2code.springsecurity.entity.*;
import com.luv2code.springsecurity.entity.UserQuyenGop;
import com.hibernate.utils.HibernateUtil;

public class DeleDAO {
	

	
	public static void deleteEntityById(long id) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;
	    
	    try {
	        transaction = session.beginTransaction();
	       TuThien tu = session.get(TuThien.class, id);
	
	        if (tu != null) {
	        	  Query<UserQuyenGop> query =session.createQuery("FROM UserQuyenGop WHERE tuThien.id = :tuThienId", UserQuyenGop.class);
	        	  query.setParameter("tuThienId", id);
	                List<UserQuyenGop> userQuyenGopList = query.list();
	                
	                for (UserQuyenGop userQuyenGop : userQuyenGopList) {
	                    session.delete(userQuyenGop);
	                }
	        	
	        	
	            session.delete(tu);
	            transaction.commit();
	            System.out.println("Entity with id " + id + " deleted successfully.");
	        } else {
	            System.out.println("Entity with id " + id + " not found.");
	        }
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	}
	
	

}
