package com.web.service.impl;

import java.util.List;


import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.CurrentDao;
import com.web.entity.Current;
import com.web.service.CurrentService;

@Transactional
@Service("currentService")
public class CurrentServiceImpl implements CurrentService{

	@Resource
	private CurrentDao currentDao;
	
	@Override
	public void add(Current current) {
		// TODO Auto-generated method stub
		currentDao.add(current);
	}

	@Override
	public List<Current> getAll() {
		// TODO Auto-generated method stub
		return currentDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return currentDao.delete(id);
	}

	@Override
	public Current get(int id) {
		// TODO Auto-generated method stub
		return currentDao.get(id);
	}

	@Override
	public boolean update(Current current) {
		// TODO Auto-generated method stub
		return currentDao.update(current);
	}

	@Override
	public void update2(Current current) {
		// TODO Auto-generated method stub
		currentDao.update2(current);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return currentDao.getCount();
	}

}
