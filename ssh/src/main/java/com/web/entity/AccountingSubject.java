package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AccountingSubject {
	//会计科目
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition="int comment '会计科目id'")
	private int id;//会计科目编码
	
	@Column(length=32,columnDefinition="int default 0 comment '父id'")
	private int pid;
	
	@Column(columnDefinition="varchar(2) comment '类别（资产、负债、权益、成本、损益）'")
	private String type;//类别（资产、负债、权益、成本、损益）
	
	@Column(columnDefinition="varchar(10) comment '会计科目名'")
	private String name;//会计科目名
	
	@Column(length=2,columnDefinition="boolean default true comment '借贷方向:false借方,true贷方'")
	private boolean dc;//false借方,true贷方

	@Column(columnDefinition="boolean default true comment '状态:true可修改,false不可修改'")
	private boolean status;//状态,true可修改,false不可修改
	
	@Column(columnDefinition="double(16) default 0.00 comment '期初余额'")
	private double balance;//期初-设置余额
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isDc() {
		return dc;
	}

	public void setDc(boolean dc) {
		this.dc = dc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "AccountingSubject [id=" + id + ", pid=" + pid + ", type=" + type + ", name=" + name + ", dc=" + dc
				+ ", status=" + status + ", balance=" + balance + "]";
	}
}
