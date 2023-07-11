package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.Authority;
import com.luv2code.springsecurity.entity.Info;
import com.luv2code.springsecurity.entity.User;
import com.DAO.*;

@WebServlet("/InsertServlet")
public class UserInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public void destroy() {
        sessionFactory.close();
    }

    static final SessionFactory factory = HibernateUtil.getSessionFactory();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String hoTen = request.getParameter("hoTen");
            String email = request.getParameter("email");
            String sdt = request.getParameter("sdt");

            User userEntity = new User();
            userEntity.setUsername(user);
            userEntity.setPassword(pass);
            userEntity.setEnabled(1);

            session.save(userEntity);
        //    tx.commit();
          
        //    UserDAO.getEntityByUser(hoTen, email, sdt, userEntity);
            Info info = new Info();
            info.setHoTen(hoTen);
            info.setEmail(email);
            info.setSdt(sdt);
            info.setUser(userEntity);

            session.save(info);

            Authority authority = new Authority();
            authority.setUser(userEntity);
            authority.setAuthority("ROLE_EMPLOYEE");

            session.save(authority);

         tx.commit();
            System.out.println("Data inserted successfully!");

            request.getRequestDispatcher("/").forward(request, response);
        } catch (Exception e) {
        	if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            String errorMessage = e.getMessage();
            System.out.println("Lỗi: " + errorMessage);
        } finally {
            session.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
