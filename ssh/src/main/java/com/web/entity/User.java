package com.web.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="user",uniqueConstraints={@UniqueConstraint(columnNames={"userName"})})
public class User {
	//用户表
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=32)
	private int id;

	@Column(length=32)
	private String userName;
	
	@Column(length=32)
	private String password;
	
	@Column(length=32)
	private String email;
	
	@Column(length=32)
	private String tel;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="role_id")
	private Role role;//一个用户一个角色
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
}
