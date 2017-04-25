package com.web.service;

import java.util.List;

import com.web.entity.Voucher;

public interface VoucherService {
	public void add(Voucher voucher);
	public boolean delete(int id);
	public void update2(Voucher voucher);
	public boolean update(Voucher voucher);
	public Voucher get(int id);
	public List<Voucher> getAll();
	public int getVchnum();
}
