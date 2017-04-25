package com.web.service;

import java.util.Date;
import java.util.List;

import com.web.entity.Cash;
import com.web.entity.Journal;

public interface JournalService {

	public void add(Journal journal);
	public boolean delete(int id);
	public boolean update(Journal journal);
	public void update2(Journal journal);
	public Journal get(int id);
	public List<Journal> getAll();
	public int getCount();
	public List<Journal> search(Cash cash,Date date1,Date date2);
	public List<Journal> searchNoCash(Date date1,Date date2);
	public int getCountByDate(Date date);
	public List<Journal> getAllByCash(Cash cash);
}
