package com.luv2code.springsecurity.entity;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "userQuyenGop")
public class UserQuyenGop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ngay")
    private Date ngay;

    @Column(name = "noiDung")
    private String noiDung;

    @Column(name = "tien")
    private int tien;

    @ManyToOne
    @JoinColumn(name = "tuThien_id")
    private TuThien tuThien;

    @ManyToOne
    @JoinColumn(name = "User_id")
    private Admin admin;

	public UserQuyenGop() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getNgay() {
		return ngay;
	}

	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public int getTien() {
		return tien;
	}

	public void setTien(int tien) {
		this.tien = tien;
	}

	public TuThien getTuThien() {
		return tuThien;
	}

	public void setTuThien(TuThien tuThien) {
		this.tuThien = tuThien;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

    // Constructors, getters, and setters
}
