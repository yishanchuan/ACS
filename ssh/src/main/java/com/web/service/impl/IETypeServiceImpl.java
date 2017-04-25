package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.IETypeDao;
import com.web.entity.IEType;
import com.web.service.IETypeService;

@Transactional
@Service("iETypeService")
public class IETypeServiceImpl implements IETypeService{

	@Resource
	private IETypeDao iETypeDao;

	@Override
	public void add(IEType iEType) {
		// TODO Auto-generated method stub
		iETypeDao.add(iEType);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return iETypeDao.delete(id);
	}

	@Override
	public void update(IEType iEType) {
		// TODO Auto-generated method stub
		iETypeDao.update(iEType);
	}

	@Override
	public IEType get(int id) {
		// TODO Auto-generated method stub
		return iETypeDao.get(id);
	}

	@Override
	public List<IEType> getAll() {
		// TODO Auto-generated method stub
		return iETypeDao.getAll();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return iETypeDao.getCount();
	}
}
