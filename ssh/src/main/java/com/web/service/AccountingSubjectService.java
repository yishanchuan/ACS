package com.web.service;

import java.util.List;

import com.web.entity.AccountingSubject;

public interface AccountingSubjectService {
	
	public void add(AccountingSubject as);  
    
    public List<AccountingSubject> getAll();  
    
    public boolean delete(int id);  
      
    public AccountingSubject get(int id);  
      
    public boolean update(AccountingSubject as);
    
    public double calculate(boolean dc);
}
