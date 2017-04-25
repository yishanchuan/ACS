package com.web.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Past;

@Entity
public class Journal {
//现金日记账-单据
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;//编号
	
	@Past
	@Temporal(TemporalType.DATE)
	private Date date;//日期
	
	@Column(length=12)
	private String description;//摘要
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="ietype_id")
	private IEType ietype;//收支类别
	
	@Column(scale=2)
	private double income;//借方金额
	
	@Column(scale=2)
	private double expenditure;//贷方金额
	
	@Column(length=12)
	private String optype;//往来单位
	
	@Column(length=12)
	private String paymentMethod;//结算方式
	
	@Column(length=12)
	private int receiptNumber;//票据号
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="cash_id")
	private Cash cash;
	
	@Column(columnDefinition="boolean default false")
	private boolean solved;//是否结账
	
	@Column(columnDefinition="integer default 1")
	private int period;//会计期间
	
	public boolean isSolved() {
		return solved;
	}
	public void setSolved(boolean solved) {
		this.solved = solved;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public Cash getCash() {
		return cash;
	}
	public void setCash(Cash cash) {
		this.cash = cash;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public IEType getIetype() {
		return ietype;
	}
	public void setIetype(IEType ietype) {
		this.ietype = ietype;
	}
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public double getExpenditure() {
		return expenditure;
	}
	public void setExpenditure(double expenditure) {
		this.expenditure = expenditure;
	}
	public String getOptype() {
		return optype;
	}
	public void setOptype(String optype) {
		this.optype = optype;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getReceiptNumber() {
		return receiptNumber;
	}
	public void setReceiptNumber(int receiptNumber) {
		this.receiptNumber = receiptNumber;
	}
	
}
