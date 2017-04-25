package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class IEType {
	//收支类别
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;//编号
	
	@Column(length=12)
	private String name;//名称

	private boolean ie;//1-收入，0-支出
	
	public boolean isIe() {
		return ie;
	}

	public void setIe(boolean ie) {
		this.ie = ie;
	}

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
}
