package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.BankDao;
import com.web.entity.Bank;
import com.web.service.BankService;

@Transactional
@Service("bankService")
public class BankServiceImpl implements BankService {

	@Resource
	private BankDao bankDao;
	
	@Override
	public void add(Bank bank) {
		// TODO Auto-generated method stub
		bankDao.add(bank);
	}

	@Override
	public List<Bank> getAll() {
		// TODO Auto-generated method stub
		return bankDao.getAll();
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return bankDao.delete(id);
	}

	@Override
	public Bank get(int id) {
		// TODO Auto-generated method stub
		return bankDao.get(id);
	}

	@Override
	public boolean update(Bank bank) {
		// TODO Auto-generated method stub
		return bankDao.update(bank);
	}

	@Override
	public void update2(Bank bank) {
		// TODO Auto-generated method stub
		bankDao.update2(bank);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return bankDao.getCount();
	}

}
