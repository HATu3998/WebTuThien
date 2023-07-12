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

import com.DAO.GetId;
import com.hibernate.utils.HibernateUtil;
import com.luv2code.springsecurity.entity.Authority;

/**
 * Servlet implementation class UpdateAuthority
 */
@WebServlet("/UpdateAuthority")
public class UpdateAuthority extends HttpServlet {
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
    public UpdateAuthority() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user= request.getParameter("user");
        String author = request.getParameter("authority");
      
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        if (user != null && !user.isEmpty()) {
           
           Authority in = GetId.getEntityByAuthor(user);

            if (in != null) {
            in.setAuthority(author);

                  
                        session.update(in);
                        tx.commit();
                        request.setAttribute("info", in);
                        request.getRequestDispatcher("/UserServlet").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + user + " not found");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing id");
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
