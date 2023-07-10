package com.luv2code.springsecurity.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
    @Id
    @Column(name = "username", length = 50, nullable = false)
    private String username;

    @Column(name = "password", length = 50, nullable = false)
    private String password;

    @Column(name = "enabled", nullable = false)
    private Integer enabled;

	public String getUsername() {
		return username;
	}

	public User(String username, String password, Integer enabled) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer isEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public User() {
		super();
	}

    // Getters and setters
    // ...
    
}