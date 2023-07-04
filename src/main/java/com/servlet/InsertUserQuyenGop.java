package com.servlet;

import java.io.IOException;
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
import com.luv2code.springsecurity.entity.Authority;
import com.luv2code.springsecurity.entity.TuThien;
import com.luv2code.springsecurity.entity.UserQuyenGop;

@WebServlet("/InsertUserQuyenGop")
public class InsertUserQuyenGop extends HttpServlet {
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

    public InsertUserQuyenGop() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
        	String autho_username = request.getParameter("autho_username");
            String tuThien_id = request.getParameter("tuThien_id");
            String noiDung = request.getParameter("noiDung");
            String tienValue = request.getParameter("tien");

            // Chuyển đổi tien thành Integer
            Integer tienInteger = Integer.parseInt(tienValue);

            // Tạo đối tượng UserQuyenGop và gán giá trị
            UserQuyenGop userQuyenGop = new UserQuyenGop();
            userQuyenGop.setNgay(LocalDate.now());
            userQuyenGop.setNoiDung(noiDung);
            userQuyenGop.setTien(tienInteger);

            // Lấy đối tượng TuThien từ cơ sở dữ liệu dựa trên tuThien_id
            TuThien tuThien = session.get(TuThien.class, Long.parseLong(tuThien_id));
            userQuyenGop.setTuThien(tuThien);

            Integer newTienValue = Integer.parseInt(tuThien.getTien()) + tienInteger;
            tuThien.setTien(newTienValue.toString());
            session.update(tuThien);
     
            
            // Lấy đối tượng User từ cơ sở dữ liệu dựa trên username
            Query<User> userQuery = session.createQuery("FROM User WHERE username=:username", User.class);
            userQuery.setParameter("username", autho_username);
            User user = userQuery.uniqueResult();
            // Lấy đối tượng Authority từ cơ sở dữ liệu dựa trên username
             userQuyenGop.setUsername(user);

            // Lưu đối tượng UserQuyenGop vào cơ sở dữ liệu
            
            session.save(userQuyenGop);
            tx.commit();
            System.out.println("Thêm dữ liệu thành công!");

            // Lấy danh sách TuThien từ cơ sở dữ liệu
            Query<TuThien> queryT = session.createQuery("FROM TuThien", TuThien.class);
            List<TuThien> tuList = queryT.list();

            // Đặt thuộc tính "tuList" vào request và chuyển hướng về trang chủ
            request.setAttribute("tuList", tuList);
            request.getRequestDispatcher("/").forward(request, response);
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            System.out.print("Lỗi");
        } finally {
            session.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
