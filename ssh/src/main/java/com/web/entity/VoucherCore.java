package com.web.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class VoucherCore {
	/*凭证填写表单的中间表格的一行，在voucher中用List<>*/
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(length=10)
	private String summary;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="accountingsubject_id")
	private AccountingSubject accountingSubject;/*一行只有一个会计科目*/
	
	@Column(precision=11,scale=2)
	private double debits;
	
	@Column(precision=11,scale=2)
	private double credits;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public AccountingSubject getAccountingSubject() {
		return accountingSubject;
	}

	public void setAccountingSubject(AccountingSubject accountingSubject) {
		this.accountingSubject = accountingSubject;
	}

	public double getDebits() {
		return debits;
	}

	public void setDebits(double debits) {
		this.debits = debits;
	}

	public double getCredits() {
		return credits;
	}

	public void setCredits(double credits) {
		this.credits = credits;
	}
}
