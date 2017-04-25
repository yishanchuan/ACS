package com.web.service;

import java.util.List;

import com.web.entity.Log;

public interface LogService {
	
	public void add(Log log);  
    
    public List<Log> getAll();  
    
    public boolean delete(int logid);  
      
    public Log get(int logid);  
      
    public boolean update(Log log);
}
