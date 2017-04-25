package com.web.service;

import java.util.List;

import com.web.entity.Bank;

public interface BankService {
	
	public void add(Bank bank);  
    
    public List<Bank> getAll();  
    
    public boolean delete(int id);  
      
    public Bank get(int id);  
      
    public boolean update(Bank bank);
	
    public void update2(Bank bank);
    
    public int getCount();
}
