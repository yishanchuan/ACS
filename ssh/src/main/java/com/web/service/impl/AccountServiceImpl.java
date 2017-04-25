package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.web.dao.AccountDao;
import com.web.entity.AccountSelect;
import com.web.entity.Voucher;
import com.web.service.AccountService;

@Transactional
@Service(value="accountService")
public class AccountServiceImpl implements AccountService{

	@Resource
	private AccountDao accountDao;
	
	public List<AccountSelect> getUsedAccoutingSubject() {
		// TODO Auto-generated method stub
		return accountDao.getUsedAccoutingSubject();
	}

	@Override
	public Voucher getVoucherByVCid(int id) {
		// TODO Auto-generated method stub
		return accountDao.getVoucherByVCid(id);
	}

}
