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
 * Servlet implementation class UpdateTuThienServlet
 */
@WebServlet("/UpdateTuThienServlet")
public class UpdateTuThienServlet extends HttpServlet {
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
    public UpdateTuThienServlet() {
    	 super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
    	String ten = request.getParameter("ten");
    	String ngayBatDau = request.getParameter("ngayBatDau");
    	String ngayKetThuc = request.getParameter("ngayKetThuc");
    	  int ngayKetThucN = Integer.valueOf(ngayKetThuc);
    	String toChuc = request.getParameter("toChuc");
    	String sdt = request.getParameter("sdt");
    	String tien = request.getParameter("tien");
    	String tongTien = request.getParameter("tongTien");
    	String trangThai = request.getParameter("trangThai");
    	int trang=Integer.valueOf(trangThai);
    	Session session = sessionFactory.openSession();
    	 Transaction tx = session.beginTransaction();
    	  if (id != null && !id.isEmpty()) {
    		  Long Tuid = Long.parseLong(id);
              TuThien tuThien = GetId.getEntityById(Tuid);
              
              if (tuThien != null) {
            	  tuThien.setTen(ten);
            	  tuThien.setNgayKetThuc(LocalDate.now().plusDays(ngayKetThucN));
            	  tuThien.setToChuc(toChuc);
            	  tuThien.setSdt(sdt);
            	  tuThien.setTongTien(tongTien);
            	  if(trangThai.equals("1") && tuThien.getTrangThai()==4) {
            		 
            		  session.update(tuThien);
                	  tx.commit();
            		  request.setAttribute("error", "đã đóng quyên góp không thể thực hiện thay đổi trạng thái");
                      request.getRequestDispatcher("/updateTuThien").forward(request, response);
            	  }else  if(trangThai.equals("2") && tuThien.getTrangThai()==4) {
            		  session.update(tuThien);
                	  tx.commit();
            		  request.setAttribute("error", "đã đóng quyên góp không thể thực hiện thay đổi trạng thái");
                      request.getRequestDispatcher("/updateTuThien").forward(request, response);
            	  }else  if(trangThai.equals("3") && tuThien.getTrangThai()==4) {
            		  session.update(tuThien);
                	  tx.commit();
            		  request.setAttribute("error", "đã đóng quyên góp không thể thực hiện thay đổi trạng thái");
                      request.getRequestDispatcher("/updateTuThien").forward(request, response);
            	  }else {
            		  tuThien.setTrangThai(trang);
            	  session.update(tuThien);
            	  tx.commit();
                  request.setAttribute("tuThien", tuThien);
                  request.getRequestDispatcher("/updateTuThien").forward(request, response);}
              } else {
                  response.sendError(HttpServletResponse.SC_NOT_FOUND, "TuThien with id " + id + " not found");
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
