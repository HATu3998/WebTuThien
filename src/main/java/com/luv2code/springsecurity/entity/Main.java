package com.luv2code.springsecurity.entity;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.hibernate.utils.HibernateUtil;

public class Main {

    static final SessionFactory factory = HibernateUtil.getSessionFactory();

    public static void main(String[] args) {
    	Session session = factory.openSession();
    	Transaction tx = null;

    	try {
    	    tx = session.beginTransaction();

    	    // Lấy danh sách thông tin từ bảng info
    	    Query<Info> query = session.createQuery("FROM Info", Info.class);
    	    List<Info> infoList = query.list();

    	    // Tạo đối tượng TuThien và chèn dữ liệu vào bảng tuThien
    	    for (Info info : infoList) {
    	        TuThien tuThien = new TuThien();
    	        tuThien.setTen("bao ve dong vat");
    	        tuThien.setNgayBatDau(LocalDate.now());
    	        tuThien.setNgayKetThuc(LocalDate.now().plusDays(7));
    	        tuThien.setToChuc("Tổ chức ABC");
    	        tuThien.setSdt(123456789);
    	        tuThien.setTongTien(1000000);
    	        tuThien.setTrangThai(1);

    	        session.save(tuThien);
    	    }

    	    tx.commit();
    	    System.out.println("Data inserted successfully!");
    	} catch (Exception e) {
    	    if (tx != null) {
    	        tx.rollback();
    	    }
    	    e.printStackTrace();
    	} finally {
    	    session.close();
    	}

    }
}
