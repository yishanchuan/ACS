package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.LogDao;
import com.web.entity.Log;
import com.web.service.LogService;

@Transactional
@Service("LogService")
public class LogServiceImpl implements LogService {

	@Resource
	private LogDao logDao;
	
	@Override
	public void add(Log log) {
		logDao.add(log);
	}

	@Override
	public List<Log> getAll() {
		// TODO Auto-generated method stub
		return logDao.getAll();
	}

	@Override
	public boolean delete(int logid) {
		// TODO Auto-generated method stub
		return logDao.delete(logid);
	}

	@Override
	public Log get(int logid) {
		// TODO Auto-generated method stub
		return logDao.get(logid);
	}

	@Override
	public boolean update(Log log) {
		// TODO Auto-generated method stub
		return logDao.update(log);
	}

}
