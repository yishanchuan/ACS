package com.web.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.BankJournalDao;
import com.web.entity.Bank;
import com.web.entity.BankJournal;
import com.web.service.BankJournalService;

@Transactional
@Service("bankJournalService")
public class BankJournalServiceImpl implements BankJournalService {

	@Resource
	private BankJournalDao bankJournalDao;

	@Override
	public void add(BankJournal bankJournal) {
		// TODO Auto-generated method stub
		bankJournalDao.add(bankJournal);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return bankJournalDao.delete(id);
	}

	@Override
	public boolean update(BankJournal bankJournal) {
		// TODO Auto-generated method stub
		return bankJournalDao.update(bankJournal);
	}

	@Override
	public void update2(BankJournal bankJournal) {
		// TODO Auto-generated method stub
		bankJournalDao.update2(bankJournal);
	}

	@Override
	public BankJournal get(int id) {
		// TODO Auto-generated method stub
		return bankJournalDao.get(id);
	}

	@Override
	public List<BankJournal> getAll() {
		// TODO Auto-generated method stub
		return bankJournalDao.getAll();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return bankJournalDao.getCount();
	}

	@Override
	public List<BankJournal> search(Bank bank, Date date1, Date date2) {
		// TODO Auto-generated method stub
		return bankJournalDao.search(bank, date1, date2);
	}

	@Override
	public int getCountByDate(Date date) {
		// TODO Auto-generated method stub
		return bankJournalDao.getCountByDate(date);
	}

	@Override
	public List<BankJournal> getAllByBank(Bank bank) {
		// TODO Auto-generated method stub
		return bankJournalDao.getAllByBank(bank);
	}

	@Override
	public List<BankJournal> searchNoBank(Date date1, Date date2) {
		// TODO Auto-generated method stub
		return bankJournalDao.searchNoBank(date1, date2);
	}
	
	
}
