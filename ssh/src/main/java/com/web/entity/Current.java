package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.NumberFormat;

@Entity
public class Current {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@NumberFormat(pattern="000")
	public int id;
	
	@Column(length=4)
	public String code;//编码，例如RMB
	
	@Column(length=12)
	public String name;//名称，例如人民币

	@Column(scale=5)
	@NumberFormat(pattern="######0.00000")
	public float rate;//汇率，例如1.00000
	
	@Column(columnDefinition="boolean default false")
	public boolean standard;
	
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public boolean isStandard() {
		return standard;
	}

	public void setStandard(boolean standard) {
		this.standard = standard;
	}
}
