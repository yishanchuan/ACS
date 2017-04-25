package com.web.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class AccountSet {
	//账套
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=32)
	private int id;//编号
	
	@Column(length=12)
	private String name;//名称
	
	@Temporal(value = TemporalType.TIMESTAMP)
	private Date date;//创建日期
	
	@Column(length=20)
	private String place;//公司地点
	
	@Column(columnDefinition="boolean default false")
	private boolean vat;//增值税value added tax(false:一般纳税人,true:小规模纳税人（销售额符合标准和会计核算健全）)
	
	@Column(columnDefinition="boolean default false")
	private boolean as;//会计准则accounting standard(false:小企业会计准则,true:企业会计准则)
	
	@Column(columnDefinition="Integer default 1")
	private int period;//会计期间
	
	@Column(columnDefinition="boolean default false")
	private boolean isdefault;
	
	public boolean isIsdefault() {
		return isdefault;
	}
	public void setIsdefault(boolean isdefault) {
		this.isdefault = isdefault;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean isVat() {
		return vat;
	}
	public void setVat(boolean vat) {
		this.vat = vat;
	}
	public boolean isAs() {
		return as;
	}
	public void setAs(boolean as) {
		this.as = as;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
