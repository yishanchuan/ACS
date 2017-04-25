package com.web.service;

import java.util.List;

import com.web.entity.AccountingSubject;
import com.web.entity.VoucherCore;

public interface VoucherCoreService {
	public void add(VoucherCore voucherCore);
	public boolean delete(int id);
	public boolean update(VoucherCore voucherCore);
	public void update2(VoucherCore voucherCore);
	public VoucherCore get(int id);
	public List<VoucherCore> getAll();
	public List<VoucherCore> getMul(AccountingSubject accountingSubject);
}
