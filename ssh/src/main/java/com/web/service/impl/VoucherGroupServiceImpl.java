package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.VoucherGroupDao;
import com.web.entity.VoucherGroup;
import com.web.service.VoucherGroupService;
@Transactional
@Service(value="VoucherGroupService")
public class VoucherGroupServiceImpl implements VoucherGroupService{

	@Resource
	private VoucherGroupDao voucherGroupDao;
	@Override
	public void add(VoucherGroup vg) {
		// TODO Auto-generated method stub
		voucherGroupDao.add(vg);
	}

	@Override
	public List<VoucherGroup> getAll() {
		// TODO Auto-generated method stub
		return voucherGroupDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return voucherGroupDao.delete(id);
	}

	@Override
	public VoucherGroup get(int id) {
		// TODO Auto-generated method stub
		return voucherGroupDao.get(id);
	}

	@Override
	public boolean update(VoucherGroup vg) {
		// TODO Auto-generated method stub
		return voucherGroupDao.update(vg);
	}
	
}
