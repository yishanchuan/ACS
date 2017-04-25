package com.web.service;

import java.util.Date;
import java.util.List;

import com.web.entity.Bank;
import com.web.entity.BankJournal;

public interface BankJournalService {

	public void add(BankJournal bankJournal);
	public boolean delete(int id);
	public boolean update(BankJournal bankJournal);
	public void update2(BankJournal bankJournal);
	public BankJournal get(int id);
	public List<BankJournal> getAll();
	public int getCount();
	public List<BankJournal> search(Bank bank,Date date1,Date date2);
	public List<BankJournal> searchNoBank(Date date1,Date date2);
	public int getCountByDate(Date date);
	public List<BankJournal> getAllByBank(Bank bank);
}
