package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class VoucherGroup {
	//凭证字
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=32)
	private int id;//凭证字id
	
	@Column(length=4)
	private String name;//凭证字名
	
	@Column(length=16)
	private String title;//凭证打印标题
	
	private boolean isdefault;//是否默认
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isIsdefault() {
		return isdefault;
	}
	public void setIsdefault(boolean isdefault) {
		this.isdefault = isdefault;
	}
	
}
