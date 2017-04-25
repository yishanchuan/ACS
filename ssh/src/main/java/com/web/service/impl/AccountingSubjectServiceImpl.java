package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.AccountingSubjectDao;
import com.web.entity.AccountingSubject;
import com.web.service.AccountingSubjectService;
@Transactional
@Service(value="accountingSubjectService")
public class AccountingSubjectServiceImpl implements AccountingSubjectService {

	@Resource
	private AccountingSubjectDao accountingSubjectDao;
	@Override
	public void add(AccountingSubject as) {
		// TODO Auto-generated method stub
		accountingSubjectDao.add(as);
	}

	@Override
	public List<AccountingSubject> getAll() {
		// TODO Auto-generated method stub
		return accountingSubjectDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return accountingSubjectDao.delete(id);
	}

	@Override
	public AccountingSubject get(int id) {
		// TODO Auto-generated method stub
		return accountingSubjectDao.get(id);
	}

	@Override
	public boolean update(AccountingSubject as) {
		// TODO Auto-generated method stub
		return accountingSubjectDao.update(as);
	}

	@Override
	public double calculate(boolean dc) {
		// TODO Auto-generated method stub
		return accountingSubjectDao.calculate(dc);
	}

}
