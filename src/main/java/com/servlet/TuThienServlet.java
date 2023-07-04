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
import com.DAO.PaginationUtils;

@WebServlet("/TuThienServlet")
public class TuThienServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SessionFactory sessionFactory;

    @Override
    public void init() throws ServletException {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

 

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        int pageSize = 3;
        
        // Read the page parameter from the request if it exists
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }

        try (Session session = sessionFactory.openSession()) {
            Query<TuThien> query = session.createQuery("FROM TuThien", TuThien.class);
            List<TuThien> tuList = query.list();
            Query<Info> queryInfo = session.createQuery("FROM Info", Info.class);
            List<Info> InfoList = queryInfo.list();

            int totalItems = tuList.size();
            int totalPages = PaginationUtils.calculateTotalPages(totalItems, pageSize);
            
            // Paginate the data based on the page and pageSize
            List<TuThien> paginatedList = PaginationUtils.paginate(tuList, page, pageSize);
            request.setAttribute("InfoList", InfoList);
            request.setAttribute("tuList", paginatedList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.getRequestDispatcher("/file").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("lỗi");
        }
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
		doGet(request, response);
	}

}
