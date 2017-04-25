package com.web.service;

import java.util.List;

import com.web.entity.AccountSet;

public interface AccountSetService {

	public void add(AccountSet accountSet);
	public boolean delete(int id);
	public boolean update(AccountSet accountSet);
	public void saveOrUpdate(AccountSet accountSet);
	public AccountSet get(int id);
	public List<AccountSet> getAll();
	public AccountSet getDefault();
}
