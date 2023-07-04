package com.luv2code.springsecurity.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tuthien")
public class TuThien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "ten", length = 255)
    private String ten;

    @Column(name = "ngayBatDau")
    private LocalDate ngayBatDau;

    @Column(name = "ngayKetThuc")
    private LocalDate ngayKetThuc;

    @Column(name = "toChuc", length = 255)
    private String toChuc;

    @Column(name = "sdt", length = 255)
    private String sdt;
    @Column(name = "tien", length = 255)
    private String tien;
    @Column(name = "tongTien", length = 255)
    private String tongTien;

    @Column(name = "trangThai")
    private Integer trangThai;

	public TuThien() {
		super();
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}






	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public LocalDate getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(LocalDate ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public LocalDate getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(LocalDate ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public String getToChuc() {
		return toChuc;
	}

	public void setToChuc(String toChuc) {
		this.toChuc = toChuc;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getTien() {
		return tien;
	}



	public void setTien(String tien) {
		this.tien = tien;
	}



	public String getTongTien() {
		return tongTien;
	}

	public void setTongTien(String tongTien) {
		this.tongTien = tongTien;
	}

	public Integer getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Integer trangThai) {
		this.trangThai = trangThai;
	}

  

    // Getters and setters
    // ...
    
    
}