package com.web.service;

import java.util.List;

import com.web.entity.IEType;

public interface IETypeService {

	public void add(IEType income);
	public boolean delete(int id);
	public void update(IEType income);
	public IEType get(int id);
	public List<IEType> getAll();
	public int getCount();
}
