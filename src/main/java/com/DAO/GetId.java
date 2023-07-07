package com.DAO;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.TuThien;

public class GetId {
	   public static TuThien getEntityById(long id) {
	        Session session = HibernateUtil.getSessionFactory().openSession();
	        try {
	            session.beginTransaction();
	            Query<TuThien> query = session.createQuery("FROM TuThien WHERE id = :id", TuThien.class);
	            query.setParameter("id", id);
	            return query.uniqueResult();
	        } finally {
	            session.getTransaction().commit();
	            session.close();
	        }
	    }
}
