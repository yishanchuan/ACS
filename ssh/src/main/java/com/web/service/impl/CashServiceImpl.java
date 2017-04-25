package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.CashDao;
import com.web.entity.Cash;
import com.web.service.CashService;

@Transactional
@Service("cashService")
public class CashServiceImpl implements CashService{

	@Resource
	private CashDao cashDao;
	
	@Override
	public void add(Cash cash) {
		// TODO Auto-generated method stub
		cashDao.add(cash);
	}

	@Override
	public List<Cash> getAll() {
		// TODO Auto-generated method stub
		return cashDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return cashDao.delete(id);
	}

	@Override
	public Cash get(int id) {
		// TODO Auto-generated method stub
		return cashDao.get(id);
	}

	@Override
	public boolean update(Cash cash) {
		// TODO Auto-generated method stub
		return cashDao.update(cash);
	}

	@Override
	public void update2(Cash cash) {
		// TODO Auto-generated method stub
		cashDao.update2(cash);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return cashDao.getCount();
	}

}
