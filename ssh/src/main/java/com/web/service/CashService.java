package com.web.service;

import java.util.List;

import com.web.entity.Cash;

public interface CashService {

	public void add(Cash cash);  
    
    public List<Cash> getAll();  
    
    public boolean delete(int id);  
      
    public Cash get(int id);  
      
    public boolean update(Cash cash);
	
    public void update2(Cash cash);
    
    public int getCount();
}
