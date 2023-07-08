package com.servlet;

import java.io.IOException;
import java.time.LocalDate;

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
import com.luv2code.springsecurity.entity.TuThien;

/**
 * Servlet implementation class StatusTuThienServlet
 */
@WebServlet("/StatusTuThienServlet")
public class StatusTuThienServlet extends HttpServlet {
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
    public StatusTuThienServlet() {
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
    Long Tuid = Long.parseLong(id);
    int sta=Integer.valueOf(status);
    TuThien tuThien = GetId.getEntityById(Tuid);
    if (tuThien != null) {
     tuThien.setTrangThai(sta);
          
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
