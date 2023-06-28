package com.luv2code.springsecurity.entity;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "tuThien")
public class TuThien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ten")
    private String ten;

    @Column(name = "ngayBatDau")
    private Date ngayBatDau;

    @Column(name = "ngayKetThuc")
    private Date ngayKetThuc;

    @Column(name = "toChuc")
    private String toChuc;

    @Column(name = "sdt")
    private int sdt;

    @Column(name = "tongTien")
    private int tongTien;

    @Column(name = "trangThai")
    private int trangThai;

	public TuThien() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public String getToChuc() {
		return toChuc;
	}

	public void setToChuc(String toChuc) {
		this.toChuc = toChuc;
	}

	public int getSdt() {
		return sdt;
	}

	public void setSdt(int sdt) {
		this.sdt = sdt;
	}

	public int getTongTien() {
		return tongTien;
	}

	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

    // Constructors, getters, and setters
}
