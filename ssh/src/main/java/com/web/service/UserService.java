package com.web.service;

import java.util.List;

import com.web.entity.User;

public interface UserService {
	
	public void add(User user);  
    
    public List<User> getAll();  
      
    public boolean delete(int id);  
      
    public User get(int i);  
      
    public boolean update(User user);
    
    public User getByName(String userName);
}
