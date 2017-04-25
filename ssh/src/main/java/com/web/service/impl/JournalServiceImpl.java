package com.web.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.JournalDao;
import com.web.entity.Cash;
import com.web.entity.Journal;
import com.web.service.JournalService;

@Transactional
@Service("journalService")
public class JournalServiceImpl implements JournalService {

	@Resource
	private JournalDao journalDao;
	
	@Override
	public void add(Journal journal) {
		// TODO Auto-generated method stub
		journalDao.add(journal);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return journalDao.delete(id);
	}

	@Override
	public boolean update(Journal journal) {
		// TODO Auto-generated method stub
		return journalDao.update(journal);
	}

	@Override
	public Journal get(int id) {
		// TODO Auto-generated method stub
		return journalDao.get(id);
	}

	@Override
	public List<Journal> getAll() {
		// TODO Auto-generated method stub
		return journalDao.getAll();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return journalDao.getCount();
	}

	@Override
	public void update2(Journal journal) {
		// TODO Auto-generated method stub
		journalDao.update2(journal);
	}

	@Override
	public List<Journal> search(Cash cash, Date date1, Date date2) {
		// TODO Auto-generated method stub
		return journalDao.search(cash, date1, date2);
	}

	@Override
	public int getCountByDate(Date date) {
		// TODO Auto-generated method stub
		return journalDao.getCountByDate(date);
	}

	@Override
	public List<Journal> getAllByCash(Cash cash) {
		// TODO Auto-generated method stub
		return journalDao.getAllByCash(cash);
	}

	@Override
	public List<Journal> searchNoCash(Date date1, Date date2) {
		// TODO Auto-generated method stub
		return journalDao.searchNoCash(date1, date2);
	}

}
