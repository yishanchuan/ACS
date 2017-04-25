package com.web.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.NumberFormat;

@Entity
public class Bank{
//出纳-账户管理-银行存款管理
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@NumberFormat(pattern="000")
	private int id;//编码
	
	@Column(length=12)
	private String name;//账户名称
	
	@Column(length=19,nullable=true)
	private String bankAccount;//银行账户
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="current_id")
	private Current current;//币别
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="accountingsubject_id",nullable=true)
	private AccountingSubject accountingSubject;//会计科目
	
	@Column(columnDefinition="double default 0.00")
	private double balance;
	
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
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
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
