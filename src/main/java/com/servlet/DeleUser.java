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

import com.DAO.DeleDAO;
import com.DAO.GetId;
import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.*;

/**
 * Servlet implementation class DeleUser
 */
@WebServlet("/DeleUser")
public class DeleUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        sessionFactory = HibernateUtil.getSessionFactory();
    }
    @Override
	 public void destroy() {
	     sessionFactory.close();
	 }       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String id = request.getParameter("id");
		  String status=request.getParameter("status");
		  Session session = sessionFactory.openSession();
	        Transaction tx = session.beginTransaction();
try {
  
    int sta=Integer.valueOf(status);
  
    User tuThien=GetId.getEntityByUser(id);
    if (tuThien != null) {
     tuThien.setEnabled(sta);
          
                session.update(tuThien);
                tx.commit();
                request.setAttribute("tuThien", tuThien);
                request.getRequestDispatcher("/AdminServlet").forward(request, response);
    } else {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + id + " not found");
    }
    }catch(Exception e) 
{
	System.out.print("lỗi");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
