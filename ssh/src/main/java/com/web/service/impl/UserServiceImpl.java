package com.web.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.transaction.Transactional;

import com.web.dao.UserDao;
import com.web.entity.User;
import com.web.service.UserService;
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;
	
	@Override
	public void add(User user) {
		userDao.add(user);
	}

	@Override
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		return userDao.delete(id);
	}

	@Override
	public User get(int id) {
		return userDao.get(id);
	}

	@Override
	public boolean update(User user) {
		return userDao.update(user);
	}

	@Override
	public User getByName(String userName) {
		return userDao.getByName(userName);
	}

}
