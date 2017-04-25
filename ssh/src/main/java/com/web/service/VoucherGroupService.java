package com.web.service;

import java.util.List;

import com.web.entity.VoucherGroup;

public interface VoucherGroupService {
	
	public void add(VoucherGroup vg);  
    
    public List<VoucherGroup> getAll();  
    
    public boolean delete(int id);  
      
    public VoucherGroup get(int id);  
      
    public boolean update(VoucherGroup vg);
}
