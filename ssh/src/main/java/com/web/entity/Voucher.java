package com.web.entity;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.NumberFormat;

@Entity
public class Voucher {
	//凭证表
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=32)
	private int id;//凭证编号
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="vouchergroup_id")
	private VoucherGroup vouchergroup;//凭证字
	
	@Column(length=16)
	private int vchnum;//字号
	
	@Column(length=10)
	@Past
	private Date date;//日期
	
	@Column(columnDefinition="boolean default false")
	private boolean voucherstatus;//凭证状态
	
	@Column(columnDefinition="boolean default false")
	private boolean poststatus;//过账状态
	
	@Column(precision=11,scale=2)
	@NumberFormat(pattern="########0.00")
	private double total;//总计金额
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;//制单人
	
	@Column(columnDefinition="boolean default false")
	private boolean checked;//是否被审核
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="voucher_id")
	private List<VoucherCore> listvc;
	/*mysql数据表，该字段不在voucher表中，在voucherCore表中,一定要eager*/

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
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isVoucherstatus() {
		return voucherstatus;
	}

	public void setVoucherstatus(boolean voucherstatus) {
		this.voucherstatus = voucherstatus;
	}

	public boolean isPoststatus() {
		return poststatus;
	}

	public void setPoststatus(boolean poststatus) {
		this.poststatus = poststatus;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setVchnum(int vchnum) {
		this.vchnum = vchnum;
	}

	public int getVchnum() {
		return vchnum;
	}

	public void setFontsize(int vchnum) {
		this.vchnum = vchnum;
	}

	public VoucherGroup getVouchergroup() {
		return vouchergroup;
	}

	public void setVouchergroup(VoucherGroup vouchergroup) {
		this.vouchergroup = vouchergroup;
	}

	public List<VoucherCore> getListvc() {
		return listvc;
	}

	public void setListvc(List<VoucherCore> listvc) {
		this.listvc = listvc;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

}
