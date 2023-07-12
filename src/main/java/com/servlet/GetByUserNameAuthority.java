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
import com.luv2code.springsecurity.entity.*;

/**
 * Servlet implementation class GetByUserNameAuthority
 */
@WebServlet("/GetByUserNameAuthority")
public class GetByUserNameAuthority extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetByUserNameAuthority() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tuThienId = request.getParameter("name");
        if (tuThienId != null && !tuThienId.isEmpty()) {
            try {
               
             Authority tuThien = GetId.getEntityByAuthor(tuThienId);
                if (tuThien != null) {
                    request.setAttribute("authorList", tuThien);
                    request.getRequestDispatcher("/updateAuthor").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + tuThienId + " not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid id");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing id");
        }
	}
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
