package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.AccountSetDao;
import com.web.entity.AccountSet;

@Transactional
@Service(value="accountSetService")
public class AccountSetServiceImpl implements com.web.service.AccountSetService {

	@Resource
	private AccountSetDao accountSetDao;
	@Override
	public void add(AccountSet accountSet) {
		// TODO Auto-generated method stub
		accountSetDao.add(accountSet);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(AccountSet accountSet) {
		// TODO Auto-generated method stub
		return accountSetDao.update(accountSet);
	}

	@Override
	public void saveOrUpdate(AccountSet accountSet) {
		// TODO Auto-generated method stub
		accountSetDao.saveOrUpdate(accountSet);
	}

	@Override
	public AccountSet get(int id) {
		// TODO Auto-generated method stub
		return accountSetDao.get(id);
	}

	@Override
	public List<AccountSet> getAll() {
		// TODO Auto-generated method stub
		return accountSetDao.getAll();
	}

	@Override
	public AccountSet getDefault() {
		// TODO Auto-generated method stub
		return accountSetDao.getDefault();
	}

}
