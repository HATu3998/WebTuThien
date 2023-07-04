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
@Table(name = "userQuyenGop")
public class UserQuyenGop {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private Long id;

	    @Column(name = "ngay")
	    private LocalDate ngay;

	    @Column(name = "noiDung", length = 255)
	    private String noiDung;

	    @Column(name = "tien")
	    private Integer tien;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "tuThien_id")
	    private TuThien tuThien;

	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "username")
	    private User username;
	
	    
	    
	    public UserQuyenGop() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getNgay() {
		return ngay;
	}

	public void setNgay(LocalDate ngay) {
		this.ngay = ngay;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public Integer getTien() {
		return tien;
	}

	public void setTien(Integer tien) {
		this.tien = tien;
	}

	public TuThien getTuThien() {
		return tuThien;
	}

	public void setTuThien(TuThien tuThien) {
		this.tuThien = tuThien;
	}

	public User getUsername() {
		return username;
	}

	public void setUsername(User username) {
		this.username = username;
	}




    // Getters and setters
    // ...
    
    
}