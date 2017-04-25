package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.VoucherDao;
import com.web.entity.Voucher;
import com.web.service.VoucherService;
@Transactional
@Service(value="VoucherService")
public class VoucherServiceImpl implements VoucherService {

	@Resource
	private VoucherDao voucherDao;
	
	@Override
	public void add(Voucher voucher) {
		// TODO Auto-generated method stub
		voucherDao.add(voucher);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return voucherDao.delete(id);
	}

	@Override
	public boolean update(Voucher voucher) {
		// TODO Auto-generated method stub
		return voucherDao.update(voucher);
	}

	@Override
	public Voucher get(int id) {
		// TODO Auto-generated method stub
		return voucherDao.get(id);
	}

	@Override
	public List<Voucher> getAll() {
		// TODO Auto-generated method stub
		return voucherDao.getAll();
	}

	@Override
	public int getVchnum() {
		// TODO Auto-generated method stub
		return voucherDao.getVchnum();
	}

	@Override
	public void update2(Voucher voucher) {
		// TODO Auto-generated method stub
		voucherDao.update2(voucher);
	}

}
