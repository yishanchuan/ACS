package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.VoucherCoreDao;
import com.web.entity.AccountingSubject;
import com.web.entity.VoucherCore;
import com.web.service.VoucherCoreService;

@Transactional
@Service("voucherCoreService")
public class VoucherCoreServiceImpl implements VoucherCoreService{

	@Resource
	private VoucherCoreDao voucherCoreDao;
	
	@Override
	public void add(VoucherCore voucherCore) {
		// TODO Auto-generated method stub
		voucherCoreDao.add(voucherCore);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return voucherCoreDao.delete(id);
	}

	@Override
	public boolean update(VoucherCore voucherCore) {
		// TODO Auto-generated method stub
		return voucherCoreDao.update(voucherCore);
	}

	@Override
	public VoucherCore get(int id) {
		// TODO Auto-generated method stub
		return voucherCoreDao.get(id);
	}

	@Override
	public List<VoucherCore> getAll() {
		// TODO Auto-generated method stub
		return voucherCoreDao.getAll();
	}

	@Override
	public void update2(VoucherCore voucherCore) {
		// TODO Auto-generated method stub
		voucherCoreDao.update2(voucherCore);
	}

	@Override
	public List<VoucherCore> getMul(AccountingSubject accountingSubject) {
		// TODO Auto-generated method stub
		return voucherCoreDao.getMul(accountingSubject);
	}

}
