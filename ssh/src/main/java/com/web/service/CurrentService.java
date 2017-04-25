package com.web.service;

import java.util.List;

import com.web.entity.Current;

public interface CurrentService {
	
	public void add(Current current);  
    
    public List<Current> getAll();  
    
    public boolean delete(int id);  
      
    public Current get(int id);  
      
    public boolean update(Current current);
	
    public void update2(Current current);

	public int getCount();
}
