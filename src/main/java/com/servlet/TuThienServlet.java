package com.servlet;

import java.io.IOException;
import java.util.List;
import com.luv2code.springsecurity.entity.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.hibernate.utils.HibernateUtil;

/**
 * Servlet implementation class TuThienServlet
 */
@WebServlet("/TuThienServlet")
public class TuThienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory;
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
    public void init() throws ServletException {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    public TuThienServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try (Session session = sessionFactory.openSession()) {
	 	        Query<TuThien> query = session.createQuery("FROM TuThien", TuThien.class);
	 	        List<TuThien> tuList = query.list();

	 	        request.setAttribute("tuList", tuList);
	 	        request.getRequestDispatcher("/").forward(request, response);
	 	    } catch (Exception e) {
	 	        e.printStackTrace();
	 	        System.out.print("lỗi");
	 	    }	}
	 @Override
	 public void destroy() {
	     sessionFactory.close();
	 }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
