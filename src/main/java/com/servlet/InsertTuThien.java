package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.luv2code.springsecurity.entity.*;
import com.hibernate.utils.HibernateUtil;

/**
 * Servlet implementation class InsertTuThien
 */
@WebServlet("/InsertTuThien")
public class InsertTuThien extends HttpServlet {
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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTuThien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 Session session = factory.openSession();
	        Transaction tx = session.beginTransaction();
	        try {
	        TuThien tuThien = new TuThien();

	        String ten = request.getParameter("ten");
	        String ngay = request.getParameter("ngayKetThuc");
	        int ngayKetThuc = Integer.valueOf(ngay);
	        String toChuc = request.getParameter("toChuc");
	        String sdt = request.getParameter("sdt");
	      
	        String tongTien = request.getParameter("tongTien");
	      
	     
	        tuThien.setTen(ten);
	        tuThien.setNgayBatDau(LocalDate.now());
	        tuThien.setNgayKetThuc(LocalDate.now().plusDays(ngayKetThuc));
	        tuThien.setToChuc(toChuc);
	        tuThien.setSdt(sdt);
	        tuThien.setTongTien(tongTien);
	        tuThien.setTrangThai(1);

	        
	        
	        session.save(tuThien);
	        tx.commit();
    	    System.out.println("Data inserted successfully!");

	        Query<TuThien> query = session.createQuery("FROM TuThien", TuThien.class);
 	        List<TuThien> tuList = query.list();

 	        request.setAttribute("tuList", tuList);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
