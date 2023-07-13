package com.DAO;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.Info;

public class InfoDAO {
    public List<Info> search(String keyword) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        try {
            Query<Info> query = session.createQuery("FROM Info WHERE hoTen LIKE :keyword OR email LIKE :keyword OR sdt LIKE :keyword", Info.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            session.close();
        }
    }
}
