package com.web.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cash {
//出纳-账户设置-现金管理
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int id;//编码
	
	@Column(length=12)
	public String name;//账户名称
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="current_id")
	public Current current;//币别
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="accountingsubject_id")
	public AccountingSubject accountingSubject;//会计科目
	
	@Column(scale=2,columnDefinition="double default 0.00")
	public double balance;
	
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
	public Current getCurrent() {
		return current;
	}
	public void setCurrent(Current current) {
		this.current = current;
	}
	public AccountingSubject getAccountingSubject() {
		return accountingSubject;
	}
	public void setAccountingSubject(AccountingSubject accountingSubject) {
		this.accountingSubject = accountingSubject;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
}
