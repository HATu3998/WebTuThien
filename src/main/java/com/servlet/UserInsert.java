package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.*;

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
		static final SessionFactory factory=HibernateUtil.getSessionFactory();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 Session session = factory.openSession();
	        Transaction tx = session.beginTransaction();
	        try {
	      User u=new User();

	        String user = request.getParameter("username");
	        String pass = request.getParameter("password");
	        String hoTen = request.getParameter("hoTen");
	        String email = request.getParameter("email");
	        String sdt = request.getParameter("sdt");
	     u.setUsername(user);
	     u.setPassword(pass);
	     u.setEnabled(1);

	    session.save(u);
	 
	   User username=session.get(User.class,user);
	    Info i=new Info();
	    i.setHoTen(hoTen);
	    i.setEmail(email);
	    i.setSdt(sdt);
	    i.setUser(username);
	    
	    session.save(i);
	    
	    Authority au=new Authority();
	    au.setUser(username);
	    au.setAuthority("ROLE_EMPLOYEE");
	    
	 //   session.save(au);
	        tx.commit();
 	    System.out.println("Data inserted successfully!");

	      
	        request.getRequestDispatcher("/").forward(request, response);
	    	} catch (Exception e) {
	    	    if (tx != null) {
	    	        tx.rollback();
	    	    }
	    	    e.printStackTrace();
	    	    System.out.print("lỗi");
	    	} finally {
	    	    session.close();
	    	}
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
